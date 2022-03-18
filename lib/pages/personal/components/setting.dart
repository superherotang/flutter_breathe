import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Setting extends GetView<SettingController> {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: ListView(children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: const Text("账号")),
        ListItem(
          "账号与安全",
          leading: Icons.ac_unit,
          onTap: () => print("object"),
          actions: const Icon(Icons.ac_unit),
        ),
        ListItem(
          "隐私设置",
          leading: Icons.ac_unit,
          onTap: () => print("object"),
          actions: const Icon(Icons.ac_unit),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: const Divider()),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: const Text("通用")),
        ListItem(
          "通知设置",
          leading: Icons.ac_unit,
          onTap: () => print("object"),
          actions: const Icon(Icons.ac_unit),
        ),
        ListItem(
          "通用设置",
          leading: Icons.ac_unit,
          onTap: () => print("object"),
          actions: const Icon(Icons.ac_unit),
        ),
      ]),
    );
  }
}

class ListItem extends GetView {
  const ListItem(
    this.text, {
    Key? key,
    required this.onTap,
    this.leading,
    this.actions,
  }) : super(key: key);
  final String text;
  //点击事件
  final void Function() onTap;
  //前面组件
  final IconData? leading;
  final Widget? actions;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: const Color(0X20000000),
      onTap: onTap,
      //解决Incorrect use of ParentDataWidget.
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              children: [
                leading == null
                    ? Container()
                    : Icon(
                        leading,
                        size: 40.w,
                      ),
                leading == null ? Container() : SizedBox(width: 20.w),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 90.w,
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 28.w),
                  ),
                ),
                Expanded(child: Container()),
                actions ?? Container()
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class SettingController extends GetxController {}
