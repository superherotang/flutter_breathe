import 'package:flutter/material.dart';
import 'package:flutter_breathe/model/synopsis/synopsis.dart';
import 'package:flutter_breathe/widgets/more_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'show_type_box/show_type_images.dart';


///帖子内容
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
          List<String> images = <String>[
    'https://photo.tuchong.com/14649482/f/601672690.jpg',
    'https://photo.tuchong.com/17325605/f/641585173.jpg',
    'https://photo.tuchong.com/16763656/f/458612324.jpg',
    'https://photo.tuchong.com/16709139/f/278778447.jpg',
    'https://photo.tuchong.com/1938036/f/1207181327.jpg',
    'https://photo.tuchong.com/5040418/f/43305517.jpg',
    'https://photo.tuchong.com/16763656/f/757342338.jpg'
  ];
    if (resource.bountyList.isNotEmpty) {
      return Container(
        child: Text("赏金"),
      );
    } else if (resource.videoList.isNotEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.w),
        child: Text("视频"),
      );
    } else if (resource.imgList.isNotEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.w),
        child: ShowTypeImages(data: images),
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
