import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NullContent extends GetView {
  const NullContent({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset("assets/images/nul_content.png"),
          Text(
            "空空如也",
            style: TextStyle(fontSize: 36.w),
          )
        ],
      ),
    );
  }
}
