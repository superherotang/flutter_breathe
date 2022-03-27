import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class DemoController extends GetxController {
  final player = AudioPlayer();
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    var duration = await player.setUrl(
        'https://downsc.chinaz.net/files/download/sound1/201206/1638.mp3');
    Duration aaa = player.position;
    print(aaa);
  }
}
