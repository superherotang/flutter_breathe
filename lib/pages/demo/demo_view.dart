import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'demo_controller.dart';

class DemoView extends GetView<DemoController> {
  const DemoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ElevatedButton(
          child: Text("asd"),
          onPressed: () {
            int aaa = controller.player.duration!.inSeconds;
            print(aaa);
          },
        ),
      ),
    );
  }
}
