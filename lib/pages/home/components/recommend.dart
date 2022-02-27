import 'package:flutter/material.dart';
import 'package:flutter_hubang/utils/adapt.dart';
import 'package:flutter_hubang/widgets/card/text_content.dart';
import 'package:flutter_hubang/widgets/show_box.dart';
import 'package:get/get.dart';

class Recommend extends GetView {
  const Recommend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            SizedBox(
              height: Adapt.px(10),
            ),
            ShowBox(
              child: TextContent(),
            )
          ],
        );
      },
      itemCount: 20,
    );
  }
}
