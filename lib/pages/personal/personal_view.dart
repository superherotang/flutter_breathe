import 'dart:convert';

import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breathe/common/color.dart';
import 'package:flutter_breathe/common/middlewares/router_auth.dart';
import 'package:flutter_breathe/common/store/user_store.dart';
import 'package:flutter_breathe/model/synopsis/synopsis.dart';
import 'package:flutter_breathe/pages/personal/components/top_image_appbar.dart';
import 'package:flutter_breathe/routes/app_routes.dart';
import 'package:flutter_breathe/utils/cus_behavior.dart';
import 'package:flutter_breathe/utils/mock.dart';
import 'package:flutter_breathe/widgets/more_text.dart';
import 'package:flutter_breathe/widgets/multi_content.dart';
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
            tabs: const [Tab(text: '我的帖子'), Tab(text: '我的收藏')],
          ),
          Expanded(
              child: TabBarView(
            controller: controller.tabController,
            children: [
              Material(
                child: ScrollConfiguration(
                  behavior: CusBehavior(),
                  child: posts(),
                ),
              ),
              const Center(
                child: Text("CENTER"),
              ),
            ],
          ))
        ]),
      ),
    );
  }
}

Widget posts() {
  Synopsis synopsis = Synopsis.fromJson(json.decode(JsonString.synopsisdata));
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Get.toNamed(Routes.DETAIL + "123");
          },
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.only(bottom: 30.w),
            child: MultiContent(
              text: synopsis.data[0].text,
              resource: synopsis.data[0].resource[0],
              id: synopsis.data[0].id,
              route: Routes.DETAIL,
            ),
          ),
        );
      },
      itemCount: 20,
    ),
  );
}

List<Widget> personalTopBuilder() {
  final List<Widget> widgets = <Widget>[];
  widgets.add(const TopImageAppbar());
  widgets.add(topContent());

  return widgets;
}

Widget topContent() {
  var controller = Get.find<PersonalController>();
  return SliverToBoxAdapter(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GestureDetector(
          onTap: () {
            if (controller.id == null) {
              UserStore().token.value.isEmpty ? RouteAuth().auth(null) : null;
            }
          },
          child: Obx(
            () => Text(
              controller.userDataModel.value.nickname,
              style: TextStyle(
                  fontSize: 40.w,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
        ),
        SizedBox(height: 10.w),
        Row(
          children: [
            Obx(
              () => Text.rich(TextSpan(children: [
                const TextSpan(text: "呼吸号: "),
                TextSpan(
                  text: controller.userDataModel.value.uid.toString(),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      if (controller.id == null) {
                        UserStore().token.value.isEmpty
                            ? RouteAuth().auth(null)
                            : null;
                      }
                    },
                )
              ])),
            ),
          ],
        ),
        const Divider(),
        Obx(() =>
            MoreText(controller.userDataModel.value.description, maxLines: 4)),
        SizedBox(height: 10.w),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  if (controller.id == null) {
                    UserStore().token.value.isEmpty
                        ? RouteAuth().auth(null)
                        : null;
                  }
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
                  if (controller.id == null) {
                    UserStore().token.value.isEmpty
                        ? RouteAuth().auth(null)
                        : null;
                  }
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
