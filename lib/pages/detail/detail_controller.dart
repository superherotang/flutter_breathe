import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breathe/common/apis/posts_api.dart';
import 'package:flutter_breathe/model/comment/comment_model.dart';
import 'package:flutter_breathe/model/postsInfo/posts_info_model.dart';
import 'package:flutter_breathe/model/request/my_response.dart';
import 'package:flutter_breathe/utils/my_toast.dart';
import 'package:flutter_breathe/utils/utils.dart';
import 'package:get/get.dart';

import 'components/all_reply.dart';

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

  publishComment() async {
    if (textEditingController.text.isNotEmpty) {
      dynamic response = await PostsApi.insertComment(
          textEditingController.text, postsInfoModel.uid, postsInfoModel.uuid);

      MyResponse myResponse = MyResponse.fromJson(response);
      if (myResponse.success) {
        var allReplyController = Get.find<AllReplyController>();
        allReplyController.myComment.insert(
            0,
            CommentModel(
                postsInfoModel.uuid,
                textEditingController.text,
                0,
                Utils.myDataFormat(DateTime.now().toString()),
                postsInfoModel.nickname,
                postsInfoModel.avatar));
        allReplyController.myComment.refresh();
        textEditingController.text = '';
        focusNode.unfocus();
      } else {
        MyToast("失败");
      }
      try {} on DioError catch (e) {
        MyToast(e.message);
      } catch (e) {
        MyToast(e.toString());
      }
    } else {
      MyToast("请输入内容");
    }
  }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
    textEditingController.dispose();
    focusNode.dispose();
  }
}
