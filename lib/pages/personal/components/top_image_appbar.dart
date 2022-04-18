import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breathe/common/middlewares/router_auth.dart';
import 'package:flutter_breathe/common/store/user_store.dart';
import 'package:flutter_breathe/pages/personal/components/setting.dart';
import 'package:flutter_breathe/pages/personal/personal_controller.dart';
import 'package:flutter_breathe/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TopImageAppbar extends GetView {
  const TopImageAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<PersonalController>();
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double pinnedHeaderHeight =
        //statusBar height
        statusBarHeight +
            //pinned SliverAppBar height in header
            kToolbarHeight;
    return Obx(() => SliverAppBar(
          pinned: true,
          leading:
              controller.id == null ? null : const Icon(Icons.arrow_back_sharp),
          actions: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: InkWell(
                  onTap: () => Get.to(() => const Setting(),
                      transition: Transition.rightToLeft),
                  child: Icon(
                    Icons.ac_unit,
                    size: 50.w,
                  ),
                ))
          ],
          expandedHeight:
              (430.w - statusBarHeight + controller.extraPicHeight.value) < 0
                  ? kToolbarHeight
                  : (430.w - statusBarHeight + controller.extraPicHeight.value),
          flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Stack(
                children: [
                  GestureDetector(
                      onTap: () => UserStore.to.token.value.isEmpty
                          ? RouteAuth().auth()
                          : null,
                      child: controller.userDataModel.value.background.isEmpty
                          ? Image.asset(
                              "assets/images/personal_top_default.jpg",
                              width: 1.sw,
                              height: 330.w + controller.extraPicHeight.value,
                              fit: controller.fitType.value,
                            )
                          : ExtendedImage.network(
                              controller.userDataModel.value.background,
                              width: 1.sw,
                              height: 330.w + controller.extraPicHeight.value,
                              fit: controller.fitType.value,
                              cache: true,
                            )),
                  topContent(),
                  Positioned(
                      top: 230.w + controller.extraPicHeight.value,
                      left: 1.sw / 2 - 100.w,
                      child: GestureDetector(
                        onTap: () => UserStore.to.token.value.isEmpty
                            ? RouteAuth().auth()
                            : null,
                        child: Container(
                          padding: EdgeInsets.all(5.w),
                          height: 200.w,
                          width: 200.w,
                          child: ClipOval(
                            child: controller
                                    .userDataModel.value.background.isEmpty
                                ? Image.asset(
                                    "assets/images/personal_top_default.jpg",
                                  )
                                : ExtendedImage.network(
                                    controller.userDataModel.value.background,
                                    cache: true,
                                  ),
                          ),
                        ),
                      ))
                ],
              )),
        ));
  }
}

Widget topContent() {
  var controller = Get.find<PersonalController>();
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.w))),
    margin: EdgeInsets.only(
        top: (300.w + controller.extraPicHeight.value) < 0
            ? 0
            : 300.w + controller.extraPicHeight.value),
    width: double.infinity,
    height: 130.w,
    child: Row(
      children: [
        Expanded(
            child: InkWell(
          onTap: () =>
              UserStore.to.token.value.isEmpty ? RouteAuth().auth() : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "获赞",
                style: TextStyle(fontSize: 30.w, height: 1),
              ),
              SizedBox(
                height: 20.w,
              ),
              Obx(
                () => Text(
                    Utils.intFormat(controller.userCountModel.value.like),
                    style: TextStyle(
                        fontSize: 28.w,
                        fontWeight: FontWeight.bold,
                        height: 1)),
              )
            ],
          ),
        )),
        //垂直分割线
        SizedBox(
          width: 1,
          height: 20.w,
          child: const DecoratedBox(
            decoration: BoxDecoration(color: Colors.grey),
          ),
        ),
        Expanded(
            child: InkWell(
          onTap: () =>
              UserStore.to.token.value.isEmpty ? RouteAuth().auth() : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "粉丝",
                style: TextStyle(fontSize: 30.w, height: 1),
              ),
              SizedBox(
                height: 20.w,
              ),
              Obx(
                () => Text(
                    Utils.intFormat(controller.userCountModel.value.fans),
                    style: TextStyle(
                        fontSize: 28.w,
                        fontWeight: FontWeight.bold,
                        height: 1)),
              )
            ],
          ),
        )),
        SizedBox(width: 200.w),
        Expanded(
            child: InkWell(
          onTap: () =>
              UserStore.to.token.value.isEmpty ? RouteAuth().auth() : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "关注",
                style: TextStyle(fontSize: 30.w, height: 1),
              ),
              SizedBox(
                height: 20.w,
              ),
              Obx(
                () => Text(
                    Utils.intFormat(controller.userCountModel.value.follow),
                    style: TextStyle(
                        fontSize: 28.w,
                        fontWeight: FontWeight.bold,
                        height: 1)),
              )
            ],
          ),
        )),
        //垂直分割线
        SizedBox(
          width: 1,
          height: 20.w,
          child: const DecoratedBox(
            decoration: BoxDecoration(color: Colors.grey),
          ),
        ),
        Expanded(
            child: InkWell(
          onTap: () =>
              UserStore.to.token.value.isEmpty ? RouteAuth().auth() : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "历史",
                style: TextStyle(fontSize: 30.w, height: 1),
              ),
              SizedBox(
                height: 20.w,
              ),
              Obx(
                () => Text(
                    Utils.intFormat(controller.userCountModel.value.history),
                    style: TextStyle(
                        fontSize: 28.w,
                        fontWeight: FontWeight.bold,
                        height: 1)),
              )
            ],
          ),
        )),
      ],
    ),
  );
}
