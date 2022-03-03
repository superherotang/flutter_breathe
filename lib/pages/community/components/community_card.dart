import 'package:flutter/material.dart';
import 'package:flutter_hubang/common/color.dart';
import 'package:flutter_hubang/routes/app_routes.dart';
import 'package:flutter_hubang/utils/adapt.dart';
import 'package:flutter_hubang/utils/utils.dart';
import 'package:flutter_hubang/widgets/more_text.dart';
import 'package:get/get.dart';

class CommunityCard extends GetView {
  const CommunityCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Adapt.px(30), vertical: Adapt.px(20)),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(Adapt.px(20))),
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
                    padding: EdgeInsets.all(Adapt.px(30)),
                    child: SizedBox(
                      height: Adapt.px(250),
                      width: Adapt.px(250),
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
                      padding: EdgeInsets.symmetric(vertical: Adapt.px(30)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "人生无常人生无常",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: Adapt.px(40),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: Adapt.px(10),
                          ),
                          const MoreText(
                            "人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常人生无常",
                            maxLines: 2,
                            id: 123,
                            route: Routes.CHOME,
                          ),
                          SizedBox(
                            height: Adapt.px(10),
                          ),
                          Text.rich(
                              TextSpan(children: [
                                const TextSpan(text: "云南"),
                                TextSpan(
                                    text: "•",
                                    style:
                                        TextStyle(letterSpacing: Adapt.px(15))),
                                const TextSpan(text: "曲靖"),
                                TextSpan(
                                    text: "•",
                                    style:
                                        TextStyle(letterSpacing: Adapt.px(15))),
                                const TextSpan(text: "麒麟区"),
                              ]),
                              style: const TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: Adapt.px(5),
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
              padding: EdgeInsets.only(
                  bottom: Adapt.px(30),
                  left: Adapt.px(30),
                  right: Adapt.px(30)),
              child: ElevatedButton(
                onPressed: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  height: Adapt.px(60),
                  child: Text(
                    "加入社区",
                    style: TextStyle(
                        letterSpacing: Adapt.px(25),
                        fontSize: Adapt.px(30),
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
