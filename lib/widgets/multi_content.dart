import 'package:flutter/material.dart';
import 'package:flutter_hubang/widgets/more_text.dart';
import 'package:get/get.dart';

class MultiContent extends GetView {
  final List? imglist;
  final List? videolist;
  final List? soundlist;
  final Widget? bounty;
  final String? text;
  final int? id;
  const MultiContent({
    Key? key,
    this.text,
    this.imglist,
    this.videolist,
    this.soundlist,
    this.bounty,
    this.id,
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
                maxLines: (imglist == null &&
                        videolist == null &&
                        soundlist == null &&
                        bounty == null)
                    ? 10
                    : 4,
                id: id,
              ),
        showContent()
      ],
    );
  }

  Widget showContent() {
    if (bounty != null) {
      return Container(
        child: Text("赏金"),
      );
    } else if (videolist != null) {
      return Container(
        child: Text("视频"),
      );
    } else if (imglist != null) {
      return Container(
        child: Text("图片"),
      );
    } else if (soundlist != null) {
      return Container(
        child: Text("语音"),
      );
    } else {
      return Container();
    }
  }
}
