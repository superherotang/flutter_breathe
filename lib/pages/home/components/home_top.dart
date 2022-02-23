import 'package:flutter/material.dart';
import 'package:flutter_hubang/pages/home/home_controller.dart';
import 'package:flutter_hubang/routes/app_routes.dart';
import 'package:flutter_hubang/utils/adapt.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeTop extends GetView<HomeController> {
  const HomeTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Row(
      children: [
        //选择城市
        selectCity(),
        //搜索框
        Expanded(child: search()),
        add(),
      ],
    );
  }

  Widget selectCity() {
    return InkWell(
      onTap: () async {
        //跳转传值
        var backCity = await Get.toNamed(Routes.CITY,
            arguments: {"city": controller.city.value});

        if (backCity != null) {
          controller.city.value = backCity;
        }
      },
      child: Row(
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: Adapt.px(150)),
            child: Obx(
              () => Text(controller.city.value,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1),
            ),
          ),
          SvgPicture.asset(
            'assets/icon/down.svg',
            width: Adapt.px(32),
            height: Adapt.px(32),
          )
        ],
      ),
    );
  }

  Widget search() {
    return Container(
      height: 34,
      margin: const EdgeInsets.only(left: 15, right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromARGB(255, 240, 240, 240)),
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.search,
              size: 22,
            ),
          ),
          Text(
            "搜索",
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }

  Widget add() {
    return Container(
      padding: const EdgeInsets.only(left: 5),
      child: const Icon(
        Icons.add,
        size: 30,
      ),
    );
  }
}
