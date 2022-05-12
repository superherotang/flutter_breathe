import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_breathe/common/apis/posts_api.dart';
import 'package:flutter_breathe/common/apis/upload_api.dart';
import 'package:flutter_breathe/common/store/user_store.dart';
import 'package:flutter_breathe/model/city/location.dart';
import 'package:flutter_breathe/model/myCommunity/my_community_model.dart';
import 'package:flutter_breathe/model/posts_type.dart';
import 'package:flutter_breathe/model/request/my_response.dart';
import 'package:flutter_breathe/pages/home/components/recommend.dart';
import 'package:flutter_breathe/utils/my_toast.dart';
import 'package:flutter_breathe/utils/picker_method.dart';
import 'package:flutter_breathe/widgets/special_text/my_extended_text_selection_controls.dart';
import 'package:flutter_breathe/widgets/special_text/my_special_text_span_builder.dart';
import 'package:get/get.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

class ReleaseController extends GetxController {
  late TextEditingController textEditingController;
  late MySpecialTextSpanBuilder mySpecialTextSpanBuilder;
  late MyTextSelectionControls myTextSelectionControls;
  late FocusNode focusNode;

  //地址
  var location = Location('', '', '');

  var city = "定位".obs;

  //当前类型
  var postsType = PostsType.text.obs;
  var postsTypeCode = 1.obs;

  var typeTheme =
      TypeTheme(Colors.black, true, Colors.black, true, Colors.black, true).obs;

  var haveContent = false.obs;

  //资源类型列表
  var assetEntitysImage = <AssetEntity>[].obs;
  var assetEntitysVideo = <AssetEntity>[].obs;
  var assetEntitysAudio = <AssetEntity>[].obs;

  var selectCommunity = MyCommunityModel(0, "选择社区", "").obs;

  BuildContext? context;

