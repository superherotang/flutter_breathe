import 'package:extended_image/extended_image.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breathe/common/color.dart';
import 'package:flutter_breathe/pages/chome/components/c_%20image_List.dart';
import 'package:flutter_breathe/pages/chome/components/new_list.dart';
import 'package:flutter_breathe/utils/utils.dart';
import 'package:flutter_breathe/widgets/status.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'chome_controller.dart';

class ChomeView extends GetView<ChomeController> {
  const ChomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cid = Get.parameters['id'];
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
            tabs: [Tab(text: '最新'), Tab(text: '图文')],
          ),
          Expanded(
              child: Stack(
            children: [
              TabBarView(
                controller: controller.tabController,
                children: [
                  cid == null ? errorStatus() : NewList(cid: cid),
                  cid == null ? errorStatus() : CImageList(cid: cid),
                ],
              ),
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
            child: Obx(
              () => ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: controller.communityHome.value.avatar.isEmpty
                    ? ExtendedImage.asset(
                        "assets/images/default_avatar.png",
                        fit: BoxFit.fill,
                      )
                    : ExtendedImage.network(
                        controller.communityHome.value.avatar,
                        fit: BoxFit.fill,
                        loadStateChanged: (ExtendedImageState state) {
                          switch (state.extendedImageLoadState) {
                            case LoadState.loading:
                              break;
                            case LoadState.completed:
                              break;
                            case LoadState.failed:
                              return Image.asset(
                                "assets/images/image_failed.png",
                                fit: BoxFit.fill,
                              );
                              break;
                            default:
                          }
                        },
                      ),
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
                  Obx(
                    () => Text(
                      controller.communityHome.value.communityName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 38.w,
                          overflow: TextOverflow.ellipsis),
                    ),
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
                        child: ClipOval(
                          child: controller.communityHome.value.avatar.isEmpty
                              ? ExtendedImage.asset(
                                  "assets/images/default_avatar.png",
                                  fit: BoxFit.fill)
                              : ExtendedImage.network(
                                  controller.communityHome.value.avatar,
                                  fit: BoxFit.fill,
                                  loadStateChanged: (ExtendedImageState state) {
                                    switch (state.extendedImageLoadState) {
                                      case LoadState.loading:
                                        break;
                                      case LoadState.completed:
                                        break;
                                      case LoadState.failed:
                                        return Image.asset(
                                          "assets/images/image_failed.png",
                                          fit: BoxFit.fill,
                                        );
                                        break;
                                      default:
                                    }
                                  },
                                ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        constraints: BoxConstraints(maxWidth: 200.w),
                        child: Obx(
                          () => Text(
                            controller.communityHome.value.cAdmin,
                            style: const TextStyle(
                                color: Colors.white,
                                overflow: TextOverflow.ellipsis),
                          ),
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
            onTap: () {
              controller.isAdd.value
                  ? controller.userQuitCommunity()
                  : controller.userAddCommunity();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 14.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular((60.w))),
              child: Obx(
                () => Text(controller.isAdd.value ? '退出' : '入驻',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 26.w,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
