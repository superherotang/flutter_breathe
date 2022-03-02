import 'package:flutter/material.dart';
import 'package:flutter_hubang/pages/personal/personal_controller.dart';
import 'package:flutter_hubang/utils/adapt.dart';
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
                  height: Adapt.px(350) + controller.picHeight.value,
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
                height: Adapt.px(120),
                width: double.infinity,
                child: contentInfo(),
              ),
            ],
          ),
          Positioned(
            left: Adapt.width / 2 - Adapt.px(94),
            top: Adapt.px(280) + controller.picHeight.value,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60), color: Colors.white),
              padding: EdgeInsets.all(Adapt.px(6)),
              width: Adapt.px(188),
              height: Adapt.px(188),
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
              width: Adapt.width / 4 - Adapt.px(50),
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("99+",
                      style: TextStyle(
                          fontSize: Adapt.px(40), fontWeight: FontWeight.bold)),
                  Text(
                    "虎贴",
                    style:
                        TextStyle(fontSize: Adapt.px(28), color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
          //竖线
          Padding(
            padding: EdgeInsets.symmetric(vertical: Adapt.px(35)),
            child: VerticalDivider(
              color: Colors.grey,
              width: Adapt.px(4),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: Adapt.width / 4 - Adapt.px(50),
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("99+",
                      style: TextStyle(
                          fontSize: Adapt.px(40), fontWeight: FontWeight.bold)),
                  Text(
                    "关注",
                    style:
                        TextStyle(fontSize: Adapt.px(28), color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
          //间隔
          Padding(padding: EdgeInsets.symmetric(horizontal: Adapt.px(94))),
          InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: Adapt.width / 4 - Adapt.px(50),
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("99+",
                      style: TextStyle(
                          fontSize: Adapt.px(40), fontWeight: FontWeight.bold)),
                  Text(
                    "粉丝",
                    style:
                        TextStyle(fontSize: Adapt.px(28), color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
          //竖线
          Padding(
            padding: EdgeInsets.symmetric(vertical: Adapt.px(35)),
            child: VerticalDivider(
              color: Colors.grey,
              width: Adapt.px(4),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: Adapt.width / 4 - Adapt.px(50),
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("100",
                      style: TextStyle(
                          fontSize: Adapt.px(40), fontWeight: FontWeight.bold)),
                  Text(
                    "获赞",
                    style:
                        TextStyle(fontSize: Adapt.px(28), color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
