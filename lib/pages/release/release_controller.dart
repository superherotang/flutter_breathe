import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_breathe/model/posts_type.dart';
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

  //当前类型
  var postsType = PostsType.text.obs;
  var typeTheme =
      TypeTheme(Colors.black, true, Colors.black, true, Colors.black, true).obs;

  var haveContent = false.obs;

  ValueNotifier<RxList<AssetEntity>> isDataNull =
      ValueNotifier(<AssetEntity>[].obs);
  //资源类型列表
  var assetEntitysImage = <AssetEntity>[].obs;
  var assetEntitysVideo = <AssetEntity>[].obs;
  var assetEntitysAudio = <AssetEntity>[].obs;
  var assetEntitysBounty = false.obs;

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

  void typeThemeChange() {
    if (textEditingController.text.isEmpty&&assetEntitysImage.isEmpty &&
        assetEntitysVideo.isEmpty &&
        assetEntitysAudio.isEmpty) {
      haveContent.value = false;
    } else {
      haveContent.value = true;
    }
    if (assetEntitysBounty.isTrue) {
      postsType.value = PostsType.bounty;
    } else if (assetEntitysAudio.isNotEmpty) {
      postsType.value = PostsType.sound;
    } else if (assetEntitysVideo.isNotEmpty) {
      postsType.value = PostsType.video;
    } else if (assetEntitysImage.isNotEmpty) {
      postsType.value = PostsType.img;
    } else {
      postsType.value = PostsType.text;
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
        typeTheme.value.soundColor = Colors.black;
        typeTheme.value.soundOnTap = true;
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
        typeTheme.value.imageColor = Colors.black;
        typeTheme.value.imageOnTap = true;
        typeTheme.value.videoColor = Colors.grey;
        typeTheme.value.videoOnTap = false;
        typeTheme.value.soundColor = Colors.black;
        typeTheme.value.soundOnTap = true;
        typeTheme.refresh();
        break;
      case PostsType.bounty:
        typeTheme.value.imageColor = Colors.black;
        typeTheme.value.imageOnTap = true;
        typeTheme.value.videoColor = Colors.grey;
        typeTheme.value.videoOnTap = false;
        typeTheme.value.soundColor = Colors.black;
        typeTheme.value.soundOnTap = true;
        typeTheme.refresh();
        break;
      default:
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

  //图片选择
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
