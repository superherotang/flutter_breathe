import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hubang/utils/adapt.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //忽略键盘影响
      body: SafeArea(
          child: Stack(
        children: [
          backImg(),
          maskBg(),
          Column(
            children: [
              topAndLogoArea(),
              Expanded(
                  child: Container(
                width: Adapt.width,
                child: Column(
                  children: [
                    topTip(),
                    SizedBox(height: Adapt.px(10)),
                    inputAccTextArea(),
                    loginAgreement(),
                    SizedBox(height: Adapt.px(10)),
                    loginButton(),
                    Expanded(child: Container()), //将第三方置于底部
                    thirdLoginArea()
                  ],
                ),
              )),
            ],
          )
        ],
      )),
    );
  }

//背景
  Widget backImg() {
    return Positioned(
        left: 0,
        top: 0,
        right: 0,
        bottom: 0,
        child: Image.asset(
          'assets/images/bg.jpg',
          fit: BoxFit.fill,
        ));
  }

//遮罩
  Widget maskBg() {
    return Container(
      color: const Color.fromARGB(50, 255, 255, 255),
    );
  }

//顶部及其LOGO
  Widget topAndLogoArea() {
    return Container(
      height: Adapt.px(300),
      alignment: Alignment.topCenter,
      child: Stack(
        children: [
          Positioned(
            top: Adapt.px(35),
            right: Adapt.px(35),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: SizedBox(
                height: Adapt.px(50),
                width: Adapt.px(50),
                child: SvgPicture.asset(
                  "assets/icon/close.svg",
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: Adapt.px(100)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: Adapt.px(100),
                  width: Adapt.px(100),
                  padding: EdgeInsets.only(right: Adapt.px(10)),
                  child: SvgPicture.asset(
                    "assets/icon/tiger.svg",
                  ),
                ),
                Text(
                  'hubang'.tr,
                  style: TextStyle(
                      fontSize: Adapt.px(60),
                      color: Colors.black,
                      letterSpacing: 6,
                      fontWeight: FontWeight.w900,
                      fontFamily: "webfont"),
                )
              ],
            ),
          )
        ],
      ),
      color: Colors.red,
    );
  }

//登录框顶部提示
  Widget topTip() {
    return Row(
      children: [
        Expanded(
            child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: Adapt.px(60)),
          child: Text(
            "登录",
            style: TextStyle(
                fontSize: Adapt.px(50),
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        )),
        Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: Adapt.px(50)),
              child: Text(
                "未注册的手机号将自动注册",
                style: TextStyle(fontSize: Adapt.px(24), color: Colors.red),
              ),
            )),
      ],
    );
  }

//账号输入框
  Widget inputAccTextArea() {
    return Container(
      margin: EdgeInsets.only(left: Adapt.px(40), right: Adapt.px(40)),
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //手机输入框
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                border: Border.all(color: Colors.red)),
            child: Row(
              children: [
                //选择国家
                InkWell(
                  onTap: () => {},
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: Adapt.px(14),
                        left: Adapt.px(30),
                        bottom: Adapt.px(14)),
                    child: const Text("+86",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                //竖线
                Padding(
                  padding: EdgeInsets.all(Adapt.px(20)),
                  child: Container(
                    width: 1,
                    height: Adapt.px(40),
                    color: Colors.black,
                  ),
                ),
                //输入
                Expanded(
                    child: TextField(
                  controller: controller.textController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "请输入手机号",
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        controller.textController.clear();
                      },
                    ),
                  ),
                ))
              ],
            ),
          ),
          SizedBox(height: Adapt.px(20)),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                border: Border.all(color: Colors.red)),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(left: Adapt.px(40)),
                    child: const TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "请输入手机号",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                //竖线
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Container(
                    width: 1,
                    height: Adapt.px(40),
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: controller.countdown,
                    child: Obx(
                      () => Text(controller.countdownText.value,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: Adapt.px(26),
                            color: controller.isButtonEnable.value
                                ? Colors.blue
                                : Colors.grey,
                          )),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  //登录协议
  Widget loginAgreement() {
    return Container(
      margin: EdgeInsets.only(
          left: Adapt.px(50), right: Adapt.px(50), top: Adapt.px(15)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                controller.clickOnSelect();
              },
              child: Obx(() {
                return SvgPicture.asset(
                  controller.checkOnSelect.value
                      ? "assets/icon/select.svg"
                      : "assets/icon/unselect.svg",
                  width: Adapt.px(30),
                  height: Adapt.px(30),
                );
              }),
            ),
          ),
          const SizedBox(width: 1),
          Expanded(
              child: RichText(
            text: TextSpan(children: [
              const TextSpan(text: "我已阅读并同意"),
              TextSpan(
                  text: "《用户服务协议及隐私政策》",
                  style: TextStyle(color: Colors.orange),
                  recognizer: TapGestureRecognizer()..onTap = () => print("a")),
            ]),
          ))
        ],
      ),
    );
  }

  //登录按钮
  Widget loginButton() {
    return Padding(
      padding: EdgeInsets.only(left: Adapt.px(40), right: Adapt.px(40)),
      child: ElevatedButton(
        onPressed: () {},
        child: Container(
          alignment: Alignment.center,
          width: double.maxFinite,
          height: Adapt.px(90),
          child: Text(
            "login in".tr,
            style:
                TextStyle(fontSize: Adapt.px(50), fontWeight: FontWeight.bold),
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          side: MaterialStateProperty.all(
            const BorderSide(color: Colors.red, width: 0.67),
          ),
        ),
      ),
    );
  }

//第三方登录区域
  Widget thirdLoginArea() {
    return Container(
      margin: EdgeInsets.only(
          left: Adapt.px(40), right: Adapt.px(40), bottom: Adapt.px(40)),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: Adapt.px(120),
                height: 1,
                color: Colors.grey,
              ),
              const Text('第三方登录'),
              Container(
                width: Adapt.px(120),
                height: 1,
                color: Colors.grey,
              ),
            ],
          ),
          SizedBox(
            height: Adapt.px(30),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(60)),
                    border: Border.all(color: Colors.red)),
                child: IconButton(
                  color: Colors.green[200],
                  // 第三方库icon图标
                  icon: Icon(Icons.accessible),
                  iconSize: Adapt.px(70),
                  onPressed: () {},
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(60)),
                    border: Border.all(color: Colors.red)),
                child: IconButton(
                  color: Colors.green[200],
                  // 第三方库icon图标
                  icon: Icon(Icons.accessible),
                  iconSize: Adapt.px(70),
                  onPressed: () {},
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(60)),
                    border: Border.all(color: Colors.red)),
                child: IconButton(
                  color: Colors.green[200],
                  // 第三方库icon图标
                  icon: Icon(Icons.accessible),
                  iconSize: Adapt.px(70),
                  onPressed: () {},
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
