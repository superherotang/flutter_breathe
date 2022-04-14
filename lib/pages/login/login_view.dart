import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_breathe/common/apis/user_api.dart';
import 'package:flutter_breathe/common/color.dart';
import 'package:flutter_breathe/common/store/user_store.dart';
import 'package:flutter_breathe/model/login/login_model.dart';
import 'package:flutter_breathe/model/request/my_response.dart';
import 'package:flutter_breathe/service/storage_service.dart';
import 'package:flutter_breathe/utils/my_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.close),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "登录/注册  更精彩",
            style: TextStyle(fontSize: 40.w, fontWeight: FontWeight.bold),
          ),
          Text(
            "未注册的手机号验证通过后将自动注册",
            style: TextStyle(fontSize: 28.w, color: Colors.grey),
          ),
          loginInput()
        ]),
      ),
    );
  }

  //账号输入框
  Widget loginInput() {
    return Padding(
      padding: EdgeInsets.only(top: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //手机输入框
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.all(Radius.circular(60.w)),
            ),
            child: Row(
              children: [
                //选择国家
                InkWell(
                  onTap: () => {},
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 14.w, left: 30.w, bottom: 14.w),
                    child: const Text("+86",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                //竖线
                Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Container(
                    width: 1,
                    height: 40.w,
                    color: Colors.black,
                  ),
                ),
                //输入
                Expanded(
                    child: TextField(
                  focusNode: controller.phoneFocusNode,
                  controller: controller.textEditingPhoneController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  style: TextStyle(
                      fontSize: 36.w, height: 1.1, color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "请输入手机号",
                    hintStyle: TextStyle(fontSize: 30.w),
                    border: InputBorder.none,
                  ),
                )),
                Obx(() => controller.isPhoneDel.value
                    ? Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: InkWell(
                          onTap: () =>
                              controller.textEditingPhoneController.clear(),
                          child: Icon(
                            Icons.cancel,
                            color: Colors.grey,
                            size: 40.w,
                          ),
                        ),
                      )
                    : Container())
              ],
            ),
          ),
          SizedBox(height: 20.w),
          Obx(() => controller.loginMode.value ? codeInput() : pwdInput()),
          SizedBox(height: 20.w),
          loginAgreement(),
          SizedBox(height: 20.w),
          loginButton(),
          SizedBox(height: 20.w),
          thirdPartyLogin()
        ],
      ),
    );
  }

  //验证码输入框
  Widget codeInput() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 40.w),
              child: TextField(
                focusNode: controller.codeFocusNode,
                controller: controller.textEditingCodeController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(6),
                  FilteringTextInputFormatter.digitsOnly
                ],
                style:
                    TextStyle(fontSize: 36.w, height: 1.1, color: Colors.black),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 30.w),
                  hintText: "请输入验证码",
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
              height: 40.w,
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
                      fontSize: 26.w,
                      color: controller.isButtonEnable.value
                          ? Colors.blue
                          : Colors.grey,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }

  //密码输入框
  Widget pwdInput() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 40.w),
              child: TextField(
                focusNode: controller.pwdFocusNode,
                controller: controller.textEditingPwdController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(30),
                ],
                style:
                    TextStyle(fontSize: 36.w, height: 1.1, color: Colors.black),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 30.w),
                  hintText: "请输入密码",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Obx(() => controller.isPwdDel.value
              ? Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: InkWell(
                    onTap: () => controller.textEditingPwdController.clear(),
                    child: Icon(
                      Icons.cancel,
                      color: Colors.grey,
                      size: 40.w,
                    ),
                  ),
                )
              : Container())
        ],
      ),
    );
  }

  //登录协议
  Widget loginAgreement() {
    return Row(
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
                width: 30.w,
                height: 30.w,
              );
            }),
          ),
        ),
        const SizedBox(width: 1),
        Expanded(child: agreement())
      ],
    );
  }

  Widget agreement() {
    return RichText(
      text: TextSpan(children: [
        const TextSpan(text: "已阅读并同意", style: TextStyle(color: Colors.black)),
        TextSpan(
            text: " 用户协议 ",
            style: TextStyle(color: Colors.orange),
            recognizer: TapGestureRecognizer()..onTap = () => print("a")),
        const TextSpan(text: "和", style: TextStyle(color: Colors.black)),
        TextSpan(
            text: " 隐私政策 ",
            style: TextStyle(color: Colors.orange),
            recognizer: TapGestureRecognizer()..onTap = () => print("a")),
      ]),
    );
  }

  void clickLogin(String phone, String code) async {
    MyResponse myResponse =
        await UserApi.smsLoginOrRegister(phone: phone, code: code);
    if (myResponse.success) {
      LoginModel loginModel = LoginModel.fromJson(myResponse.data);
      UserStore().setToken(loginModel.token);
    } else {
      MyToast(myResponse.message);
    }
  }

  //登录按钮
  Widget loginButton() {
    return Obx(
      () => Opacity(
        opacity: controller.readOnlyButton.value ? 1 : 0.6,
        child: ElevatedButton(
          onPressed: controller.readOnlyButton.value
              ? () {
                  controller.unAllFocus();
                  controller.checkOnSelect.value
                      ? clickLogin("18187418771", "111111")
                      : agreementDialog();
                }
              : null,
          child: Container(
            alignment: Alignment.center,
            width: double.maxFinite,
            height: 90.w,
            child: Text(
              "登    录",
              style: TextStyle(fontSize: 50.w, fontWeight: FontWeight.bold),
            ),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
            backgroundColor: MaterialStateProperty.all(AppColor.primaryColor),
          ),
        ),
      ),
    );
  }

  //确认协议弹窗
  Future agreementDialog() {
    return Get.defaultDialog(
      barrierDismissible: false,
      title: "用户协议及隐私保护",
      contentPadding: const EdgeInsets.only(bottom: 0),
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: 80.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            agreement(),
            Text(
              "呼吸将严格保护你的个人信息安全",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.w),
            ),
            ElevatedButton(
              onPressed: () {
                controller.clickOnSelect();
                Get.back();
              },
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                      TextStyle(fontSize: 100.w, color: Colors.red))),
              child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    "同意并登录",
                    style: TextStyle(fontSize: 36.w),
                  )),
            ),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Text(
                "不同意",
                style: TextStyle(fontSize: 24.w),
              ),
            )
          ],
        ),
      ),
    );
  }

  //第三方
  thirdPartyLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          onTap: () => controller.switchLoginMode(),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(60)),
                  border: Border.all(color: Colors.black45)),
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Icon(
                  Icons.password,
                  size: 60.w,
                ),
              )),
        ),
        InkWell(
          onTap: () => print("object"),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(60)),
                  border: Border.all(color: Colors.black45)),
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Icon(
                  Icons.alternate_email_rounded,
                  size: 60.w,
                ),
              )),
        ),
        InkWell(
          onTap: () => print("object"),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(60)),
                  border: Border.all(color: Colors.black45)),
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Icon(
                  Icons.ac_unit,
                  size: 60.w,
                ),
              )),
        ),
        InkWell(
          onTap: () => print("object"),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(60)),
                  border: Border.all(color: Colors.black45)),
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Icon(
                  Icons.woo_commerce,
                  size: 60.w,
                ),
              )),
        ),
      ],
    );
  }
}

// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';

// import 'login_controller.dart';

// class LoginView extends GetView<LoginController> {
//   const LoginView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false, //忽略键盘影响
//       body: SafeArea(
//           child: Stack(
//         children: [
//           backImg(),
//           maskBg(),
//           Column(
//             children: [
//               topAndLogoArea(),
//               Expanded(
//                   child: Container(
//                 width: 1.sw,
//                 child: Column(
//                   children: [
//                     topTip(),
//                     SizedBox(height: 10.w),
//                     inputAccTextArea(),
//                     loginAgreement(),
//                     SizedBox(height: 10.w),
//                     loginButton(),
//                     Expanded(child: Container()), //将第三方置于底部
//                     thirdLoginArea()
//                   ],
//                 ),
//               )),
//             ],
//           )
//         ],
//       )),
//     );
//   }

// //背景
//   Widget backImg() {
//     return Positioned(
//         left: 0,
//         top: 0,
//         right: 0,
//         bottom: 0,
//         child: Image.asset(
//           'assets/images/bg.jpg',
//           fit: BoxFit.fill,
//         ));
//   }

// //遮罩
//   Widget maskBg() {
//     return Container(
//       color: const Color.fromARGB(50, 255, 255, 255),
//     );
//   }

// //顶部及其LOGO
//   Widget topAndLogoArea() {
//     return Container(
//       height: 300.w,
//       alignment: Alignment.topCenter,
//       child: Stack(
//         children: [
//           Positioned(
//             top: 35.w,
//             right: 35.w,
//             child: InkWell(
//               onTap: () {
//                 Get.back();
//               },
//               child: SizedBox(
//                 height: 50.w,
//                 width: 50.w,
//                 child: SvgPicture.asset(
//                   "assets/icon/close.svg",
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 100.w),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   height: 100.w,
//                   width: 100.w,
//                   padding: EdgeInsets.only(right: 10.w),
//                   child: SvgPicture.asset(
//                     "assets/icon/tiger.svg",
//                   ),
//                 ),
//                 Text(
//                   'breathe'.tr,
//                   style: TextStyle(
//                       fontSize: 60.w,
//                       color: Colors.black,
//                       letterSpacing: 6,
//                       fontWeight: FontWeight.w900,
//                       fontFamily: "webfont"),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//       color: Colors.red,
//     );
//   }

