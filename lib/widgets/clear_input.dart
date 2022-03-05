import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ClearInput extends GetView<ClearInputController> {
  final bool readOnly;
  final void Function()? onTap;
  const ClearInput({Key? key, this.readOnly = false, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ClearInputController());
    //readOnly==true时必须有onTap
    if (readOnly == true) {
      onTap!;
    }
    return InkWell(
      onTap: onTap,
      child: Container(
        //背景与圆角
        decoration: BoxDecoration(
          //border: Border.all(color: Colors.black12, width: 1.0), //边框
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(60.w)),
        ),
        height: 60.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 8.w),
              child: Icon(
                Icons.search_outlined,
                size: 40.w,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: TextField(
                  onTap: onTap,
                  readOnly: readOnly,
                  style: TextStyle(fontSize: 34.w),
                  controller: controller.textEditingController,
                  decoration: const InputDecoration(
                      isCollapsed: true,
                      hintText: '搜索',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(0)),
                ),
              ),
            ),
            Obx(() => controller.isDel.value
                ? Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: InkWell(
                      onTap: () => controller.textEditingController.clear(),
                      child: Icon(
                        Icons.cancel,
                        color: Colors.grey,
                        size: 40.w,
                      ),
                    ),
                  )
                : Container())
          ],
        ),
      ),
    );
  }
}

// IconButton(
//                       icon: const Icon(Icons.cancel),
//                       color: Colors.grey,
//                       iconSize: 40.w,
//                       onPressed: () => controller.textEditingController.clear(),
//                     )

class ClearInputController extends GetxController {
  late TextEditingController textEditingController;
  var isDel = false.obs;
  @override
  void onInit() {
    super.onInit();
    textEditingController = TextEditingController();
    textEditingController.addListener(() {
      //判断删除按钮
      if (textEditingController.text.isEmpty) {
        isDel.value = false;
      } else {
        isDel.value = true;
      }
    });
  }
}
