import 'package:flutter/material.dart';
import 'package:flutter_breathe/widgets/icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SmallButton extends GetView {
  final SvgIconWidget svg;
  final String text;
  const SmallButton(this.text, {Key? key, required this.svg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(150),
          color: Colors.white),
      height: 60.w,
      child: Row(children: [
        Container(
          margin: EdgeInsets.only(left: 5.w),
          height: 40.w,
          width: 40.w,
          padding: EdgeInsets.all(5.w),
          decoration: const BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.all(Radius.circular(150)),
          ),
          child: svg,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(text),
        )
      ]),
    );
  }
}
