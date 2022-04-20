import 'dart:convert';
import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breathe/common/apis/community_api.dart';
import 'package:flutter_breathe/common/apis/upload_api.dart';
import 'package:flutter_breathe/common/store/user_store.dart';
import 'package:flutter_breathe/model/city/location.dart';
import 'package:flutter_breathe/model/request/my_response.dart';
import 'package:flutter_breathe/routes/app_routes.dart';
import 'package:flutter_breathe/utils/my_toast.dart';
import 'package:flutter_breathe/utils/picker_method.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class CreateUpdateCommunity extends GetView {
  const CreateUpdateCommunity({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CreateCommunityController());
    controller.context = context;
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.close),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        //physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            children: [
              Text.rich(TextSpan(children: const [
                TextSpan(text: "* ", style: TextStyle(color: Colors.red)),
                TextSpan(text: "头像")
              ], style: TextStyle(fontSize: 50.w))),
              GestureDetector(
                onTap: () {
                  controller.pickImages();
                },
                child: Obx(
                  () => Container(
                    height: 200.w,
                    width: 200.w,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black)),
                    child: ClipRRect(
                        child: controller.image.isEmpty
                            ? ExtendedImage.asset(
                                "assets/images/default_avatar.png",
                                fit: BoxFit.fill,
                              )
                            : ExtendedImage(
                                image: AssetEntityImageProvider(
                                    controller.image.first,
                                    isOriginal: false),
                                fit: BoxFit.fill,
                              )),
                  ),
                ),
              ),
              Text.rich(TextSpan(children: const [
                TextSpan(text: "* ", style: TextStyle(color: Colors.red)),
                TextSpan(text: "社区名称")
              ], style: TextStyle(fontSize: 50.w))),
              TextField(
                controller: controller.cNameController,
                maxLength: 20,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50.w),
                decoration: const InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
              ),
              Text("位置", style: TextStyle(fontSize: 50.w)),
              SizedBox(height: 10.w),
              Container(
                height: 100.w,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.amber[300]),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Pickers.showAddressPicker(context,
                          initProvince: controller.location.area,
                          initCity: controller.location.city,
                          initTown: controller.location.county,
                          onConfirm: (p, c, t) {
                        controller.selectCity(p, c, t);
                      }, onCancel: (bool isCancel) {
                        controller.location = Location('', '', '');
                        controller.city.value = "选     择";
                      });
                    },
                    child: Obx(
                      () => Text(
                        controller.city.value,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 50.w,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.w),
              Text.rich(TextSpan(children: const [
                TextSpan(text: "* ", style: TextStyle(color: Colors.red)),
                TextSpan(text: "社区介绍")
              ], style: TextStyle(fontSize: 50.w))),
              SizedBox(height: 10.w),
              Container(
                width: double.infinity,
                constraints: BoxConstraints(maxHeight: 400.w),
                child: TextField(
                    focusNode: controller.focusNode,
                    controller: controller.cDesController,
                    maxLines: null,
                    maxLength: 200),
              ),
              SizedBox(height: 30.w),
              InkWell(
                onTap: () => controller.onSubmit(),
                child: Container(
                  height: 120.w,
                  width: 120.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.blue,
                        Colors.white,
                      ],
                    ),
                  ),
                  child: Icon(
                    Icons.arrow_right_alt,
                    size: 80.w,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CreateCommunityController extends GetxController {
  late FocusNode focusNode;
  late ScrollController scrollController;
  late TextEditingController cNameController;
  late TextEditingController cDesController;
  var location = Location('', '', '');
  var city = '选     择'.obs;
  late BuildContext context;
  var image = <AssetEntity>[].obs;

  @override
  void onInit() {
    super.onInit();
    cNameController = TextEditingController();
    cDesController = TextEditingController();
    scrollController = ScrollController();
    focusNode = FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        var bok = MediaQuery.of(context).viewInsets.bottom;
        scrollController.animateTo(bok,
            duration: Duration(milliseconds: 1000), curve: Curves.ease);
      } else {
        scrollController.animateTo(0,
            duration: Duration(milliseconds: 1000), curve: Curves.ease);
      }
    });
  }

  onSubmit() async {
    if (cNameController.text.isEmpty &&
        cDesController.text.isEmpty &&
        image.isEmpty) {
      MyToast("请填写必填项");
    } else {
      AssetEntity asset = image.first;
      File? file = await asset.file;
      String fileUrl = await UploadApi.singleUpload(file: file!);
      MyResponse myResponse = MyResponse.fromJson(
          await CommunityApi.createCommunity(
              uid: UserStore.to.userData!.uid.toString(),
              avatar: fileUrl,
              name: cNameController.text,
              description: cDesController.text,
              location: location.area.isEmpty ||
                      location.city.isEmpty ||
                      location.county.isEmpty
                  ? null
                  : jsonEncode(location)));
      if (myResponse.success) {
        Get.offNamedUntil(
            Routes.CHOME + myResponse.data["cid"], (route) => route.isFirst);
      } else {
        MyToast(myResponse.message);
      }
    }
  }

  //图片选择
  Future<void> pickImages() async {
    var temp = await PickMethod().pickImages(context, image, maxAssets: 1);
    if (temp == null) {
      image.value = <AssetEntity>[];
    } else {
      image.value = temp;
    }
  }

  void selectCity(String p, String c, String? t) {
    if (c == "全部") {
      c = '';
    }
    if (t == null || t == "全部") {
      t = '';
    }
    location = Location(p, c, t);
    if (location.area.isEmpty) {
      city.value = "定位";
    }
    if (location.area.isNotEmpty &&
        location.city.isNotEmpty &&
        location.county.isNotEmpty) {
      city.value = p + '·' + c + '·' + t;
    }
    if (location.area.isNotEmpty &&
        location.city.isNotEmpty &&
        location.county.isEmpty) {
      city.value = p + '·' + c;
    }
    if (location.area.isNotEmpty &&
        location.city.isEmpty &&
        location.county.isEmpty) {
      city.value = p;
    }
  }
}
