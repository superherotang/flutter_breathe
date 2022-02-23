import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController textController = TextEditingController();
  late Timer timer;
  var timeCount = 60;
  var checkOnSelect = false.obs;
  var countdownText = "获取验证码".obs;
  var isButtonEnable = true.obs;

  void clickOnSelect() {
    checkOnSelect.value = !checkOnSelect.value;
  }

  void countdown() {
    print(textController.text);
    if (isButtonEnable.value) {
      isButtonEnable.value = false;
      timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
        if (timeCount <= 0) {
          countdownText.value = '重新获取';
          timer.cancel();
          timeCount = 60;
          isButtonEnable.value = true;
        } else {
          timeCount--;
          countdownText.value = "$timeCount" 's';
        }
      });
    }
  }
}