// //登录框顶部提示
//   Widget topTip() {
//     return Row(
//       children: [
//         Expanded(
//             child: Container(
//           alignment: Alignment.centerLeft,
//           padding: EdgeInsets.only(left: 60.w),
//           child: Text(
//             "登录",
//             style: TextStyle(
//                 fontSize: 50.w,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white),
//           ),
//         )),
//         Expanded(
//             flex: 2,
//             child: Container(
//               alignment: Alignment.centerRight,
//               padding: EdgeInsets.only(right: 50.w),
//               child: Text(
//                 "未注册的手机号将自动注册",
//                 style: TextStyle(fontSize: 24.w, color: Colors.red),
//               ),
//             )),
//       ],
//     );
//   }

// //账号输入框
//   Widget inputAccTextArea() {
//     return Container(
//       margin: EdgeInsets.only(left: 40.w, right: 40.w),
//       width: double.maxFinite,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           //手机输入框
//           Container(
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: const BorderRadius.all(Radius.circular(30)),
//                 border: Border.all(color: Colors.red)),
//             child: Row(
//               children: [
//                 //选择国家
//                 InkWell(
//                   onTap: () => {},
//                   child: Padding(
//                     padding:
//                         EdgeInsets.only(top: 14.w, left: 30.w, bottom: 14.w),
//                     child: const Text("+86",
//                         style: TextStyle(fontWeight: FontWeight.bold)),
//                   ),
//                 ),
//                 //竖线
//                 Padding(
//                   padding: EdgeInsets.all(20.w),
//                   child: Container(
//                     width: 1,
//                     height: 40.w,
//                     color: Colors.black,
//                   ),
//                 ),
//                 //输入
//                 Expanded(
//                     child: TextField(
//                   controller: controller.textEditingUserController,
//                   keyboardType: TextInputType.text,
//                   decoration: InputDecoration(
//                     hintText: "请输入手机号",
//                     border: InputBorder.none,
//                     suffixIcon: IconButton(
//                       icon: const Icon(Icons.close),
//                       onPressed: () {
//                         controller.textEditingUserController.clear();
//                       },
//                     ),
//                   ),
//                 ))
//               ],
//             ),
//           ),
//           SizedBox(height: 20.w),
//           Container(
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: const BorderRadius.all(Radius.circular(30)),
//                 border: Border.all(color: Colors.red)),
//             child: Row(
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: Container(
//                     padding: EdgeInsets.only(left: 40.w),
//                     child: const TextField(
//                       keyboardType: TextInputType.text,
//                       decoration: InputDecoration(
//                         hintText: "请输入手机号",
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 //竖线
//                 Padding(
//                   padding: const EdgeInsets.only(left: 0),
//                   child: Container(
//                     width: 1,
//                     height: 40.w,
//                     color: Colors.black,
//                   ),
//                 ),
//                 Expanded(
//                   child: MaterialButton(
//                     onPressed: controller.countdown,
//                     child: Obx(
//                       () => Text(controller.countdownText.value,
//                           style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 26.w,
//                             color: controller.isButtonEnable.value
//                                 ? Colors.blue
//                                 : Colors.grey,
//                           )),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   //登录协议
//   Widget loginAgreement() {
//     return Container(
//       margin: EdgeInsets.only(left: 50.w, right: 50.w, top: 15.w),
//       child: Row(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(8),
//             child: InkWell(
//               onTap: () {
//                 controller.clickOnSelect();
//               },
//               child: Obx(() {
//                 return SvgPicture.asset(
//                   controller.checkOnSelect.value
//                       ? "assets/icon/select.svg"
//                       : "assets/icon/unselect.svg",
//                   width: 30.w,
//                   height: 30.w,
//                 );
//               }),
//             ),
//           ),
//           const SizedBox(width: 1),
//           Expanded(
//               child: RichText(
//             text: TextSpan(children: [
//               const TextSpan(text: "我已阅读并同意"),
//               TextSpan(
//                   text: "《用户服务协议及隐私政策》",
//                   style: TextStyle(color: Colors.orange),
//                   recognizer: TapGestureRecognizer()..onTap = () => print("a")),
//             ]),
//           ))
//         ],
//       ),
//     );
//   }

//   //登录按钮
//   Widget loginButton() {
//     return Padding(
//       padding: EdgeInsets.only(left: 40.w, right: 40.w),
//       child: ElevatedButton(
//         onPressed: () {},
//         child: Container(
//           alignment: Alignment.center,
//           width: double.maxFinite,
//           height: 90.w,
//           child: Text(
//             "login in".tr,
//             style: TextStyle(fontSize: 50.w, fontWeight: FontWeight.bold),
//           ),
//         ),
//         style: ButtonStyle(
//           shape: MaterialStateProperty.all(
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
//           backgroundColor: MaterialStateProperty.all(Colors.transparent),
//           side: MaterialStateProperty.all(
//             const BorderSide(color: Colors.red, width: 0.67),
//           ),
//         ),
//       ),
//     );
//   }

// //第三方登录区域
//   Widget thirdLoginArea() {
//     return Container(
//       margin: EdgeInsets.only(left: 40.w, right: 40.w, bottom: 40.w),
//       child: Column(
//         children: <Widget>[
//           Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Container(
//                 width: 120.w,
//                 height: 1,
//                 color: Colors.grey,
//               ),
//               const Text('第三方登录'),
//               Container(
//                 width: 120.w,
//                 height: 1,
//                 color: Colors.grey,
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 30.w,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: const BorderRadius.all(Radius.circular(60)),
//                     border: Border.all(color: Colors.red)),
//                 child: IconButton(
//                   color: Colors.green[200],
//                   // 第三方库icon图标
//                   icon: Icon(Icons.accessible),
//                   iconSize: 70.w,
//                   onPressed: () {},
//                 ),
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: const BorderRadius.all(Radius.circular(60)),
//                     border: Border.all(color: Colors.red)),
//                 child: IconButton(
//                   color: Colors.green[200],
//                   // 第三方库icon图标
//                   icon: Icon(Icons.accessible),
//                   iconSize: 70.w,
//                   onPressed: () {},
//                 ),
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: const BorderRadius.all(Radius.circular(60)),
//                     border: Border.all(color: Colors.red)),
//                 child: IconButton(
//                   color: Colors.green[200],
//                   // 第三方库icon图标
//                   icon: Icon(Icons.accessible),
//                   iconSize: 70.w,
//                   onPressed: () {},
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
