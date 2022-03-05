import 'package:flutter/material.dart';
import 'package:flutter_hubang/pages/message/message_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TopContent extends GetView<MessageController> {
  const TopContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconClick(onTap: () {}, count: 50, title: "asd"),
        IconClick(onTap: () {}, count: 0, title: "asd"),
        IconClick(onTap: () {}, count: 0, title: "asd"),
        IconClick(onTap: () {}, count: 100, title: "asd"),
      ],
    );
  }
}

class IconClick extends GetView {
  final int count;
  final Function onTap;
  final String title;

  const IconClick({
    Key? key,
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
                      child: SvgPicture.asset(
                        "assets/icon/home.svg",
                        width: 1,
                        height: 1,
                      ),
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
