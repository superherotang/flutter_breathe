import 'package:flutter/material.dart';
import 'package:flutter_breathe/model/posts/posts_model.dart';
import 'package:flutter_breathe/model/postsCount/posts_count_model.dart';
import 'package:flutter_breathe/routes/app_routes.dart';
import 'package:flutter_breathe/utils/utils.dart';
import 'package:flutter_breathe/widgets/multi_content.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'like_button.dart';

///帖子框架
class ShowBox extends GetView {
  final PostsModel postsModel;
  final PostsCountModel postsCountModel;
  const ShowBox({
    Key? key,
    required this.postsModel,
    required this.postsCountModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.w),
      child: Container(
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //上
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                      backgroundImage: const NetworkImage(
                          "https://goss.cfp.cn/creative/vcg/800/new/VCG211165042753.jpg"),
                      radius: 40.w),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: GestureDetector(
                      onTap: () {
                        print("object");
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ALEC TANG",
                            style: TextStyle(
                                fontSize: 30.w,
                                fontWeight: FontWeight.w500,
                                wordSpacing: 2.w,
                                overflow: TextOverflow.ellipsis,
                                letterSpacing: 1.w),
                          ),
                          Text("昨天",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 26.w,
                                  wordSpacing: 2.w,
                                  letterSpacing: 1.w))
                        ],
                      ),
                    ),
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.ac_unit))
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(Routes.DETAIL), // + id.toString()
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: MultiContent(
                postsModel: postsModel,
              ),
            ),
          ),
          //下
          Padding(
            padding: EdgeInsets.only(top: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.w,
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 30.w),
                //   child: Wrap(
                //       spacing: 8.0, runSpacing: 20.0, children: tagListWidget()),
                // ),
                Row(
                  children: [
                    Expanded(
                        child: Center(
                            child: LikeButton(
                                icon: Icons.ac_unit,
                                count: Utils.intFormat(postsCountModel.share)))),
                    Expanded(
                        child: Center(
                            child: LikeButton(
                                icon: Icons.ac_unit,
                                count:
                                    Utils.intFormat(postsCountModel.comment)))),
                    Expanded(
                        child: Center(
                            child: LikeButton(
                                icon: Icons.ac_unit,
                                count: Utils.intFormat(postsCountModel.like)))),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  // List<Widget> tagListWidget() {
  //   List<Widget> list = [];
  //   tagList.forEach((element) {
  //     list.add(Tag(postsType: element.postsType, count: element.count));
  //   });
  //   return list;
  // }
}
