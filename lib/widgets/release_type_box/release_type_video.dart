import 'package:flutter/material.dart';
import 'package:flutter_breathe/pages/release/release_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class ReleaseTypeVideo extends GetView {
  const ReleaseTypeVideo({
    Key? key,
    required this.data,
  }) : super(key: key);
  final AssetEntity data;
  @override
  Widget build(BuildContext context) {
    var releaseController = Get.find<ReleaseController>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints:
                BoxConstraints(maxHeight: 1.sw / 2, maxWidth: 1.sw / 1.5),
            child: AspectRatio(
              aspectRatio: data.width / data.height > 1 ? 16 / 9 : 9 / 16,
              child: Stack(
                children: [
                  Image(
                      image: AssetEntityImageProvider(data, isOriginal: false)),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        releaseController.assetEntitysVideo.remove(data);
                        releaseController.typeThemeChange();
                      },
                      child: Container(
                        height: 60.w,
                        width: 60.w,
                        color: const Color(0x88000000),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  //Column 解决 Incorrect use of ParentDataWidget.
                  Column(
                    children: [
                      Expanded(
                          child: Center(
                              child: InkWell(
                        onTap: () => releaseController.pickVideo(),
                        child: Container(
                          alignment: Alignment.center,
                          color: const Color(0xaa000000),
                          height: 100.w,
                          width: 150.w,
                          child: Text(
                            "更 换",
                            style:
                                TextStyle(color: Colors.white, fontSize: 45.w),
                          ),
                        ),
                      ))),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
