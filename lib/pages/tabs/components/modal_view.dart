import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_breathe/pages/community/components/create_update_community.dart';
import 'package:flutter_breathe/pages/login/components/create_update_user.dart';

import 'package:flutter_breathe/routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'modal_button.dart';

class ModalView extends GetView {
  const ModalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: GestureDetector(
          onTap: () => Get.back(),
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
                          Get.toNamed(Routes.RELEASE, arguments: 1);
                        },
                        child: const ModalButton("图文")),
                    InkWell(
                        onTap: () {
                          Get.toNamed(Routes.RELEASE, arguments: 2);
                        },
                        child: const ModalButton("视频")),
                    InkWell(
                        onTap: () {
                          Get.toNamed(Routes.RELEASE, arguments: 3);
                        },
                        child: const ModalButton("音频")),
                    InkWell(
                        onTap: () {
                          Get.to(() => const CreateUpdateCommunity());
                        },
                        child: const ModalButton("创建社区")),
                    InkWell(
                        onTap: () {
                          Get.to(() => CreateUpdateUser());
                        },
                        child: const ModalButton("DEMO")),
                  ],
                ),
                SizedBox(
                  height: 80.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: Column(
                        children: [
                          Container(
                            height: 150.w,
                            width: 150.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(width: 5, color: Colors.grey)),
                            child: Icon(
                              Icons.close_sharp,
                              size: 80.w,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "关闭",
                            style: TextStyle(fontSize: 30.w),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
