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

  late FocusNode phoneFocusNode;
  late FocusNode codeFocusNode;
  late FocusNode pwdFocusNode;

  ///true == Code : false == Pwd
  var loginMode = true.obs;

  var isPhoneDel = false.obs;
  var isPwdDel = false.obs;

  //倒计时
  late Timer timer;
  var timeCount = 60;
  var checkOnSelect = false.obs;
  var countdownText = "获取验证码".obs;
  var isButtonEnable = true.obs;

  //按钮
  var readOnlyButton = false.obs;
  late BuildContext context;

  @override
  void onInit() {
    super.onInit();
    textEditingPhoneController = TextEditingController();
    textEditingCodeController = TextEditingController();
    textEditingPwdController = TextEditingController();
    phoneFocusNode = FocusNode();
    codeFocusNode = FocusNode();
    pwdFocusNode = FocusNode();
    //监听电话输入框
    textEditingPhoneController.addListener(() {
      readOnlyButton.value = validateReadOnlyButton();
      //判断删除按钮
      if (textEditingPhoneController.text.isEmpty) {
        isPhoneDel.value = false;
      } else {
        isPhoneDel.value = true;
      }
      if (textEditingPhoneController.text.length == 11) {
        if (loginMode.value) {
          phoneFocusNode.unfocus();
          FocusScope.of(context).requestFocus(codeFocusNode);
        } else {
          phoneFocusNode.unfocus();
          FocusScope.of(context).requestFocus(pwdFocusNode);
        }
      }
    });

    //监听密码输入框
    textEditingPwdController.addListener(() {
      readOnlyButton.value = validateReadOnlyButton();
      //判断删除按钮
      if (textEditingPwdController.text.isEmpty) {
        isPwdDel.value = false;
      } else {
        isPwdDel.value = true;
      }
    });
    textEditingCodeController.addListener(() {
      readOnlyButton.value = validateReadOnlyButton();
    });
  }

  void unAllFocus() {
    phoneFocusNode.unfocus();
    codeFocusNode.unfocus();
    pwdFocusNode.unfocus();
  }

  /// 验证手机号
  bool validatePhone(value) {
    // 正则匹配手机号
    RegExp exp = RegExp(
        r'^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$');
    if (!exp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  /// 验证密码
  bool validatePassWord(value) {
    // 正则验证密码
    RegExp exp = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])[A-Za-z0-9]{8,18}$');
    if (!exp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  @override
  void onClose() {
    super.onClose();
    textEditingPhoneController.dispose();
    textEditingCodeController.dispose();
    textEditingPwdController.dispose();
    phoneFocusNode.dispose();
    codeFocusNode.dispose();
    pwdFocusNode.dispose();
  }

  //判读按钮是否可点击
  bool validateReadOnlyButton() {
    if (loginMode.value) {
      //验证空
      if (textEditingPhoneController.text.isNotEmpty &&
          textEditingCodeController.text.isNotEmpty) {
        //验证手机号和验证码是否符合规范
        if (validatePhone(textEditingPhoneController.text) &&
            textEditingCodeController.text.length == 6) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } else {
      //验证空
      if (textEditingPhoneController.text.isNotEmpty &&
          textEditingPwdController.text.isNotEmpty) {
        //验证手机号和密码是否符合规范
        if (validatePhone(textEditingPhoneController.text) &&
            validatePassWord(textEditingPwdController.text)) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    }
  }

  //点击切换验证码登录或者账号登录
  void switchLoginMode() {
    loginMode.value = !loginMode.value;
    textEditingCodeController.clear();
    textEditingPwdController.clear();
  }

  //同意协议切换
  void clickOnSelect() {
    checkOnSelect.value = !checkOnSelect.value;
  }

  //获取验证码倒计时
  void countdown() {
    if (!validatePhone(textEditingPhoneController.text)) {
      Get.snackbar("错误", "请检测手机号是否正确",
          duration: const Duration(milliseconds: 1500));
      return;
    }
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

  //提交操作
  void buttonSubmit() {}
}
