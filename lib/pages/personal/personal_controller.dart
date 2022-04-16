import 'package:flutter/material.dart';
import 'package:flutter_breathe/common/apis/user_api.dart';
import 'package:flutter_breathe/common/store/user_store.dart';
import 'package:flutter_breathe/model/request/my_response.dart';
import 'package:flutter_breathe/model/userCount/user_count_model.dart';
import 'package:flutter_breathe/model/userData/user_data_model.dart';
import 'package:flutter_breathe/utils/my_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PersonalController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;


  late AnimationController animationController;
  late Animation<double> animation;
  late ScrollController scrollController;
  String? id;

  var extraPicHeight = 0.0.obs;
  double prevDy = 0.0;

  var fitType = BoxFit.fitWidth.obs;

  var count=20.obs;

  //用户资料
  late Rx<UserDataModel> userDataModel;
  //用户统计
  late Rx<UserCountModel> userCountModel;

  @override
  void onInit() {
    super.onInit();
    id = Get.parameters['id'];
    userCountModel = UserCountModel(0, 0, 0, 0).obs;
    if (id == null) {
      //别人的主页
      userDataModel = UserDataModel(0, "", "", "未登录", "", -1, "", "").obs;
    } else {
      //自己的主页
      userDataModel = UserDataModel(0, "", "", "加载中", "", -1, "", "").obs;
    }

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

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }

  @override
  void onReady() async {
    super.onReady();
    //请求用户信息
    if (id == null) {
      if (UserStore.to.isLogin) {
        //请求用户信息
        MyResponse myResponseUserData = await UserApi.getUserDataByToken();
        if (myResponseUserData.success) {
          userDataModel.value =
              UserDataModel.fromJson(myResponseUserData.data["userData"]);
          userDataModel.refresh();
        } else {
          MyToast(myResponseUserData.message);
        }
        //请求用户统计
        MyResponse myResponseCound =
            await UserApi.getUserCountByUid(uid: userDataModel.value.uid);
        if (myResponseCound.success) {
          userCountModel.value =
              UserCountModel.fromJson(myResponseCound.data["userCount"]);
          userCountModel.refresh();
        } else {
          MyToast(myResponseCound.message);
        }
      }
    }

  }
}
