import 'package:flutter/material.dart';
import 'package:flutter_hubang/pages/message/message_controller.dart';
import 'package:flutter_hubang/utils/adapt.dart';
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
                width: Adapt.width / 4,
                height: Adapt.px(140),
                child: Container(
                    width: Adapt.px(120),
                    height: Adapt.px(120),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius:
                          BorderRadius.all(Radius.circular(Adapt.px(120))),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(Adapt.px(20)),
                      child: SvgPicture.asset(
                        "assets/icon/home.svg",
                        width: 1,
                        height: 1,
                      ),
                    )),
              ),
              Positioned(
                //提示
                left: Adapt.px(120),
                top: Adapt.px(15),
                child: count > 0
                    ? Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 3,
                        ),
                        height: Adapt.px(40),
                        constraints: BoxConstraints(
                          minWidth: Adapt.px(40),
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
            padding: EdgeInsets.symmetric(vertical: Adapt.px(20)),
            child: Text(title),
          )
        ],
      ),
    );
  }
}
