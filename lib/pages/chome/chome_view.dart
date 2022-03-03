import 'dart:convert';

import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hubang/common/color.dart';
import 'package:flutter_hubang/model/synopsis/synopsis.dart';
import 'package:flutter_hubang/utils/adapt.dart';
import 'package:flutter_hubang/utils/mock.dart';
import 'package:flutter_hubang/utils/utils.dart';
import 'package:flutter_hubang/widgets/box_content.dart';
import 'package:get/get.dart';

import 'chome_controller.dart';

class ChomeView extends GetView<ChomeController> {
  const ChomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getId = Get.parameters['id'];
    final double statusBarHeight = Adapt.topbarH;
    final double pinnedHeaderHeight =
        //statusBar height
        statusBarHeight +
            //pinned SliverAppBar height in header
            kToolbarHeight;
    return Scaffold(
      body: ExtendedNestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            header(),
          ];
        },
        //1.[pinned sliver header issue](https://github.com/flutter/flutter/issues/22393)
        pinnedHeaderSliverHeightBuilder: () {
          return pinnedHeaderHeight;
        },
        //2.[inner scrollables in tabview sync issue](https://github.com/flutter/flutter/issues/21868)
        onlyOneScrollInBody: true,
        body: Column(children: [
          TabBar(
            controller: controller.tabController,
            tabs: [Tab(text: 'Tab0'), Tab(text: 'Tab1'), Tab(text: 'Tab2')],
          ),
          Expanded(
              child: Stack(
            children: [
              TabBarView(
                controller: controller.tabController,
                children: [
                  widgetone(),
                  Center(
                    child: Text("asd"),
                  ),
                  widgetone()
                ],
              ),
              Container(
                width: double.infinity,
                color: Color(0xBB87CEFA),
                height: Adapt.px(60),
                alignment: Alignment.center,
                child: Text(
                  "为您推荐30条内容",
                  style: TextStyle(color: Colors.white, fontSize: Adapt.px(28)),
                ),
              )
            ],
          ))
        ]),
      ),
    );
  }

  Widget header() {
    return Obx(
      () => SliverAppBar(
        leading: IconButton(
            onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_sharp)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit)),
          IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit))
        ],
        expandedHeight: Adapt.px(370) -
            Adapt.topbarH +
            controller.listHeight.value +
            controller.overHeight.value,
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: Stack(
            children: [
              Container(
                width: double.infinity,
                height: Adapt.px(400),
                color: AppColor.primaryColor,
              ),
              topContent(),
              extendList()
            ],
          ),
        ),
      ),
    );
  }

  Widget extendList() {
    return Container(
      margin: EdgeInsets.only(top: Adapt.px(350)),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(top: Adapt.px(15)),
        child: Column(children: controller.list),
      ),
    );
  }

  Widget topContent() {
    return Container(
      margin: EdgeInsets.only(top: Adapt.topbarH + kToolbarHeight),
      width: double.infinity,
      height: Adapt.px(350) - Adapt.topbarH - kToolbarHeight,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adapt.px(20)),
        child: Row(children: [
          SizedBox(
            height:
                Adapt.px(350) - Adapt.topbarH - kToolbarHeight - Adapt.px(50),
            width:
                Adapt.px(350) - Adapt.topbarH - kToolbarHeight - Adapt.px(50),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/topbg.jpg",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              //中间间隔
              padding: EdgeInsets.symmetric(horizontal: Adapt.px(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "人生无常人生无常",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: Adapt.px(38),
                        overflow: TextOverflow.ellipsis),
                  ),
                  Text.rich(TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(text: "入驻:"),
                        TextSpan(text: Utils.intFormat(10000)),
                        TextSpan(text: "   "),
                        TextSpan(text: "帖子:"),
                        TextSpan(text: Utils.intFormat(10000)),
                      ])),
                  Row(
                    children: [
                      SizedBox(
                        height: Adapt.px(40),
                        width: Adapt.px(40),
                        child: const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://goss.cfp.cn/creative/vcg/800/new/VCG211165042753.jpg'),
                        ),
                      ),
                      SizedBox(
                        width: Adapt.px(10),
                      ),
                      Container(
                        constraints: BoxConstraints(maxWidth: Adapt.px(200)),
                        child: const Text(
                          "ALEC TANG",
                          style: TextStyle(
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: Adapt.px(5)),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0x33FFFFFF),
                              borderRadius:
                                  BorderRadius.circular(Adapt.px(10))),
                          alignment: Alignment.center,
                          height: Adapt.px(40),
                          width: Adapt.px(60),
                          child: Text("社管",
                              style: TextStyle(
                                  color: Colors.white, fontSize: Adapt.px(20))),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Adapt.px(40), vertical: Adapt.px(14)),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular((Adapt.px(60)))),
              child: Text('入驻',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: Adapt.px(26),
                      fontWeight: FontWeight.bold)),
            ),
          )
        ]),
      ),
    );
  }

  Widget widgetone() {
    Synopsis synopsis = Synopsis.fromJson(json.decode(JsonString.synopsisdata));
    return Material(
      color: AppColor.listBackground,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return BoxContent(
            synopsis: synopsis,
          );
        },
        itemCount: 20,
      ),
    );
  }
}
