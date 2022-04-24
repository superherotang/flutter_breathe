import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_breathe/common/apis/community_api.dart';
import 'package:flutter_breathe/model/community/community_model.dart';
import 'package:flutter_breathe/model/page/page_model.dart';
import 'package:flutter_breathe/model/request/my_response.dart';
import 'package:flutter_breathe/utils/my_toast.dart';
import 'package:get/get.dart';

class CommunityController extends GetxController {
  RxList<CommunityModel> communityList = <CommunityModel>[].obs;
  int myCurrent = 1;

  //重新加载
  Future refreshMyPost() async {
    communityList.clear();
    myCurrent = 1;
    getPosts(myCurrent);
  }

  //加载更多
  Future loadMyPost() async {
    myCurrent += 1;
    getPosts(myCurrent);
  }

  getPosts(int current) async {
    try {
      MyResponse myResponse = await CommunityApi.getCommunityList(current);

      if (myResponse.success) {
        PageModel pageModel = PageModel.fromJson(myResponse.data);
        for (var item in pageModel.items) {
          communityList
              .add(CommunityModel.fromJson(jsonDecode(jsonEncode(item))));
          communityList.refresh();
        }
      } else {
        MyToast(myResponse.message);
      }
    } on DioError catch (e) {
      MyToast(e.message);
    } catch (e) {
      MyToast(e.toString());
    }
  }
}
