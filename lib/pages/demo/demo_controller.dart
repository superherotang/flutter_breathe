import 'package:flutter/material.dart';
import 'package:flutter_breathe/widgets/special_text/my_extended_text_selection_controls.dart';
import 'package:flutter_breathe/widgets/special_text/my_special_text_span_builder.dart';
import 'package:get/get.dart';

class DemoController extends GetxController {
  late TextEditingController textEditingController;
  late MySpecialTextSpanBuilder mySpecialTextSpanBuilder;
  late MyTextSelectionControls myTextSelectionControls;

  @override
  void onInit() {
    super.onInit();
    mySpecialTextSpanBuilder = MySpecialTextSpanBuilder();
    myTextSelectionControls = MyTextSelectionControls();
    textEditingController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
