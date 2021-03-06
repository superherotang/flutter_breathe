import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breathe/widgets/slide_image_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShowTypeImages extends GetView {
  const ShowTypeImages({Key? key, required this.data}) : super(key: key);
  final List<String> data;
  @override
  Widget build(BuildContext context) {
    if (data.length == 1) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: GestureDetector(
          onTap: () {
            Get.to(() => SlideImagePage(images: data, current: 1));
          },
          child: ExtendedImage.network(
            data.first,
            fit: BoxFit.fitWidth,
            height: 1.sw - 40.w,
            width: 1.sw - 40.w,
            loadStateChanged: (ExtendedImageState state) {
              switch (state.extendedImageLoadState) {
                case LoadState.loading:
                  break;
                case LoadState.completed:
                  break;
                case LoadState.failed:
                  return Image.asset(
                    "assets/images/image_failed.png",
                    fit: BoxFit.fill,
                  );
                default:
              }
            },
          ),
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(), //增加
        shrinkWrap: true, //增加
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (data.length == 2 || data.length == 4) ? 2 : 3,
          crossAxisSpacing: 10.w, //水平 widget的距离
          mainAxisSpacing: 10.w, //垂直 widget的距离
          childAspectRatio: 1.0,
        ),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Get.to(() => SlideImagePage(images: data, current: index));
            },
            child: ExtendedImage.network(
              data[index],
              fit: BoxFit.cover,
              loadStateChanged: (ExtendedImageState state) {
                switch (state.extendedImageLoadState) {
                  case LoadState.loading:
                    break;
                  case LoadState.completed:
                    break;
                  case LoadState.failed:
                    return Image.asset(
                      "assets/images/image_failed.png",
                      fit: BoxFit.fill,
                    );
                    break;
                  default:
                }
              },
            ),
          );
        },
      ),
    );
  }
}
