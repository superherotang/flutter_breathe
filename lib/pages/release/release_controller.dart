import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  var haveContent = false.obs;

  var assetEntitys = <AssetEntity>[].obs;

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
    var temp = await PickMethod().pickImages(context!, assetEntitys);
    if (temp == null) {
      assetEntitys.value = <AssetEntity>[];
    } else {
      assetEntitys.value = temp;
    }
  }

  @override
  void onClose() {
    super.onClose();
    textEditingController.dispose();
  }
}
