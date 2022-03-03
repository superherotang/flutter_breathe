import 'package:flutter/material.dart';
import 'package:flutter_hubang/utils/adapt.dart';
import 'package:get/get.dart';

class ModalButton extends GetView {
  final String text;
  const ModalButton(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: Adapt.px(150),
            width: Adapt.px(150),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.pinkAccent,
                  Colors.yellow,
                ],
              ),
            )),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: TextStyle(fontSize: Adapt.px(30)),
        )
      ],
    );
  }
}
