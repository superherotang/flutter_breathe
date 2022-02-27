import 'package:flutter/material.dart';
import 'package:flutter_hubang/utils/adapt.dart';
import 'package:get/get.dart';

class LikeButton extends GetView {
  const LikeButton({
    Key? key,
    required this.icon,
    required this.count,
    this.size = 48,
  }) : super(key: key);
  final IconData icon;
  final int count;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("object");
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Adapt.px(30), vertical: Adapt.px(10)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: Adapt.px(size),
            ),
            SizedBox(
              width: Adapt.px(2),
            ),
            Text(
              count.toString(),
              style: TextStyle(fontSize: size! / 3),
            )
          ],
        ),
      ),
    );
  }
}
