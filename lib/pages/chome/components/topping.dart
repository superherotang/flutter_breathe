import 'package:flutter/material.dart';
import 'package:flutter_hubang/common/color.dart';
import 'package:flutter_hubang/utils/adapt.dart';
import 'package:get/get.dart';

class Topping extends GetView {
  final String textType;
  final String text;
  const Topping({Key? key, required this.text, required this.textType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Adapt.px(60),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: Adapt.px(20)),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Adapt.px(5)),
                color: AppColor.primaryColor),
            child: Padding(
              padding: EdgeInsets.all(Adapt.px(5)),
              child: Text(
                textType,
                style: TextStyle(color: Colors.white, fontSize: Adapt.px(22)),
              ),
            ),
          ),
          SizedBox(
            width: Adapt.px(10),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: Adapt.px(40)),
              child: Text(
                text,
                style: TextStyle(
                    overflow: TextOverflow.ellipsis, fontSize: Adapt.px(30)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
