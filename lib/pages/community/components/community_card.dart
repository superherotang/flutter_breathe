import 'package:flutter/material.dart';
import 'package:flutter_breathe/common/color.dart';
import 'package:flutter_breathe/routes/app_routes.dart';

import 'package:flutter_breathe/utils/utils.dart';
import 'package:flutter_breathe/widgets/more_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommunityCard extends GetView {
  const CommunityCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.w),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.w)),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(255, 223, 241, 243),
                  offset: Offset(0.0, 15.0), //阴影xy轴偏移量
                  blurRadius: 10.0, //阴影模糊程度
                  spreadRadius: 1.0 //阴影扩散程度
                  )
            ]),
        child: Column(
          children: [
            InkWell(
              onTap: () => Get.toNamed(Routes.CHOME + "123"),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //左边图片
                  Padding(
                    padding: EdgeInsets.all(30.w),
                    child: SizedBox(
                      height: 250.w,
                      width: 250.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          "https://goss.cfp.cn/creative/vcg/800/new/VCG211165042753.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  //右边内容
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 30.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "人生无常人生无常",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 40.w, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          const MoreText(
                            "人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常",
                            maxLines: 2,
                            id: 123,
                            route: Routes.CHOME,
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Text.rich(
                              TextSpan(children: [
                                const TextSpan(text: "云南"),
                                TextSpan(
                                    text: "•",
                                    style: TextStyle(letterSpacing: 15.w)),
                                const TextSpan(text: "曲靖"),
                                TextSpan(
                                    text: "•",
                                    style: TextStyle(letterSpacing: 15.w)),
                                const TextSpan(text: "麒麟区"),
                              ]),
                              style: const TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 5.w,
                          ),
                          Text.rich(TextSpan(children: [
                            const TextSpan(text: "入驻人数"),
                            const TextSpan(text: "  "),
                            TextSpan(
                                text: Utils.intFormat(10000),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold))
                          ])),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.w, left: 30.w, right: 30.w),
              child: ElevatedButton(
                onPressed: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  height: 60.w,
                  child: Text(
                    "加入社区",
                    style: TextStyle(
                        letterSpacing: 25.w,
                        fontSize: 30.w,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
                  backgroundColor:
                      MaterialStateProperty.all(AppColor.primaryColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
