import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_breathe/common/apis/posts_api.dart';
import 'package:flutter_breathe/common/apis/user_api.dart';
import 'package:flutter_breathe/common/store/user_store.dart';
import 'package:flutter_breathe/model/posts/posts_model.dart';
import 'package:flutter_breathe/model/postsInfo/posts_info_model.dart';
import 'package:flutter_breathe/model/postsPage/posts_page_model.dart';
import 'package:flutter_breathe/model/request/my_response.dart';
import 'package:flutter_breathe/model/userCount/user_count_model.dart';
import 'package:flutter_breathe/model/userData/user_data_model.dart';
import 'package:flutter_breathe/utils/mock.dart';
import 'package:flutter_breathe/utils/my_toast.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PersonalController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;

  late LinkHeaderNotifier headerNotifier;

//加载
  late AnimationController animationController;
  late Animation<double> animation;
  late ScrollController scrollController;
  String? id;

  var extraPicHeight = 0.0.obs;
  double prevDy = 0.0;

  var fitType = BoxFit.fitWidth.obs;

  var count = 5.obs;

  //用户资料
  late Rx<UserDataModel> userDataModel;
  //用户统计
  late Rx<UserCountModel> userCountModel;

  RxList<PostsInfoModel> myPosts = <PostsInfoModel>[].obs;
  int myCurrent = 1;

  @override
  void onInit() {
    super.onInit();
    id = Get.parameters['id'];
    userCountModel = UserCountModel(0, 0, 0, 0).obs;
    if (id == null) {
      //自己的主页
      userDataModel = UserDataModel(0, "", "", "未登录", "", -1, "", "").obs;
    } else {
      //别人的主页
      userDataModel = UserDataModel(0, "", "", "加载中", "", -1, "", "").obs;
    }
    headerNotifier = LinkHeaderNotifier();
    tabController = TabController(length: 2, vsync: this);
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    animation = Tween(begin: 0.0, end: 0.0).animate(animationController);
    scrollController = ScrollController();
  }

  updatePicHeight(change) {
    if (extraPicHeight.value < 0) {
      return;
    }

    //只有在顶端才可以拉升
    if (scrollController.offset == 0) {
      //初始化前一个
      if (prevDy == 0) {
        prevDy = change;
      }
      if (extraPicHeight.value > 120.w) {
        fitType.value = BoxFit.cover;
      }
      //(1 - (extraPicHeight.value / 1.sh)) 屏占比
      extraPicHeight.value +=
          (change - prevDy) * (1 - (extraPicHeight.value / 1.sh)) / 3;

      prevDy = change;
    }
  }

  runAnimate() {
    animation = Tween(begin: extraPicHeight.value, end: 0.0)
        .animate(animationController)
      ..addListener(() {
        extraPicHeight.value = animation.value;
        if (extraPicHeight.value < 120.w) {
          fitType.value = BoxFit.fitWidth;
        }
      });
    prevDy = 0;
  }

  Future refreshUser() async {
    if (id == null) {
      if (UserStore.to.isLogin) {
        //请求用户信息
        MyResponse myResponseUserData = await UserApi.getUserDataByToken();
        if (myResponseUserData.success) {
          //用户信息持久化
          await UserStore.to
              .setUserData(jsonEncode(myResponseUserData.data["userData"]));
          userDataModel.value =
              UserDataModel.fromJson(myResponseUserData.data["userData"]);
          userDataModel.refresh();
          //请求用户统计
          MyResponse myResponseCound =
              await UserApi.getUserCountByUid(uid: userDataModel.value.uid);

          if (myResponseCound.success) {
            //统计信息持久化
            await UserStore.to
                .setUserCount(jsonEncode(myResponseCound.data["userCount"]));
            userCountModel.value =
                UserCountModel.fromJson(myResponseCound.data["userCount"]);
            userCountModel.refresh();
          } else {
            MyToast(myResponseCound.message);
          }
          await UserStore.to.updataUser();
          refreshMyPost();
        } else {
          UserStore.to.delAll();
          MyToast(myResponseUserData.message);
        }
      } else {
        userDataModel.value = UserDataModel(0, "", "", "未登录", "", -1, "", "");
        userCountModel.value = UserCountModel(0, 0, 0, 0);
        userCountModel.refresh();
        userCountModel.refresh();
      }
    }
  }

  Future refreshMyPost() async {
    myPosts.clear();
    if (!UserStore.to.isLogin) {
      return null;
    }
    myCurrent = 1;
    dynamic myResponse = await PostsApi.getPostsInfoByUid(
        myCurrent, UserStore.to.userData!.uid.toString());
    if (myResponse["success"]) {
      PostsPageModel postsPageModel =
          PostsPageModel.fromJson(myResponse["data"]);
      List<PostsInfoModel> postsInfoModelList=[];
      for (var item in postsPageModel.items) {
        //无敌转换
        myPosts.add(PostsInfoModel.fromJson(jsonDecode(jsonEncode(item))));
      }
    } else {
      MyToast(myResponse.message);
    }
  }

  Future loadMyPost() async {
    //  myPosts.add(PostsModel("uuid",1, 1, 1, 1, 1, 1, "createTime", "updateTime", 1, "postsContent", "postsImages", "postsVideos", "thumbnailImg", "postsAudio"));

    await Future.delayed(Duration(seconds: 2));
  }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }

  @override
  void onReady() async {
    super.onReady();
    //请求用户信息
    refreshUser();
  }
}
