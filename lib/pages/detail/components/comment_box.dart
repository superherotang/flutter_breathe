import 'package:flutter/material.dart';
import 'package:flutter_breathe/model/comment/comment_model.dart';
import 'package:flutter_breathe/utils/utils.dart';
import 'package:flutter_breathe/widgets/like_button.dart';
import 'package:flutter_breathe/widgets/more_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommentBox extends GetView {
  final CommentModel commentModel;
  const CommentBox({Key? key, required this.commentModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.all(10.w),
                width: 100.w,
                height: 100.w,
                child: commentModel.avatar.isEmpty
                    ? const CircleAvatar(
                        backgroundImage: AssetImage(
                          "assets/images/default_avatar.png",
                        ),
                      )
                    : CircleAvatar(
                        backgroundImage: NetworkImage(
                        commentModel.avatar,
                      ))),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100.w,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              commentModel.nickname,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            SizedBox(height: 10.w),
                            Text(Utils.myDataFormat(commentModel.createTime)),
                          ]),
                    ),
                    MoreText(commentModel.content, maxLines: 6),
                    SizedBox(height: 10.w),
                    evaluate(),
                    SizedBox(height: 20.w),
                  ],
                ),
              ),
            )
          ],
        ),
        const Divider(
          height: 1.0,
          color: Colors.grey,
        ),
      ],
    );
  }

  //评价栏
  Widget evaluate() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LikeButton(size: 60.w, icon: Icons.ac_unit, count: commentModel.like),
        Expanded(child: Container()),
        InkWell(
          onTap: () {},
          child: Icon(
            Icons.ac_unit,
            size: 40.w,
          ),
        )
      ],
    );
  }
}
