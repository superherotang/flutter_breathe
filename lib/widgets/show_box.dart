import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/adapt.dart';
import 'like_button.dart';

class ShowBox extends GetView {
  const ShowBox({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        //上
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Adapt.px(30)),
          child: Row(
            children: [
              CircleAvatar(
                  backgroundImage: const NetworkImage(
                      "https://goss.cfp.cn/creative/vcg/800/new/VCG211165042753.jpg"),
                  radius: Adapt.px(40)),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: Adapt.px(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ALEC TANG",
                        style: TextStyle(
                            fontSize: Adapt.px(30),
                            fontWeight: FontWeight.w500,
                            wordSpacing: Adapt.px(2),
                            letterSpacing: Adapt.px(1)),
                      ),
                      Text("data",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: Adapt.px(26),
                              wordSpacing: Adapt.px(2),
                              letterSpacing: Adapt.px(1)))
                    ],
                  ),
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.ac_unit))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Adapt.px(30)),
          child: child,
        ),
        //下
        Row(
          children: const [
            Expanded(
                child:
                    Center(child: LikeButton(icon: Icons.ac_unit, count: 100))),
            Expanded(
                child:
                    Center(child: LikeButton(icon: Icons.ac_unit, count: 100))),
            Expanded(
                child:
                    Center(child: LikeButton(icon: Icons.ac_unit, count: 100))),
          ],
        ),
      ]),
    );
  }
}