  @override
  void onInit() {
    super.onInit();
    textEditingController = TextEditingController();
    mySpecialTextSpanBuilder = MySpecialTextSpanBuilder();
    myTextSelectionControls = MyTextSelectionControls();
    focusNode = FocusNode();

    textEditingController.addListener(() {
      //判断按钮
      if (textEditingController.text.isEmpty) {
        haveContent.value = false;
      } else {
        haveContent.value = true;
      }
    });
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

  void typeThemeChange() {
    if (textEditingController.text.isEmpty &&
        assetEntitysImage.isEmpty &&
        assetEntitysVideo.isEmpty &&
        assetEntitysAudio.isEmpty) {
      haveContent.value = false;
    } else {
      haveContent.value = true;
    }
    if (assetEntitysAudio.isNotEmpty) {
      postsType.value = PostsType.sound;
      postsTypeCode.value = 4;
    } else if (assetEntitysVideo.isNotEmpty) {
      postsType.value = PostsType.video;
      postsTypeCode.value = 3;
    } else if (assetEntitysImage.isNotEmpty) {
      postsType.value = PostsType.img;
      postsTypeCode.value = 2;
    } else {
      postsType.value = PostsType.text;
      postsTypeCode.value = 1;
    }
    switch (postsType.value) {
      case PostsType.text:
        typeTheme.value.imageColor = Colors.black;
        typeTheme.value.imageOnTap = true;
        typeTheme.value.videoColor = Colors.black;
        typeTheme.value.videoOnTap = true;
        typeTheme.value.soundColor = Colors.black;
        typeTheme.value.soundOnTap = true;
        typeTheme.refresh();
        break;
      case PostsType.img:
        typeTheme.value.imageColor = Colors.black;
        typeTheme.value.imageOnTap = true;
        typeTheme.value.videoColor = Colors.grey;
        typeTheme.value.videoOnTap = false;
        typeTheme.value.soundColor = Colors.grey;
        typeTheme.value.soundOnTap = false;
        typeTheme.refresh();
        break;
      case PostsType.video:
        typeTheme.value.imageColor = Colors.grey;
        typeTheme.value.imageOnTap = false;
        typeTheme.value.videoColor = Colors.black;
        typeTheme.value.videoOnTap = true;
        typeTheme.value.soundColor = Colors.grey;
        typeTheme.value.soundOnTap = false;
        typeTheme.refresh();
        break;
      case PostsType.sound:
        typeTheme.value.imageColor = Colors.grey;
        typeTheme.value.imageOnTap = false;
        typeTheme.value.videoColor = Colors.grey;
        typeTheme.value.videoOnTap = false;
        typeTheme.value.soundColor = Colors.black;
        typeTheme.value.soundOnTap = true;
        typeTheme.refresh();
        break;
      default:
    }
  }

  void releaseContent() async {
    if (selectCommunity.value.id == 0) {
      MyToast("请选择社区");
      return;
    }
    Map<String, dynamic> map = {};
    //上传图片
    if (postsType.value == PostsType.img) {
      List<AssetEntity> assets = assetEntitysImage;
      List<File> files = [];
      for (AssetEntity asset in assets) {
        files.add((await asset.originFile)!);
      }
      String str = await UploadApi.multiUpload(
          files: files, bucketName: "breathe-images");
      map["postsImages"] = str;
    }
    //上传视频
    if (postsType.value == PostsType.video) {
      List<AssetEntity> assets = assetEntitysVideo;
      List<File> files = [];
      File? file = await assets.first.file;
      print("object");
      for (AssetEntity asset in assets) {
        files.add((await asset.originFile)!);
      }
      String str = await UploadApi.multiUpload(
          files: files, bucketName: "breathe-videos");
      map["postsVideos"] = str;
    }
    //上传音频
    if (postsType.value == PostsType.sound) {
      List<AssetEntity> assets = assetEntitysAudio;
      List<File> files = [];
      for (AssetEntity asset in assets) {
        files.add((await asset.originFile)!);
      }
      String str = await UploadApi.multiUpload(
          files: files, bucketName: "breathe-sounds");
      map["postsAudio"] = str;
    }
    map["postsType"] = postsTypeCode.value;
    map["postsContent"] = textEditingController.text;
    map["postsFormat"] = 1;
    map['communityId'] = selectCommunity.value.id;
    map['uid'] = UserStore.to.userData!.uid;

    try {
      MyResponse myResponse =
          MyResponse.fromJson(await PostsApi.releasePosts(map));

      if (myResponse.success) {
        var recommendController = Get.find<RecommendController>();
        Get.until((route) => route.isFirst);
        recommendController.refreshMyPost();
        MyToast(myResponse.message);
      } else {
        MyToast(myResponse.message);
      }
    } on DioError catch (e) {
      MyToast(e.message);
    } catch (e) {
      MyToast(e.toString());
    }
  }

  //获取焦点
  void getFocusFunction(BuildContext context) {
    FocusScope.of(context).requestFocus(focusNode);
  }

//失去焦点
  void unFocusFunction() {
    focusNode.unfocus();
  }

//隐藏键盘而不丢失文本字段焦点：
  void hideKeyBoard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  //图片选择
  Future<void> pickImages() async {
    unFocusFunction();
    var temp = await PickMethod().pickImages(context!, assetEntitysImage);
    if (temp == null) {
      assetEntitysImage.value = <AssetEntity>[];
    } else {
      assetEntitysImage.value = temp;
    }
    typeThemeChange();
  }

  //视频选择
  Future<void> pickVideo() async {
    unFocusFunction();
    var temp = await PickMethod().pickVideo(context!, assetEntitysImage);
    if (temp == null) {
      assetEntitysVideo.value = <AssetEntity>[];
    } else {
      assetEntitysVideo.value = temp;
    }
    typeThemeChange();
  }

  //音频选择
  Future<void> pickAudio() async {
    unFocusFunction();
    var temp = await PickMethod().pickAudio(context!, assetEntitysImage);
    if (temp == null) {
      assetEntitysAudio.value = <AssetEntity>[];
    } else {
      assetEntitysAudio.value = temp;
    }
    typeThemeChange();
  }

  @override
  void onClose() {
    super.onClose();
    textEditingController.dispose();
  }
}

class TypeTheme {
  Color imageColor;
  bool imageOnTap;
  Color videoColor;
  bool videoOnTap;
  Color soundColor;
  bool soundOnTap;

  TypeTheme(this.imageColor, this.imageOnTap, this.videoColor, this.videoOnTap,
      this.soundColor, this.soundOnTap);
}
