import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PersonalController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;

  late AnimationController animationController;
  late Animation<double> animation;
  late ScrollController scrollController;
  String? id;

  var extraPicHeight = 0.0.obs;
  double prevDy = 0.0;

  var fitType = BoxFit.fitWidth.obs;

  var nickname = '未登录'.obs;
  var uid = '0'.obs;
  var introduction = ''.obs;

  @override
  void onInit() {
    super.onInit();
    id = Get.parameters['id'];
    tabController = TabController(length: 2, vsync: this);
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    animation = Tween(begin: 0.0, end: 0.0).animate(animationController);
    scrollController = ScrollController();
  }

  updatePicHeight(change) {
    if (extraPicHeight.value < 0) {
      return;
    }

    //只有在顶端才可以拉升
    if (scrollController.offset == 0) {
      //初始化前一个
      if (prevDy == 0) {
        prevDy = change;
      }
      if (extraPicHeight.value > 120.w) {
        fitType.value = BoxFit.fitHeight;
      }
      //(1 - (extraPicHeight.value / 1.sh)) 屏占比
      extraPicHeight.value +=
          (change - prevDy) * (1 - (extraPicHeight.value / 1.sh)) / 3;

      prevDy = change;
    }
  }

  runAnimate() {
    animation = Tween(begin: extraPicHeight.value, end: 0.0)
        .animate(animationController)
      ..addListener(() {
        extraPicHeight.value = animation.value;

        if (extraPicHeight.value < 120.w) {
          fitType.value = BoxFit.fitWidth;
        }
      });
    prevDy = 0;
  }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }
}
