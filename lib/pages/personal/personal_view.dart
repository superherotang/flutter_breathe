import 'dart:convert';

import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hubang/common/color.dart';
import 'package:flutter_hubang/model/synopsis/synopsis.dart';
import 'package:flutter_hubang/pages/personal/personal_controller.dart';
import 'package:flutter_hubang/utils/mock.dart';
import 'package:flutter_hubang/widgets/box_content.dart';
import 'package:get/get.dart';

import 'components/build_sliver_header.dart';

class PersonalView extends GetView<PersonalController> {
  const PersonalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double pinnedHeaderHeight =
        //statusBar height
        statusBarHeight +
            //pinned SliverAppBar height in header
            kToolbarHeight;
    return Scaffold(
      body: Listener(
        //拖动事件
        onPointerMove: (event) {
          controller.updatePicHeight(event.position.dy);
        },
        //抬起事件
        onPointerUp: (event) {
          if (controller.picHeight.value > 0) {
            controller.runAnimate();
            // controller.picHeight.value = 0;
            controller.animationController.forward(from: 0);
          }
          controller.preDy = 0;
        },
        child: ExtendedNestedScrollView(
          controller: controller.scrollController,
          //1.[pinned sliver header issue](https://github.com/flutter/flutter/issues/22393)
          pinnedHeaderSliverHeightBuilder: () {
            return pinnedHeaderHeight;
          },
          //2.[inner scrollables in tabview sync issue](https://github.com/flutter/flutter/issues/21868)
          onlyOneScrollInBody: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return buildSliverHeader();
          },
          body: Column(children: [
            TabBar(
              controller: controller.tabController,
              labelColor: Colors.blue,
              indicatorColor: Colors.blue,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 2.0,
              isScrollable: false,
              unselectedLabelColor: Colors.grey,
              tabs: const <Tab>[Tab(text: 'Tab0'), Tab(text: 'Tab1')],
            ),
            Expanded(
                child: TabBarView(
              controller: controller.tabController,
              children: [widgetone(), Text("data")],
            )),
          ]),
        ),
      ),
    );
  }
}

Widget widgetone() {
  Synopsis synopsis = Synopsis.fromJson(json.decode(JsonString.synopsisdata));
  return Material(
    color: AppColor.listBackground,
    child: ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return BoxContent(
          synopsis: synopsis,
        );
      },
      itemCount: 20,
    ),
  );
}
