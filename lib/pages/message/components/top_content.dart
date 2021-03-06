import 'package:flutter/material.dart';
import 'package:flutter_breathe/pages/message/message_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TopContent extends GetView<MessageController> {
  const TopContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconClick(icon: Icons.alternate_email_rounded, onTap: () {}, count: 50, title: "@我"),
        IconClick(icon: Icons.favorite,onTap: () {}, count: 0, title: "赞"),
        IconClick(icon: Icons.comment,onTap: () {}, count: 0, title: "评论"),
        IconClick(icon: Icons.face_retouching_natural,onTap: () {}, count: 100, title: "粉丝"),
      ],
    );
  }
}

class IconClick extends GetView {
  final int count;
  final Function onTap;
  final String title;
  final IconData icon;

  const IconClick({
    Key? key,
    required this.icon,
    required this.count,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                width: 1.sw / 4,
                height: 140.w,
                child: Container(
                    width: 120.w,
                    height: 120.w,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(120.w)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20.w),
                      child: Icon(icon,size: 60.w,),
                    )),
              ),
              Positioned(
                //提示
                left: 120.w,
                top: 15.w,
                child: count > 0
                    ? Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 3,
                        ),
                        height: 40.w,
                        constraints: BoxConstraints(
                          minWidth: 40.w,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          count <= 99 ? count.toString() : '99+',
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Container(),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.w),
            child: Text(title),
          )
        ],
      ),
    );
  }
}
