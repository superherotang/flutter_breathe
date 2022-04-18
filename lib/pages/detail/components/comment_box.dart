import 'package:flutter/material.dart';
import 'package:flutter_breathe/utils/utils.dart';
import 'package:flutter_breathe/widgets/like_button.dart';
import 'package:flutter_breathe/widgets/more_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommentBox extends GetView {
  const CommentBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10.w),
          width: 100.w,
          height: 100.w,
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
                'http://192.168.10.150:9000/breathe-images/1e0c25887594f25a8f57c179427b1713.png'),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100.w,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "ALECTANG",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                        ),
                        SizedBox(height: 10.w),
                        const Text("2022-3-12"),
                      ]),
                ),
                MoreText(
                    "啊回复v啊话剧今安徽省v发今安徽v句法时间vjasv建安费v就是v就vajv静安寺v静安寺v京哈VS啊v就是v今安徽省v静安寺v积分v阿散井你拉山口妇女拉升拉科夫你拉上你刘看山拉科夫你阿拉克纳斯离开帆帆刘看山老夫看书看了范老师看那里看法阿奎那啊来看  拉萨看能否刘看山卡拉NSF卢卡斯你卢卡斯你发来看是否库拉索尼库拉索尼发库拉索尼库拉索尼库拉索尼发库拉索尼发库拉索尼发库拉索尼发库拉索尼库拉索尼卢卡斯你奥克兰发库拉索尼阿喀琉斯你来看绿色开放拉看到拉萨可能",
                    maxLines: 6),
                SizedBox(height: 10.w),
                evaluate(),
                subReply(),
                SizedBox(height: 20.w)
              ],
            ),
          ),
        )
      ],
    );
  }

  //评价栏
  Widget evaluate() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LikeButton(
            size: 60.w, icon: Icons.ac_unit, count: Utils.intFormat(10000)),
        SizedBox(width: 20.w),
        LikeButton(size: 60.w, icon: Icons.ac_unit),
        SizedBox(width: 20.w),
        LikeButton(size: 60.w, icon: Icons.ac_unit),
        SizedBox(width: 20.w),
        LikeButton(size: 60.w, icon: Icons.ac_unit),
        Expanded(child: Container()),
        InkWell(
          onTap: () {},
          child: Icon(
            Icons.ac_unit,
            size: 40.w,
          ),
        )
      ],
    );
  }

  Widget subReply() {
    return Container(
        width: double.infinity,
        color: Colors.amber,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.w),
        child: Text("data"));
  }
}
