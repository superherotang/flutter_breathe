import 'package:flutter/material.dart';
import 'package:flutter_hubang/model/tag_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Tag extends StatelessWidget {
  const Tag({
    Key? key,
    required this.tagType,
    required this.count,
  }) : super(key: key);
  final int count;
  final TagType tagType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: judgeColor(tagType)),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.w),
      child: Text(
        judgeText(tagType, count),
        style: TextStyle(color: Colors.white, fontSize: 24.w),
      ),
    );
  }

  String judgeText(TagType tagType, int count) {
    late String text;
    switch (tagType) {
      case TagType.bounty:
        text = "赏金";
        break;
      case TagType.img:
        text = "图片+" + count.toString();
        break;
      case TagType.sound:
        text = "声音+" + count.toString();
        break;
      case TagType.video:
        text = "视频+" + count.toString();
        break;
      default:
        text = "未知";
    }
    return text;
  }

  Color judgeColor(TagType tagType) {
    late Color color;
    switch (tagType) {
      case TagType.bounty:
        color = Colors.red;
        break;
      case TagType.img:
        color = Colors.orange;
        break;
      case TagType.sound:
        color = Colors.green;
        break;
      case TagType.video:
        color = Colors.blue;
        break;
      default:
        color = Colors.black;
    }
    return color;
  }
}
