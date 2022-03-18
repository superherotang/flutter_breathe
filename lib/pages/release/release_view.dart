import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breathe/common/color.dart';
import 'package:flutter_breathe/pages/release/components/small_button.dart';
import 'package:flutter_breathe/widgets/icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'release_controller.dart';

class ReleaseView extends GetView<ReleaseController> {
  const ReleaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // 允许键盘事件影响界面
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
            Future.delayed(const Duration(milliseconds: 200));

            Get.back();
          },
          child: Container(
              height: kToolbarHeight,
              alignment: Alignment.center,
              child: Text(
                "取消",
                style: TextStyle(fontSize: 28.w),
              )),
        ),
        title: Text(
          "发帖",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34.w),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
                right: 20.w,
                top: kToolbarHeight / 4,
                bottom: kToolbarHeight / 4),
            child: InkWell(
              onTap: () => print("object"),
              child: Obx(
                () => Opacity(
                  opacity: controller.haveContent.value == false ? 0.5 : 1,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.0, 0.9],
                        colors: [
                          AppColor.primaryColor,
                          Color.fromARGB(255, 186, 195, 253),
                        ],
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: const Text(
                            "发布",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(children: [
        Container(
          padding: EdgeInsets.only(bottom: 100.w),
          constraints: BoxConstraints(
              maxHeight:
                  1.sh - MediaQuery.of(context).viewInsets.bottom - 200.w),
          child: inputContent(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: double.infinity,
                height: 70.w,
                child: Row(children: [
                  SizedBox(width: 10.w),
                  const SmallButton(
                    "定位",
                    svg: SvgIconWidget(
                      "assets/icon/home.svg",
                      color: Colors.white,
                    ),
                  ),
                  Expanded(child: Container()),
                  const SmallButton(
                    "公开",
                    svg: SvgIconWidget(
                      "assets/icon/home.svg",
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  )
                ]),
              ),
              menuItem()
            ],
          ),
        )
      ]),
    );
  }

  //键盘上面菜单
  menuItem() {
    return Container(
      width: double.infinity,
      height: 90.w,
      color: AppColor.someBackground,
      child: Row(children: [
        Expanded(
          child: InkWell(
            onTap: () {
              print("object");
            },
            child: Icon(
              Icons.ac_unit,
              size: 50.w,
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            child: Icon(
              Icons.ac_unit,
              size: 50.w,
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            child: Icon(
              Icons.ac_unit,
              size: 50.w,
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            child: Icon(
              Icons.ac_unit,
              size: 50.w,
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            child: Icon(
              Icons.ac_unit,
              size: 50.w,
            ),
          ),
        ),
      ]),
    );
  }

  //中间内容输入
  Widget inputContent() {
    return ExtendedTextField(
      focusNode: controller.focusNode,
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
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintText: "输入内容",
          counterStyle: TextStyle(color: Colors.blue),
          border: InputBorder.none),
      shouldShowSelectionHandles: _shouldShowSelectionHandles,
      textSelectionGestureDetectorBuilder: ({
        required ExtendedTextSelectionGestureDetectorBuilderDelegate delegate,
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
    super.onTapDown(details);

    /// always show toolbar
    shouldShowSelectionToolbar = true;
  }

  @override
  bool get showToolbarInWeb => true;
}

// TextField(
//       controller: controller.textEditingController,
//       maxLines: null,
//       decoration: const InputDecoration(
//           contentPadding: EdgeInsets.all(10),
//           hintText: "输入内容",
//           counterStyle: TextStyle(color: Colors.blue),
//           border: InputBorder.none),
//     );