import 'package:flutter/material.dart';
import 'package:flutter_breathe/model/postsInfo/posts_info_model.dart';
import 'package:get/get.dart';

class DetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  late TextEditingController textEditingController;
  late PostsInfoModel postsInfoModel;
  late FocusNode focusNode;

  var isFocus = false.obs;
  //  = PostsInfoModel("0", 0, 0, 0, 0, 0,
  //     0, "", "", 0, "无内容", "", "", "", "", "", "", 0, 0, 0, "无")
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 2);
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    focusNode.addListener(() {
      isFocus.value = focusNode.hasFocus;
    });
    postsInfoModel = Get.arguments;
    print("object");
  }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
    textEditingController.dispose();
    focusNode.dispose();
  }
}
