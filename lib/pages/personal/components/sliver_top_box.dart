import 'package:flutter/material.dart';
import 'package:flutter_hubang/pages/personal/personal_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

//顶部Box
class SliverTopBox extends GetView<PersonalController> {
  const SliverTopBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Column(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 1.w + controller.picHeight.value,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://goss.cfp.cn/creative/vcg/800/new/VCG211165042753.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 1.w,
                width: double.infinity,
                child: contentInfo(),
              ),
            ],
          ),
          Positioned(
            left: 1.sw / 2 - 1.w,
            top: 1.w + controller.picHeight.value,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60), color: Colors.white),
              padding: EdgeInsets.all(1.w),
              width: 1.w,
              height: 1.w,
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://pinkehao.com/wp-content/uploads/2021/09/2021091104170325.jpg"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //中间四个选项
  Widget contentInfo() {
    return Builder(builder: (context) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              print("_globalKey2.currentContext!.size!.height");
            },
            child: Container(
              alignment: Alignment.center,
              width: 1.sw / 4 - 1.w,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("99+", style: TextStyle(fontSize: 1.w)),
                  Text("虎贴", style: TextStyle(fontSize: 1.w))
                ],
              ),
            ),
          ),
          //竖线
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.w),
            child: VerticalDivider(
              color: Colors.grey,
              width: 1.w,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: 1.sw / 4 - 1.w,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("99+", style: TextStyle(fontSize: 1.w)),
                  Text("关注", style: TextStyle(fontSize: 1.w)),
                ],
              ),
            ),
          ),
          //间隔
          Padding(padding: EdgeInsets.symmetric(horizontal: 1.w)),
          InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: 1.sw / 4 - 1.w,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("99+", style: TextStyle(fontSize: 1.w)),
                  Text("粉丝", style: TextStyle(fontSize: 1.w)),
                ],
              ),
            ),
          ),
          //竖线
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.w),
            child: VerticalDivider(
              color: Colors.grey,
              width: 1.w,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: 1.sw / 4 - 1.w,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("100", style: TextStyle(fontSize: 1.w)),
                  Text("获赞", style: TextStyle(fontSize: 1.w)),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
