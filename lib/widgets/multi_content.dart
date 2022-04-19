import 'package:flutter/material.dart';
import 'package:flutter_breathe/model/posts/posts_model.dart';
import 'package:flutter_breathe/model/postsInfo/posts_info_model.dart';
import 'package:flutter_breathe/routes/app_routes.dart';
import 'package:flutter_breathe/widgets/audio_player_unit.dart';
import 'package:flutter_breathe/widgets/more_text.dart';
import 'package:get/get.dart';

import 'show_type_box/show_type_images.dart';

///帖子内容
class MultiContent extends GetView {
  final PostsInfoModel postsInfoModel;

  const MultiContent({
    Key? key,
    required this.postsInfoModel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.DETAIL+"9999");
      },
      child: Material(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            postsInfoModel.postsContent.isEmpty
                ? Container()
                : MoreText(
                    postsInfoModel.postsContent,
                    maxLines: postsInfoModel.postsType != 1 ? 10 : 4,
                    id: postsInfoModel.uuid,
                    route: Routes.DETAIL,
                  ),
            showContent()
          ],
        ),
      ),
    );
  }

  Widget showContent() {
    Widget content = Container();
    switch (postsInfoModel.postsType) {
      case 2:
        content = ShowTypeImages(data: postsInfoModel.postsImages.split(","));
        break;
      case 3:
        content = const Text("我是视频");
        break;
      case 4:
        content = const AudioPlayerUnit(audioDuration: 10.0);
        break;
    }
    return content;
  }
}




// List<String> images = <String>[
//       'https://photo.tuchong.com/14649482/f/601672690.jpg',
//       'https://photo.tuchong.com/17325605/f/641585173.jpg',
//       'https://photo.tuchong.com/16763656/f/458612324.jpg',
//       'https://photo.tuchong.com/16709139/f/278778447.jpg',
//       'https://photo.tuchong.com/1938036/f/1207181327.jpg',
//       'https://photo.tuchong.com/5040418/f/43305517.jpg',
//       'https://photo.tuchong.com/16763656/f/757342338.jpg'
//     ];
//     if (resource.videoList.isNotEmpty) {
//       return Padding(
//         padding: EdgeInsets.symmetric(vertical: 10.w),
//         child: Text("视频"),
//       );
//     } else if (resource.imgList.isNotEmpty) {
//       return Padding(
//         padding: EdgeInsets.symmetric(vertical: 10.w),
//         child: ShowTypeImages(data: images),
//       );
//     } else if (resource.soundList.isNotEmpty) {
//       return Container(
//         child: Text("语音"),
//       );
//     } else {
//       return Container();
//     }