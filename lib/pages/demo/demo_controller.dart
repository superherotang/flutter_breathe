import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

class DemoController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

}






  // Rx<AssetEntity>? entity;
  // Rx<Uint8List>? data;

  // Future<void> pick(BuildContext context) async {
  //   final Size size = MediaQuery.of(context).size;
  //   final double scale = MediaQuery.of(context).devicePixelRatio;
  //   try {
  //     final AssetEntity? _entity = await CameraPicker.pickFromCamera(
  //       context,
  //       pickerConfig: const CameraPickerConfig(enableRecording: true),
  //     );
  //     if (_entity != null && entity?.value != _entity) {
  //       entity = _entity.obs;

  //       final Uint8List? _data = await _entity.thumbnailDataWithSize(
  //         ThumbnailSize(
  //           (size.width * scale).toInt(),
  //           (size.height * scale).toInt(),
  //         ),
  //       );

  //       data = _data?.obs;
  //       refresh();
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
