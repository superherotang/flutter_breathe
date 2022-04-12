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
    return Obx(
      () => SliverAppBar(
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
        //bug
        expandedHeight:
            (430.w - statusBarHeight + controller.extraPicHeight.value) < 0
                ? kToolbarHeight
                : (430.w - statusBarHeight + controller.extraPicHeight.value),
        flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: Stack(
              children: [
                GestureDetector(
                  onTap: () => UserStore().token.value.isEmpty
                      ? RouteAuth().auth(null)
                      : null,
                  child: Image.asset(
                    "assets/images/topbg.jpg",
                    width: 1.sw,
                    height: 330.w + controller.extraPicHeight.value,
                    fit: controller.fitType.value,
                  ),
                ),
                topContent(),
                Positioned(
                    top: 230.w + controller.extraPicHeight.value,
                    left: 1.sw / 2 - 100.w,
                    child: GestureDetector(
                      onTap: () => UserStore().token.value.isEmpty
                          ? RouteAuth().auth(null)
                          : null,
                      child: Container(
                        padding: EdgeInsets.all(5.w),
                        height: 200.w,
                        width: 200.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100.w),
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.w),
                          image: const DecorationImage(
                              image: AssetImage("assets/images/topbg.jpg"),
                              fit: BoxFit.cover),
                        )),
                      ),
                    ))
              ],
            )),
      ),
    );
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
              UserStore().token.value.isEmpty ? RouteAuth().auth(null) : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "帖子",
                style: TextStyle(fontSize: 30.w, height: 1),
              ),
              SizedBox(
                height: 20.w,
              ),
              Text(Utils.intFormat(10000100),
                  style: TextStyle(
                      fontSize: 28.w, fontWeight: FontWeight.bold, height: 1))
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
              UserStore().token.value.isEmpty ? RouteAuth().auth(null) : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "帖子",
                style: TextStyle(fontSize: 30.w, height: 1),
              ),
              SizedBox(
                height: 20.w,
              ),
              Text(Utils.intFormat(10000100),
                  style: TextStyle(
                      fontSize: 28.w, fontWeight: FontWeight.bold, height: 1))
            ],
          ),
        )),
        SizedBox(width: 200.w),
        Expanded(
            child: InkWell(
          onTap: () =>
              UserStore().token.value.isEmpty ? RouteAuth().auth(null) : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "帖子",
                style: TextStyle(fontSize: 30.w, height: 1),
              ),
              SizedBox(
                height: 20.w,
              ),
              Text(Utils.intFormat(10000100),
                  style: TextStyle(
                      fontSize: 28.w, fontWeight: FontWeight.bold, height: 1))
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
              UserStore().token.value.isEmpty ? RouteAuth().auth(null) : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "帖子",
                style: TextStyle(fontSize: 30.w, height: 1),
              ),
              SizedBox(
                height: 20.w,
              ),
              Text(Utils.intFormat(10000100),
                  style: TextStyle(
                      fontSize: 28.w, fontWeight: FontWeight.bold, height: 1))
            ],
          ),
        )),
      ],
    ),
  );
}
