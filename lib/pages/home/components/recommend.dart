import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hubang/model/synopsis/synopsis.dart';
import 'package:flutter_hubang/utils/mock.dart';
import 'package:flutter_hubang/widgets/box_content.dart';
import 'package:get/get.dart';

class Recommend extends GetView {
  const Recommend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Synopsis synopsis = Synopsis.fromJson(json.decode(JsonString.synopsisdata));
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return BoxContent(
          synopsis: synopsis,
        );
      },
      itemCount: 20,
    );
  }
}
