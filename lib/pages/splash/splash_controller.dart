import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_breathe/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  var count = 5.obs;
  late Timer _Timer;

  @override
  void onInit() {
    super.onInit();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    _Timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      count.value--;
      if (count <= 1) {
        _Timer.cancel();
        Future.delayed(const Duration(seconds: 1), () {
          jump();
        });
      }
    });
  }

  @override
  void onClose() {
    super.onClose();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  void jump() {
    Get.offNamed(Routes.TABS);
  }
}
