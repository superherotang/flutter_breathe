import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breathe/common/apis/community_api.dart';
import 'package:flutter_breathe/model/myCommunity/my_community_model.dart';
import 'package:flutter_breathe/model/request/my_response.dart';
import 'package:flutter_breathe/pages/release/release_controller.dart';
import 'package:flutter_breathe/utils/my_toast.dart';
import 'package:flutter_breathe/widgets/loading_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PickCommunity extends GetView {
  final String uid;
  const PickCommunity({Key? key, required this.uid}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PickCommunityController());
    controller.uid = uid;
    return LoadingView(
        future: controller.refreshMyPost(),
        doneWidget: Obx(
          () => ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  var releaseController = Get.find<ReleaseController>();
                  releaseController.selectCommunity.value =
                      controller.myCommunity[index];
                  Get.back();
                },
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.w),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 100.w,
                              height: 100.w,
                              child: ClipOval(
                                child: controller
                                        .myCommunity[index].avatar.isEmpty
                                    ? Image.asset(
                                        "assets/images/personal_top_default.jpg",
                                      )
                                    : ExtendedImage.network(
                                        controller.myCommunity[index].avatar,
                                        fit: BoxFit.fill,
                                        loadStateChanged:
                                            (ExtendedImageState state) {
                                          switch (
                                              state.extendedImageLoadState) {
                                            case LoadState.loading:
                                              break;
                                            case LoadState.completed:
                                              break;
                                            case LoadState.failed:
                                              return Image.asset(
                                                "assets/images/image_failed.png",
                                                fit: BoxFit.fill,
                                              );
                                            default:
                                          }
                                        },
                                      ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Text(
                              controller.myCommunity[index].communityName,
                              style: TextStyle(fontSize: 50.w),
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      height: 5.w,
                      indent: 20.w,
                      endIndent: 20.w,
                      color: Colors.grey,
                    ),
                  ],
                ),
              );
            },
            itemCount: controller.myCommunity.length,
          ),
        ));
  }
}

class PickCommunityController extends GetxController {
  RxList<MyCommunityModel> myCommunity = <MyCommunityModel>[].obs;
  int myCurrent = 1;
  String uid = '';

  //重新加载
  Future refreshMyPost() async {
    myCommunity.clear();
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
      MyResponse myResponse = await CommunityApi.getMyCommunity(uid);

      if (myResponse.success) {
        List<dynamic> itmes = myResponse.data['myComments'];
        for (var item in itmes) {
          //无敌转换
          myCommunity
              .add(MyCommunityModel.fromJson(jsonDecode(jsonEncode(item))));
          myCommunity.refresh();
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
