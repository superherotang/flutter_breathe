import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_breathe/model/posts/posts_model.dart';
import 'package:flutter_breathe/model/postsCount/posts_count_model.dart';
import 'package:flutter_breathe/model/synopsis/synopsis.dart';
import 'package:flutter_breathe/utils/mock.dart';
import 'package:flutter_breathe/widgets/show_box.dart';
import 'package:get/get.dart';

class Recommend extends GetView {
  const Recommend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostsModel postsModel =
        PostsModel.fromJson(json.decode(JsonString.postsData));
    PostsCountModel postsCountModel =
        PostsCountModel.fromJson(json.decode(JsonString.postsCount));

    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ShowBox(
            postsModel: postsModel, postsCountModel: postsCountModel);
      },
      itemCount: 20,
    );
  }
}
