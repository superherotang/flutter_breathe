import 'package:flutter/material.dart';
import 'package:flutter_hubang/common/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'release_controller.dart';

class ReleaseView extends GetView<ReleaseController> {
  const ReleaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // 允许键盘事件影响界面
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Get.back(),
          child: Container(
              height: kToolbarHeight,
              alignment: Alignment.center,
              child: Text(
                "取消",
                style: TextStyle(fontSize: 28.w),
              )),
        ),
        title: Text(
          "发帖",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34.w),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20, top: 20.w, bottom: 20.w),
            child: InkWell(
              onTap: () => print("object"),
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.0, 0.9],
                      colors: [
                        AppColor.primaryColor,
                        Color.fromARGB(255, 186, 195, 253),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.w),
                    child: const Text(
                      "发布",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(children: [
        Container(
          padding: EdgeInsets.only(bottom: 200.w),
          child: const TextField(
            maxLines: 100,
            maxLength: 200,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: "输入内容",
                counterStyle: TextStyle(color: Colors.blue),
                border: InputBorder.none),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: double.infinity,
                height: 70.w,
                child: Row(children: [
                  SizedBox(width: 10.w),
                  ActionChip(
                    side: const BorderSide(color: Colors.black45),
                    label: const Text(
                      '添加位置',
                      style: TextStyle(color: Colors.black45),
                    ),
                    backgroundColor: Colors.white,
                    avatar: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/topbg.jpg'),
                    ),
                    onPressed: () {
                      print("object1");
                    },
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: ActionChip(
                        side: const BorderSide(color: Colors.black45),
                        label: const Text(
                          '公开',
                          style: TextStyle(color: Colors.black45),
                        ),
                        backgroundColor: Colors.white,
                        avatar: const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/topbg.jpg'),
                        ),
                        onPressed: () {
                          print("object");
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  )
                ]),
              ),
              Container(
                width: double.infinity,
                height: 90.w,
                color: AppColor.someBackground,
                child: Row(children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        print("object");
                      },
                      child: Icon(
                        Icons.ac_unit,
                        size: 50.w,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Icon(
                        Icons.ac_unit,
                        size: 50.w,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Icon(
                        Icons.ac_unit,
                        size: 50.w,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Icon(
                        Icons.ac_unit,
                        size: 50.w,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Icon(
                        Icons.ac_unit,
                        size: 50.w,
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
