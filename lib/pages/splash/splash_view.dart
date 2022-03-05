import 'package:flutter/material.dart';
import 'package:flutter_hubang/pages/splash/splash_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //跳到主页面
    //隐藏底部栏和顶部状态栏
    double rpx = MediaQuery.of(context).size.width / 750;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset('assets/images/bg.jpg', fit: BoxFit.fill),
          Positioned(
            top: 50 * rpx,
            right: 50 * rpx,
            child: InkWell(
              child: _clipButton(rpx),
              onTap: controller.jump,
            ),
          )
        ],
      ),
    );
  }

  //跳过按钮
  Widget _clipButton(double rpx) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.w),
      child: Container(
        height: 90 * rpx,
        width: 90 * rpx,
        color: Colors.black.withOpacity(0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('skip'.tr,
                style: TextStyle(color: Colors.white, fontSize: 26 * rpx)),
            Obx(() => Text('${controller.count}s',
                style: TextStyle(color: Colors.white, fontSize: 26 * rpx)))
          ],
        ),
      ),
    );
  }
}
