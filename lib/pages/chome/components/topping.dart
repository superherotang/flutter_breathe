import 'package:flutter/material.dart';
import 'package:flutter_hubang/common/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Topping extends GetView {
  final String textType;
  final String text;
  const Topping({Key? key, required this.text, required this.textType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.w,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.w),
                color: AppColor.primaryColor),
            child: Padding(
              padding: EdgeInsets.all(5.w),
              child: Text(
                textType,
                style: TextStyle(color: Colors.white, fontSize: 22.w),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 40.w),
              child: Text(
                text,
                style:
                    TextStyle(overflow: TextOverflow.ellipsis, fontSize: 30.w),
              ),
            ),
          )
        ],
      ),
    );
  }
}
