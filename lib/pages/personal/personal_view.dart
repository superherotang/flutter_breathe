import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breathe/pages/personal/components/top_image_appbar.dart';
import 'package:get/get.dart';

import 'personal_controller.dart';

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
    return Listener(
      onPointerMove: (event) {
        controller.updatePicHeight(event.position.dy);
      },
      onPointerUp: (_) {
        controller.runAnimate();
        controller.animationController.forward(from: 0);
      },
      child: ExtendedNestedScrollView(
        controller: controller.scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return personalTopBuilder();
        },
        pinnedHeaderSliverHeightBuilder: () {
          return pinnedHeaderHeight;
        },
        onlyOneScrollInBody: true,
        body: Column(children: [
          TabBar(
            controller: controller.tabController,
            isScrollable: false,
            tabs: const [Tab(text: 'Tab0'), Tab(text: 'Tab1')],
          ),
          Expanded(
              child: TabBarView(
            controller: controller.tabController,
            children: [
              ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext c, int i) {
                  return Container(
                    alignment: Alignment.center,
                    height: 60.0,
                    child: Text(
                      const Key('Tab1').toString() + ': ListView$i',
                    ),
                  );
                },
              ),
              Center(
                child: Text("CENTER"),
              ),
            ],
          ))
        ]),
      ),
    );
  }
}

List<Widget> personalTopBuilder() {
  final List<Widget> widgets = <Widget>[];
  widgets.add(const TopImageAppbar());
  return widgets;
}
