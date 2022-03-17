import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_breathe/widgets/special_text/my_extended_text_selection_controls.dart';
import 'package:flutter_breathe/widgets/special_text/my_special_text_span_builder.dart';
import 'package:get/get.dart';

class ReleaseController extends GetxController {
  late TextEditingController textEditingController;
  late MySpecialTextSpanBuilder mySpecialTextSpanBuilder;
  late MyTextSelectionControls myTextSelectionControls;
  late FocusNode focusNode;

  var haveContent = false.obs;

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

  @override
  void onClose() {
    super.onClose();
    textEditingController.dispose();
  }
}
