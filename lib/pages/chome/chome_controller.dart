import 'package:flutter/material.dart';
import 'package:flutter_breathe/common/apis/community_api.dart';
import 'package:flutter_breathe/model/announcement/announcement.dart';
import 'package:flutter_breathe/model/communityHome/community_home.dart';
import 'package:flutter_breathe/model/request/my_response.dart';
import 'package:flutter_breathe/utils/my_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'components/topping.dart';

class ChomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  //公告 置顶
  RxList<Widget> list = <Widget>[].obs;
  RxList<Widget> exList = <Widget>[].obs;
  RxList<Widget> overList = <Widget>[].obs;
  //列表高度
  var listHeight = 0.0.obs;
  //超出高度
  var overHeight = 0.0.obs;

  var isOpen = false.obs;
  Rx<CommunityHome> communityHome =
      CommunityHome("", "加载中", -1, "加载中", "", "", "").obs;

  RxList<Announcement> announcementList = <Announcement>[].obs;


  
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
    getTopping();
    getCommunityInfo();
  }

  //主页信息
  getCommunityInfo() async {
    if (Get.parameters['id'] == null) {
    } else {
      String cid = Get.parameters['id']!;

      try {
        MyResponse myResponse =
            await CommunityApi.getCommunityInfo(Get.parameters['id']!);
        if (myResponse.success) {
          communityHome.value = CommunityHome.fromJson(myResponse.data);
          communityHome.refresh();
        } else {
          MyToast(myResponse.message);
        }
      } catch (e) {
        MyToast(e.toString());
      }
    }
  }


  //顶部公告
  void getTopping() async {
    if (Get.parameters['id'] == null) {
    } else {
      String cid = Get.parameters['id']!;

      try {
        MyResponse myResponse =
            await CommunityApi.getCommunityAnnouncement(Get.parameters['id']!);
        if (myResponse.success) {
          List temp = myResponse.data['announcement'];
          for (var item in temp) {
            Announcement announcement = Announcement.fromJson(item);
            announcementList.add(announcement);
          }
          announcementList.refresh();
          if (announcementList.length < 3) {
            for (var item in announcementList) {
              exList.add(Topping(
                text: item.postsContent,
                textType: item.contentType == 1 ? "公告" : "社规",
              ));
            }
          } else {
            for (var i = 0; i < 3; i++) {
              exList.add(Topping(
                text: announcementList[i].postsContent,
                textType: announcementList[i].contentType == 1 ? "公告" : "社规",
              ));
            }
            for (var i = 3; i < announcementList.length; i++) {
              overList.add(Topping(
                text: announcementList[i].postsContent,
                textType: announcementList[i].contentType == 1 ? "公告" : "社规",
              ));
            }
          }
        } else {
          MyToast(myResponse.message);
        }
      } catch (e) {
        MyToast(e.toString());
      }
    }
   
    list.addAll(exList);

    listHeight.value += exList.length * 60.w;

    if (overList.isNotEmpty) {
      listHeight.value += 40.w;
      list.add(
        InkWell(
          onTap: () {
            isOpen.value = !isOpen.value;
            if (isOpen.value == true) {
              overHeight.value += overList.length * 60.w;
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
              height: 40.w,
              child: Icon(
                isOpen.value == false
                    ? Icons.arrow_drop_down_rounded
                    : Icons.arrow_drop_up_rounded,
                size: 40.w,
              ),
            ),
          ),
        ),
      );
    }
  }
}
