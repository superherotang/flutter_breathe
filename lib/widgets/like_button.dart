import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class LikeButton extends GetView {
  const LikeButton({
    Key? key,
    required this.icon,
    this.count,
    this.size = 36                  ,
  }) : super(key: key);
  final IconData icon;
  final String? count;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("object");
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: size!.w,
            ),
            SizedBox(
              width: 2.w,
            ),
            count == null
                ? Container()
                : Text(
                    count!,
                    style: TextStyle(fontSize: size! / 2.2, height: 1.2),
                  )
          ],
        ),
      ),
    );
  }
}
