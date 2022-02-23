import 'package:flutter/material.dart';
import 'package:flutter_hubang/utils/adapt.dart';
import 'package:get/get.dart';

class PersonalController extends GetxController
    with GetTickerProviderStateMixin {
  late ScrollController scrollController; //滑动
  late TabController tabController;

  var picHeight = 0.0.obs; //图片高度
  var preDy = 0.0;

  var sliverAppBarHeight = 0.0;

  var isPicFold = false.obs;

  BoxFit fitType = BoxFit.fitHeight; //图片类型

  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    tabController = TabController(length: 2, vsync: this);
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    animation = Tween(begin: 0.0, end: 0.0).animate(animationController);

    scrollController.addListener(() =>
        sliverAppBarHeight - Adapt.topbarH <= kToolbarHeight
            ? isPicFold.value = true
            : isPicFold.value = false);
  }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
    scrollController.dispose();
    animationController.dispose();
  }

  updatePicHeight(change) {
    if (picHeight.value < 0) picHeight.value = 0; //重置
    //只允许拉半屏
    if (picHeight.value + Adapt.px(350) > Adapt.height / 2) {
      return;
    }
    //只有在顶端才可以拉升
    if (scrollController.offset == 0) {
      //初始化前一个
      if (preDy == 0) {
        preDy = change;
      }
      picHeight.value += change - preDy;
      preDy = change;
    }
  }

  runAnimate() {
    animation =
        Tween(begin: picHeight.value, end: 0.0).animate(animationController)
          ..addListener(() {
            picHeight.value = animation.value;
          });
  }
}
