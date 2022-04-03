import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlideImagePage extends GetView {
  const SlideImagePage({Key? key,required this.images,required this.current}) : super(key: key);
  final List images;
  final int current;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () => Get.back(),
      child: ExtendedImageGesturePageView.builder(
        
          controller: ExtendedPageController(
            initialPage: current,
            pageSpacing: 50,
          ),
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            return ExtendedImage.network(
              images[index],
              fit: BoxFit.contain,
              mode: ExtendedImageMode.gesture,
              initGestureConfigHandler: (ExtendedImageState state) {
                return GestureConfig(
                  //you must set inPageView true if you want to use ExtendedImageGesturePageView
                  inPageView: true,
                  initialScale: 1.0,
                  maxScale: 5.0,
                  animationMaxScale: 6.0,
                  initialAlignment: InitialAlignment.center,
                );
              },
            );
          },
        ),
    );
  }
}