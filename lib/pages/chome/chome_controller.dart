import 'package:flutter/material.dart';
import 'package:flutter_hubang/utils/adapt.dart';
import 'package:get/get.dart';

import 'components/topping.dart';

class ChomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  //公告 置顶
  List<Widget> list = [];
  List<Widget> exList = [];
  List<Widget> overList = [];
  //列表高度
  var listHeight = 0.0.obs;
  //超出高度
  var overHeight = 0.0.obs;

  var isOpen = false.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
    getTopping();
  }

  void getTopping() {
    exList.add(Topping(
      text: "测试测试测试aaa",
      textType: "公告",
    ));
    exList.add(Topping(
      text: "测试测试测试aaa",
      textType: "公告",
    ));
    exList.add(Topping(
      text: "测试测试测试aaa",
      textType: "公告",
    ));

    overList.add(Topping(
      text: "测试测试测试over1",
      textType: "公告",
    ));
    list.addAll(exList);

    listHeight.value += exList.length * Adapt.px(60);

    if (overList.isNotEmpty) {
      listHeight.value += Adapt.px(40);
      list.add(
        InkWell(
          onTap: () {
            isOpen.value = !isOpen.value;
            if (isOpen.value == true) {
              overHeight.value += overList.length * Adapt.px(60);
              list.insertAll(3, overList);
            } else {
              overHeight.value = 0.0;
              list.removeRange(3, 3 + overList.length);
            }
          },
          child: Obx(
            () => Container(
              alignment: Alignment.topCenter,
              color: Colors.grey[200],
              width: double.infinity,
              height: Adapt.px(40),
              child: Icon(
                isOpen.value == false
                    ? Icons.arrow_drop_down_rounded
                    : Icons.arrow_drop_up_rounded,
                size: Adapt.px(40),
              ),
            ),
          ),
        ),
      );
    }
  }
}