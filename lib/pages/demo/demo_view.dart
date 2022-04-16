import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'demo_controller.dart';

class DemoView extends GetView<DemoController> {
  const DemoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final parameters = Get.parameters["id"];
    return Container(
      color: Colors.amber,
      width: double.infinity,
      height: 500,
      child: Text(
        "$parameters",
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}
