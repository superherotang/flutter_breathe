import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'demo_controller.dart';

class DemoView extends GetView<DemoController> {
  const DemoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('custom selection toolbar handles'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
          child: ExtendedTextField(
            // selectionControls: controller.myTextSelectionControls,
            specialTextSpanBuilder: controller.mySpecialTextSpanBuilder,
            controller: controller.textEditingController,
            maxLines: null,
            // StrutStyle get strutStyle {
            //   if (_strutStyle == null) {
            //     return StrutStyle.fromTextStyle(style, forceStrutHeight: true);
            //   }
            //   return _strutStyle!.inheritFromTextStyle(style);
            // }
            // default strutStyle is not good for WidgetSpan
            strutStyle: const StrutStyle(),
            shouldShowSelectionHandles: _shouldShowSelectionHandles,
            textSelectionGestureDetectorBuilder: ({
              required ExtendedTextSelectionGestureDetectorBuilderDelegate
                  delegate,
              required Function showToolbar,
              required Function hideToolbar,
              required Function? onTap,
              required BuildContext context,
              required Function? requestKeyboard,
            }) {
              return MyCommonTextSelectionGestureDetectorBuilder(
                delegate: delegate,
                showToolbar: showToolbar,
                hideToolbar: hideToolbar,
                onTap: onTap,
                context: context,
                requestKeyboard: requestKeyboard,
              );
            },
          ),
        ),
      ),
    );
  }

  bool _shouldShowSelectionHandles(
    SelectionChangedCause? cause,
    CommonTextSelectionGestureDetectorBuilder selectionGestureDetectorBuilder,
    TextEditingValue editingValue,
  ) {
    // When the text field is activated by something that doesn't trigger the
    // selection overlay, we shouldn't show the handles either.

    //
    // if (!selectionGestureDetectorBuilder.shouldShowSelectionToolbar)
    //   return false;

    if (cause == SelectionChangedCause.keyboard) return false;

    // if (widget.readOnly && _effectiveController.selection.isCollapsed)
    //   return false;

    // if (!_isEnabled) return false;

    if (cause == SelectionChangedCause.longPress) return true;

    if (editingValue.text.isNotEmpty) return true;

    return false;
  }
}

class MyCommonTextSelectionGestureDetectorBuilder
    extends CommonTextSelectionGestureDetectorBuilder {
  MyCommonTextSelectionGestureDetectorBuilder(
      {required ExtendedTextSelectionGestureDetectorBuilderDelegate delegate,
      required Function showToolbar,
      required Function hideToolbar,
      required Function? onTap,
      required BuildContext context,
      required Function? requestKeyboard})
      : super(
          delegate: delegate,
          showToolbar: showToolbar,
          hideToolbar: hideToolbar,
          onTap: onTap,
          context: context,
          requestKeyboard: requestKeyboard,
        );
  @override
  void onTapDown(TapDownDetails details) {
    print(details.localPosition);
    super.onTapDown(details);

    /// always show toolbar
    shouldShowSelectionToolbar = true;
  }

  @override
  bool get showToolbarInWeb => true;
}
