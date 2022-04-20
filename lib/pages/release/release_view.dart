import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breathe/common/color.dart';
import 'package:flutter_breathe/model/city/location.dart';
import 'package:flutter_breathe/model/posts_type.dart';
import 'package:flutter_breathe/pages/release/components/small_button.dart';
import 'package:flutter_breathe/widgets/icon.dart';
import 'package:flutter_breathe/widgets/release_type_box/release_type_audio.dart';
import 'package:flutter_breathe/widgets/release_type_box/release_type_images.dart';
import 'package:flutter_breathe/widgets/release_type_box/release_type_video.dart';
import 'package:flutter_pickers/address_picker/locations_data.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'release_controller.dart';

class ReleaseView extends GetView<ReleaseController> {
  const ReleaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.context = context;

    var flag = Get.arguments;
    switch (flag) {
      case 1:
        controller.pickImages();
        break;
      case 2:
        controller.pickVideo();
        break;
      case 3:
        controller.pickAudio();
        break;
      default:
    }
    return Scaffold(
      resizeToAvoidBottomInset: true, // 允许键盘事件影响界面
      appBar: topAppBar(),
      body: Stack(children: [
        Container(
          padding: EdgeInsets.only(bottom: 30.w),
          constraints: BoxConstraints(
              maxHeight:
                  1.sh - MediaQuery.of(context).viewInsets.bottom - 215.w),
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          const Icon(Icons.ac_unit),
                          SizedBox(width: 10.w),
                          const Text("选择社区"),
                          Expanded(child: Container()),
                          const Icon(Icons.arrow_right_sharp)
                        ],
                      )),
                  SizedBox(height: 15.w),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const Divider(
                      height: 1,
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(minHeight: 200.w),
                    child: inputContent(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 80.w, top: 50.w),
                    child: Obx(
                      () {
                        if (controller.postsType.value == PostsType.video) {
                          return ReleaseTypeVideo(
                            data: controller.assetEntitysVideo.value[0],
                          );
                        } else {
                          return Column(
                            children: [
                              controller.assetEntitysImage.isEmpty
                                  ? Container()
                                  : ReleaseTypeImages(
                                      data: controller.assetEntitysImage.value,
                                    ),
                              SizedBox(
                                height: 15.w,
                              ),
                              controller.assetEntitysAudio.isEmpty
                                  ? Container()
                                  : ReleaseTypeAudio(
                                      data:
                                          controller.assetEntitysAudio.value[0],
                                    ),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: Colors.white,
                width: double.infinity,
                height: 70.w,
                child: Row(children: [
                  SizedBox(width: 10.w),
                  InkWell(
                    onTap: () async {
                      Pickers.showAddressPicker(context,
                          initProvince: controller.location.area,
                          initCity: controller.location.city,
                          initTown: controller.location.county,
                          onConfirm: (p, c, t) {
                        controller.selectCity(p, c, t);
                      }, onCancel: (bool isCancel) {
                        controller.location = Location('', '', '');
                        controller.city.value = "定位";
                      });
                    },
                    child: Obx(
                      () => SmallButton(
                        controller.city.value,
                        svg: SvgIconWidget(
                          "assets/icon/home.svg",
                          color: Colors.white,
                        ),
                      ),
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
              menuItem(context)
            ],
          ),
        )
      ]),
    );
  }

  AppBar topAppBar() {
    return AppBar(
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
              right: 20.w, top: kToolbarHeight / 4, bottom: kToolbarHeight / 4),
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
    );
  }

  //键盘上面菜单
  menuItem(BuildContext context) {
    var controller = Get.find<ReleaseController>();
    return Container(
      width: double.infinity,
      height: 90.w + MediaQuery.of(context).padding.bottom,
      color: AppColor.someBackground,
      child: Obx(
        () => Row(children: [
          Expanded(
            child: InkWell(
              onTap: () => controller.typeTheme.value.imageOnTap
                  ? controller.pickImages()
                  : null,
              child: Icon(
                Icons.image,
                color: controller.typeTheme.value.imageColor,
                size: 50.w,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => controller.typeTheme.value.videoOnTap
                  ? controller.pickVideo()
                  : null,
              child: Icon(
                Icons.videocam_rounded,
                color: controller.typeTheme.value.videoColor,
                size: 50.w,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => controller.typeTheme.value.soundOnTap
                  ? Get.bottomSheet(Container(
                      child: Wrap(
                        children: [
                          ListTile(
                            tileColor: Colors.white,
                            title: const Center(child: Text("录音")),
                            onTap: () {},
                          ),
                          ListTile(
                            tileColor: Colors.white,
                            title: const Center(child: Text("选取文件")),
                            onTap: () async {
                              await controller.pickAudio();
                              Get.back();
                            },
                          ),
                          const ListTile(
                            tileColor: Colors.white,
                            title: Divider(),
                          ),
                          ListTile(
                            tileColor: Colors.white,
                            title: const Center(child: Text("取消")),
                            onTap: () {
                              Get.back();
                            },
                          ),
                        ],
                      ),
                    ))
                  : null,
              child: Icon(
                Icons.surround_sound,
                color: controller.typeTheme.value.soundColor,
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
                Icons.emoji_emotions,
                size: 50.w,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              child: Icon(
                Icons.add_circle_rounded,
                size: 50.w,
              ),
            ),
          ),
        ]),
      ),
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