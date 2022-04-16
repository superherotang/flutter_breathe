import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BoxBackground extends GetView {
  final Widget child;
  const BoxBackground({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20.w)),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 223, 241, 243),
                offset: Offset(0.0, 15.0), //阴影xy轴偏移量
                blurRadius: 10.0, //阴影模糊程度
                spreadRadius: 1.0 //阴影扩散程度
                )
          ]),
      child: child,
    );
  }
}
