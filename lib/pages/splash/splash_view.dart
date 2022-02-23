import 'package:flutter/material.dart';
import 'package:flutter_hubang/pages/splash/splash_controller.dart';
import 'package:flutter_hubang/utils/adapt.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //跳到主页面
    //隐藏底部栏和顶部状态栏

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset('assets/images/bg.jpg', fit: BoxFit.fill),
          Positioned(
            top: Adapt.topbarH + Adapt.px(50),
            right: Adapt.px(50),
            child: InkWell(
              child: _clipButton(),
              onTap: controller.jump,
            ),
          )
        ],
      ),
    );
  }

  //跳过按钮
  Widget _clipButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        height: Adapt.px(90),
        width: Adapt.px(90),
        color: Colors.black.withOpacity(0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('skip'.tr,
                style: TextStyle(color: Colors.white, fontSize: Adapt.px(26))),
            Obx(() => Text('${controller.count}s',
                style: TextStyle(color: Colors.white, fontSize: Adapt.px(26))))
          ],
        ),
      ),
    );
  }
}
