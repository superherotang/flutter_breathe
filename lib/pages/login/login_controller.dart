import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //手机号
  late TextEditingController textEditingPhoneController;
  //验证码
  late TextEditingController textEditingCodeController;
  //密码
  late TextEditingController textEditingPwdController;

  //true == Code : false == Pwd
  var loginMode = true.obs;

  var isPhoneDel = false.obs;
  var isPwdDel = false.obs;

  late Timer timer;
  var timeCount = 60;
  var checkOnSelect = false.obs;
  var countdownText = "获取验证码".obs;
  var isButtonEnable = true.obs;

  @override
  void onInit() {
    super.onInit();
    textEditingPhoneController = TextEditingController();
    textEditingCodeController = TextEditingController();
    textEditingPwdController = TextEditingController();
    //监听电话输入框
    textEditingPhoneController.addListener(() {
      //判断删除按钮
      if (textEditingPhoneController.text.isEmpty) {
        isPhoneDel.value = false;
      } else {
        isPhoneDel.value = true;
      }
    });

    //监听密码输入框
    textEditingPwdController.addListener(() {
      //判断删除按钮
      if (textEditingPwdController.text.isEmpty) {
        isPwdDel.value = false;
      } else {
        isPwdDel.value = true;
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    textEditingPhoneController.dispose();
    textEditingCodeController.dispose();
    textEditingPwdController.dispose();
  }

  void switchLoginMode() {
    loginMode.value = !loginMode.value;
    textEditingCodeController.clear();
    textEditingPwdController.clear();
  }

  void clickOnSelect() {
    checkOnSelect.value = !checkOnSelect.value;
  }

  void countdown() {
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
