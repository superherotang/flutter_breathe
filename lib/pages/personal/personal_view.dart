import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breathe/common/color.dart';
import 'package:flutter_breathe/pages/personal/components/top_image_appbar.dart';
import 'package:flutter_breathe/widgets/more_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'personal_controller.dart';

class PersonalView extends GetView<PersonalController> {
  const PersonalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double pinnedHeaderHeight =
        //statusBar height
        statusBarHeight +
            //pinned SliverAppBar height in header
            kToolbarHeight;
    return Listener(
      onPointerMove: (event) {
        controller.updatePicHeight(event.position.dy);
      },
      onPointerUp: (_) {
        controller.runAnimate();
        controller.animationController.forward(from: 0);
      },
      child: ExtendedNestedScrollView(
        controller: controller.scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return personalTopBuilder();
        },
        pinnedHeaderSliverHeightBuilder: () {
          return pinnedHeaderHeight;
        },
        onlyOneScrollInBody: true,
        body: Column(children: [
          TabBar(
            controller: controller.tabController,
            isScrollable: false,
            tabs: const [Tab(text: 'Tab0'), Tab(text: 'Tab1')],
          ),
          Expanded(
              child: TabBarView(
            controller: controller.tabController,
            children: [
              ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext c, int i) {
                  return Container(
                    alignment: Alignment.center,
                    height: 60.0,
                    child: Text(
                      const Key('Tab1').toString() + ': ListView$i',
                    ),
                  );
                },
              ),
              Center(
                child: Text("CENTER"),
              ),
            ],
          ))
        ]),
      ),
    );
  }
}

List<Widget> personalTopBuilder() {
  final List<Widget> widgets = <Widget>[];
  widgets.add(const TopImageAppbar());
  widgets.add(topContent());

  return widgets;
}

Widget topContent() {
  return SliverToBoxAdapter(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "SuperHeroTang",
          style: TextStyle(
              fontSize: 40.w,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis),
        ),
        SizedBox(height: 10.w),
        Row(
          children: [
            const Text.rich(TextSpan(children: [
              TextSpan(text: "呼吸号: "),
              TextSpan(text: "1231231212")
            ])),
            SizedBox(width: 10.w),
            InkWell(
                child: Icon(
              Icons.ac_unit,
              size: 38.w,
            ))
          ],
        ),
        const Divider(),
        const MoreText(
            "人生无常大肠包小肠,人生无常大肠包小肠,人生无常大肠包小肠,人生无常大肠包小肠,人生无常大肠包小肠,人生无常大肠包小肠,人生无常大肠包小肠,人生无常大肠包小肠,人生无常大肠包小肠,人生无常大肠包小肠,人生无常大肠包小肠,人生无常大肠包小肠,人生无常大肠包小肠,人生无常大肠包小肠,人生无常大肠包小肠,人生无常大肠包小肠,人生无常大肠包小肠,",
            maxLines: 4),
        SizedBox(height: 10.w),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  print("object");
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 10.w),
                    color: AppColor.primaryColor,
                    child: Text(
                      "+ 关注",
                      style: TextStyle(
                          height: 1.5,
                          fontSize: 30.w,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: InkWell(
                onTap: () {
                  print("object");
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 10.w),
                    color: AppColor.primaryColor,
                    child: Text(
                      "私信",
                      style: TextStyle(
                          height: 1.5,
                          fontSize: 30.w,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
          ],
        )
      ]),
    ),
  );
}
