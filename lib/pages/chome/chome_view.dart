import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breathe/common/color.dart';
import 'package:flutter_breathe/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'chome_controller.dart';

class ChomeView extends GetView<ChomeController> {
  const ChomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getId = Get.parameters['id'];
    final double statusBarHeight = ScreenUtil().statusBarHeight;
    final double pinnedHeaderHeight =
        //statusBar height
        statusBarHeight +
            //pinned SliverAppBar height in header
            kToolbarHeight;
    return Scaffold(
      body: ExtendedNestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            header(),
          ];
        },
        //1.[pinned sliver header issue](https://github.com/flutter/flutter/issues/22393)
        pinnedHeaderSliverHeightBuilder: () {
          return pinnedHeaderHeight;
        },
        //2.[inner scrollables in tabview sync issue](https://github.com/flutter/flutter/issues/21868)
        onlyOneScrollInBody: true,
        body: Column(children: [
          TabBar(
            controller: controller.tabController,
            tabs: [Tab(text: 'Tab0'), Tab(text: 'Tab1'), Tab(text: 'Tab2')],
          ),
          Expanded(
              child: Stack(
            children: [
              TabBarView(
                controller: controller.tabController,
                children: [
                  widgetone(),
                  Center(
                    child: Text("asd"),
                  ),
                  widgetone()
                ],
              ),
              Container(
                width: double.infinity,
                color: Color(0xBB87CEFA),
                height: 60.w,
                alignment: Alignment.center,
                child: Text(
                  "为您推荐30条内容",
                  style: TextStyle(color: Colors.white, fontSize: 28.w),
                ),
              )
            ],
          ))
        ]),
      ),
    );
  }

  Widget header() {
    return Obx(
      () => SliverAppBar(
        leading: IconButton(
            onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_sharp)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit)),
          IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit))
        ],
        expandedHeight: 370.w -
            ScreenUtil().statusBarHeight +
            controller.listHeight.value +
            controller.overHeight.value,
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 400.w,
                color: AppColor.primaryColor,
              ),
              topContent(),
              extendList()
            ],
          ),
        ),
      ),
    );
  }

  Widget extendList() {
    return Container(
      margin: EdgeInsets.only(top: 350.w),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(top: 15.w),
        child: Column(children: controller.list),
      ),
    );
  }

  Widget topContent() {
    return Container(
      margin:
          EdgeInsets.only(top: ScreenUtil().statusBarHeight + kToolbarHeight),
      width: double.infinity,
      height: 350.w - ScreenUtil().statusBarHeight - kToolbarHeight,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(children: [
          SizedBox(
            height:
                350.w - ScreenUtil().statusBarHeight - kToolbarHeight - 50.w,
            width: 350.w - ScreenUtil().statusBarHeight - kToolbarHeight - 50.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/topbg.jpg",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              //中间间隔
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "人生无常人生无常",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 38.w,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Text.rich(TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(text: "入驻:"),
                        TextSpan(text: Utils.intFormat(10000)),
                        TextSpan(text: "   "),
                        TextSpan(text: "帖子:"),
                        TextSpan(text: Utils.intFormat(10000)),
                      ])),
                  Row(
                    children: [
                      SizedBox(
                        height: 40.w,
                        width: 40.w,
                        child: const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'http://192.168.10.150:9000/breathe-images/1e0c25887594f25a8f57c179427b1713.png'),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        constraints: BoxConstraints(maxWidth: 200.w),
                        child: const Text(
                          "ALEC TANG",
                          style: TextStyle(
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0x33FFFFFF),
                                borderRadius: BorderRadius.circular(10.w)),
                            alignment: Alignment.center,
                            height: 40.w,
                            width: 60.w,
                            child: Text("社管",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.w))),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 14.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular((60.w))),
              child: Text('入驻',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 26.w,
                      fontWeight: FontWeight.bold)),
            ),
          )
        ]),
      ),
    );
  }

  Widget widgetone() {
    return Material(
      color: AppColor.listBackground,
      child: ListView.builder(
        // BoxContent(
        //     synopsis: synopsis,
        //   )
        itemBuilder: (BuildContext context, int index) {
          return Container(color: Colors.amber,width: double.infinity,height: 100);
        },
        itemCount: 20,
      ),
    );
  }
}
