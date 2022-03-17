import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_breathe/pages/tabs/tabs_controller.dart';
import 'package:flutter_breathe/routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'modal_button.dart';

class ModalView extends GetView {
  const ModalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tabsController = Get.find<TabsController>();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: GestureDetector(
          onTap: () => tabsController.showModelView(),
          child: Container(
            color: Colors.white.withOpacity(0.8),
            height: 1.sh,
            width: 1.sw,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Wrap(
                  spacing: 60.w,
                  runSpacing: 60.w,
                  children: [
                    InkWell(
                        onTap: () {
                          Get.toNamed(Routes.RELEASE);
                        },
                        child: const ModalButton("帖子")),
                    InkWell(
                        onTap: () {
                          Get.toNamed(Routes.DEMO);
                        },
                        child: const ModalButton("DEMO")),
                    InkWell(
                        onTap: () {
                          print("");
                        },
                        child: const ModalButton("视频")),
                    ModalButton("求助"),
                    ModalButton("悬赏"),
                    ModalButton("提问"),
                  ],
                ),
                SizedBox(
                  height: 80.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => tabsController.showModelView(),
                      child: Container(
                        height: 150.w,
                        width: 150.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.amber),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
