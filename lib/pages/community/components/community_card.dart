import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breathe/common/color.dart';
import 'package:flutter_breathe/common/middlewares/router_auth.dart';
import 'package:flutter_breathe/routes/app_routes.dart';

import 'package:flutter_breathe/utils/utils.dart';
import 'package:flutter_breathe/widgets/box_background.dart';
import 'package:flutter_breathe/widgets/more_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommunityCard extends GetView {
  const CommunityCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.w),
      child: BoxBackground(
        child: Column(
          children: [
            InkWell(
              onTap: () => Get.toNamed(Routes.CHOME + "30"),
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
                        child: ExtendedImage.network(
                          "http://192.168.10.150:9000/breathe-images/1e0c25887594f25a8f57c179427b1713.png",
                          fit: BoxFit.fill,
                          loadStateChanged: (ExtendedImageState state) {
                            switch (state.extendedImageLoadState) {
                              case LoadState.loading:
                                break;
                              case LoadState.completed:
                                break;
                              case LoadState.failed:
                                return Image.asset(
                                  "assets/images/image_failed.png",
                                  fit: BoxFit.fill,
                                );
                                break;
                              default:
                            }
                          },
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
                            id: "123",
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
                onPressed: () async {
                  bool flag = await RouteAuth().auth();
                },
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
