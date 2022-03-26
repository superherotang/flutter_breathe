import 'package:flutter/material.dart';
import 'package:flutter_breathe/pages/release/release_controller.dart';
import 'package:flutter_breathe/utils/dashed_rect.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class ReleaseTypeImages extends GetView {
  const ReleaseTypeImages({Key? key, required this.data}) : super(key: key);
  final List<AssetEntity> data;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: GridView(
          physics: const NeverScrollableScrollPhysics(), //增加
          shrinkWrap: true, //增加
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10.w, //水平 widget的距离
            mainAxisSpacing: 10.w, //垂直 widget的距离
            childAspectRatio: 1.0,
          ),
          children: buildImgPick(),
        ));
  }

  List<Widget> buildImgPick() {
    var releaseController = Get.find<ReleaseController>();
    List<Widget> result = [];
    if (data.isNotEmpty) {
      for (var i = 0; i < data.length; i++) {
        result.add(Stack(
          children: [
            Image(
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              image: AssetEntityImageProvider(data[i], isOriginal: false),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  releaseController.assetEntitysImage.remove(data[i]);
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
            )
          ],
        ));
      }

      result.add(InkWell(
        onTap: () {
          releaseController.pickImages();
        },
        child: DashedRect(
          color: Colors.grey,
          strokeWidth: 2.0,
          gap: 10.w,
          child: Icon(
            Icons.add,
            size: 100.w,
          ),
        ),
      ));
    }
    return result;
  }
}


// GridView.builder(
//         physics: const NeverScrollableScrollPhysics(), //增加
//         shrinkWrap: true, //增加
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: (data.length == 2 || data.length == 4) ? 2 : 3,
//           crossAxisSpacing: 10.w, //水平 widget的距离
//           mainAxisSpacing: 10.w, //垂直 widget的距离
//           childAspectRatio: 1.0,
//         ),
//         itemCount: data.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Image(
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: double.infinity,
//             image: AssetEntityImageProvider(data[index], isOriginal: false),
//           );
//         },
//       ),