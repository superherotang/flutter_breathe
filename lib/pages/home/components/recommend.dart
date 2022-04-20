import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_breathe/common/apis/posts_api.dart';
import 'package:flutter_breathe/model/postsInfo/posts_info_model.dart';
import 'package:flutter_breathe/model/postsPage/posts_page_model.dart';
import 'package:flutter_breathe/utils/my_toast.dart';
import 'package:flutter_breathe/widgets/keep_alive_wrapper.dart';
import 'package:flutter_breathe/widgets/loading_view.dart';
import 'package:flutter_breathe/widgets/show_box.dart';
import 'package:flutter_breathe/widgets/status.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';

class Recommend extends GetView {
  const Recommend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(RecommendController());
    return KeepAliveWrapper(
      child: LoadingView(
          future: controller.refreshMyPost(),
          doneWidget: Obx(() => EasyRefresh(
                emptyWidget: controller.myPosts.isEmpty ? nullStatus() : null,
                header: PhoenixHeader(),
                footer: ClassicalFooter(enableHapticFeedback: true),
                onRefresh: () async {
                  controller.refreshMyPost();
                },
                onLoad: () async {
                  controller.loadMyPost();
                },
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ShowBox(postsInfoModel: controller.myPosts[index]);
                  },
                  itemCount: controller.myPosts.length,
                ),
              ))),
    );
  }
}

class RecommendController extends GetxController {
  RxList<PostsInfoModel> myPosts = <PostsInfoModel>[].obs;
  int myCurrent = 1;

  //重新加载
  Future refreshMyPost() async {
    myPosts.clear();
    myCurrent = 1;
    getPosts(myCurrent);
  }

  //加载更多
  Future loadMyPost() async {
    myCurrent += 1;
    getPosts(myCurrent);
  }

  getPosts(int current) async {
    dynamic myResponse;
    try {
      myResponse = await PostsApi.getAllPostsInfo(current);
      if (myResponse["success"]) {
        PostsPageModel postsPageModel =
            PostsPageModel.fromJson(myResponse["data"]);
        for (var item in postsPageModel.items) {
          //无敌转换
          myPosts.add(PostsInfoModel.fromJson(jsonDecode(jsonEncode(item))));
          myPosts.refresh();
        }
      } else {
        MyToast(myResponse["message"]);
      }
    } catch (e) {
      MyToast(e.toString());
    }
  }
}


    //  ListView.builder(
    //   itemBuilder: (BuildContext context, int index) {
    //     return ShowBox(
    //       postsInfoModel: PostsInfoModel(
    //           "uuid",
    //           1,
    //           1,
    //           1,
    //           1,
    //           1,
    //           1,
    //           "createTime",
    //           "updateTime",
    //           1,
    //           "postsContent",
    //           "postsImages",
    //           "postsVideos",
    //           "thumbnailImg",
    //           "postsAudio",
    //           "nickname",
    //           "avatar",
    //           0,
    //           0,
    //           0,
    //           "communityName"),
    //     );
    //   },
    //   itemCount: 20,
    // );