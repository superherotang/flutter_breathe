import 'package:flutter/material.dart';
import 'package:flutter_breathe/model/posts_type.dart';
import 'package:flutter_breathe/model/tag_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Tag extends StatelessWidget {
  const Tag({
    Key? key,
    required this.postsType,
    required this.count,
  }) : super(key: key);
  final int count;
  final PostsType postsType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: judgeColor(postsType)),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.w),
      child: Text(
        judgeText(postsType, count),
        style: TextStyle(color: Colors.white, fontSize: 24.w),
      ),
    );
  }

  String judgeText(PostsType postsType, int count) {
    late String text;
    switch (postsType) {
      case PostsType.bounty:
        text = "赏金";
        break;
      case PostsType.img:
        text = "图片+" + count.toString();
        break;
      case PostsType.sound:
        text = "声音+" + count.toString();
        break;
      case PostsType.video:
        text = "视频+" + count.toString();
        break;
      default:
        text = "未知";
    }
    return text;
  }

  Color judgeColor(PostsType tagType) {
    late Color color;
    switch (tagType) {
      case PostsType.bounty:
        color = Colors.red;
        break;
      case PostsType.img:
        color = Colors.orange;
        break;
      case PostsType.sound:
        color = Colors.green;
        break;
      case PostsType.video:
        color = Colors.blue;
        break;
      default:
        color = Colors.black;
    }
    return color;
  }
}
