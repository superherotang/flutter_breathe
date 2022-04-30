import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'demo_controller.dart';

class DemoView extends GetView<DemoController> {
  const DemoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DemoController());
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          GestureDetector(
            onTap: () => controller.sendMsg(),
            child: Container(
              color: Colors.amber,
              width: double.infinity,
              height: 100,
            ),
          ),
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Text(controller.strList[index],
                      style: TextStyle(fontSize: 30));
                },
                itemCount: controller.strList.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
