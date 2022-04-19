import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreateCommunity extends GetView {
  const CreateCommunity({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CreateCommunityController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.close),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(text: "* ", style: TextStyle(color: Colors.red)),
                TextSpan(text: "社区名称")
              ], style: TextStyle(fontSize: 50.w))),
              TextField(
                controller: controller.cNameController,
                maxLength: 20,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50.w),
                decoration: const InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
              ),
              Text("位置", style: TextStyle(fontSize: 50.w)),
              Container(
                height: 100.w,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.amber[300]),
                child: Center(
                  child: Text(
                    "选     择",
                    style: TextStyle(
                        fontSize: 50.w,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Text("社区介绍", style: TextStyle(fontSize: 50.w)),
              SizedBox(
                height: 200.w,
                width: double.infinity,
                child: TextField(
                    controller: controller.cDesController,
                    maxLines: null,
                    maxLength: 200),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CreateCommunityController extends GetxController {
  late TextEditingController cNameController;
  late TextEditingController cDesController;

  @override
  void onInit() {
    super.onInit();
    cNameController = TextEditingController();
    cDesController = TextEditingController();
  }
}
