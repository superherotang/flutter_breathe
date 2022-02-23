import 'package:flutter/material.dart';
import 'package:flutter_hubang/utils/adapt.dart';
import 'package:get/get.dart';

class ClearInput extends GetView<ClearInputController> {
  const ClearInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ClearInputController());
    return Expanded(
      child: Container(
        //背景与圆角
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 1.0), //边框
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(Adapt.px(60))),
        ),
        alignment: Alignment.center,
        height: Adapt.px(70),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: Adapt.px(20), top: Adapt.px(8)),
              child: Icon(
                Icons.search_outlined,
                size: Adapt.px(46),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: Adapt.px(20)),
                child: TextField(
                  style: TextStyle(fontSize: Adapt.px(38)),
                  controller: controller.textEditingController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: Adapt.px(13)),
                      hintText: '搜索',
                      border: InputBorder.none),
                ),
              ),
            ),
            Obx(() => controller.isDel.value
                ? IconButton(
                    icon: const Icon(Icons.cancel),
                    color: Colors.grey,
                    iconSize: Adapt.px(40),
                    onPressed: () => controller.textEditingController.clear(),
                  )
                : Container())
          ],
        ),
      ),
    );
  }
}

class ClearInputController extends GetxController {
  late TextEditingController textEditingController;
  var isDel = false.obs;
  @override
  void onInit() {
    super.onInit();
    textEditingController = TextEditingController();
    textEditingController.addListener(() {
      //判断删除按钮
      if (textEditingController.text.isEmpty) {
        isDel.value = false;
      } else {
        isDel.value = true;
      }
    });
  }
}
