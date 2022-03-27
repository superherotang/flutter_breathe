import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AudioPlayerUnit extends GetView {
  const AudioPlayerUnit({
    Key? key,
    this.height = 55,
    this.playSize = 30,
    this.audioPosition = 0,
    required this.audioDuration,
    this.fontSize = 20,
  }) : super(key: key);
  final double height;
  final double playSize;
  final double fontSize;
  final double audioPosition;
  final double audioDuration;
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AudioPlayerUnitController());
    controller.audioDuration.value = audioDuration;
    controller.audioPosition.value = audioPosition;

    return Column(
      children: [
        Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                child: Icon(
                  Icons.play_arrow,
                  size: playSize,
                ),
              ),
            ),
            Text(
              audioPosition.toInt().toString(),
              style: TextStyle(fontSize: fontSize),
            ),
            Expanded(
                child: Obx(
              () => Slider(
                min: controller.audioPosition.value,
                max: controller.audioDuration.value,
                value: controller.sliderValue.value,
                onChanged: (value) {
                  controller.sliderValue.value = value;
                },
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                audioDuration.toInt().toString(),
                style: TextStyle(fontSize: fontSize),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}

class AudioPlayerUnitController extends GetxController {
  var audioPosition = 0.0.obs;
  var audioDuration = 0.0.obs;
  var sliderValue = 0.0.obs;

  var mPlayerIsInited = false.obs;
  var isPlaying = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
