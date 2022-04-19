import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class ModalButton extends GetView {
  final String text;
  const ModalButton(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150.w,
          width: 150.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.pinkAccent,
                Colors.yellow,
              ],
            ),
          ),
          child: Icon(Icons.ac_unit,size: 80.w,),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 30.w),
        )
      ],
    );
  }
}
