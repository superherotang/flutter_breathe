import 'package:flutter/material.dart';
import 'package:flutter_hubang/model/synopsis/synopsis.dart';
import 'package:flutter_hubang/widgets/more_text.dart';
import 'package:get/get.dart';

class MultiContent extends GetView {
  final String? text;
  final int? id;
  final String? route;
  final Resource resource;
  const MultiContent({
    Key? key,
    this.text,
    this.id,
    this.route,
    required this.resource,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text == null
            ? Container()
            : MoreText(
                text!,
                maxLines: (resource.imgList.isEmpty &&
                        resource.videoList.isEmpty &&
                        resource.soundList.isEmpty &&
                        resource.bountyList.isEmpty)
                    ? 10
                    : 4,
                id: id,
                route: route,
              ),
        showContent()
      ],
    );
  }

  Widget showContent() {
    if (resource.bountyList.isNotEmpty) {
      return Container(
        child: Text("赏金"),
      );
    } else if (resource.videoList.isNotEmpty) {
      return Container(
        child: Text("视频"),
      );
    } else if (resource.imgList.isNotEmpty) {
      return Container(
        child: Text("图片"),
      );
    } else if (resource.soundList.isNotEmpty) {
      return Container(
        child: Text("语音"),
      );
    } else {
      return Container();
    }
  }
}
