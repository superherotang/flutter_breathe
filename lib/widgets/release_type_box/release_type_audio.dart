import 'package:flutter/material.dart';
import 'package:flutter_breathe/pages/release/release_controller.dart';
import 'package:flutter_breathe/widgets/audio_player_unit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class ReleaseTypeAudio extends GetView {
  const ReleaseTypeAudio({Key? key, required this.data}) : super(key: key);
  final AssetEntity data;
  @override
  Widget build(BuildContext context) {
    int duration = data.duration;
    var releaseController = Get.find<ReleaseController>();
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: [
            Expanded(
                child: AudioPlayerUnit(audioDuration: duration.toDouble())),
            SizedBox(width: 10.w),
            InkWell(
                child: Icon(Icons.change_circle, size: 60.w),
                onTap: () => releaseController.pickAudio()),
            SizedBox(width: 10.w),
            InkWell(
                child: Icon(Icons.close, size: 60.w),
                onTap: () {
                  releaseController.assetEntitysAudio.remove(data);
                  releaseController.typeThemeChange();
                })
          ],
        ));
  }
}
