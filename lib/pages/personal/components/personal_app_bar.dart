import 'package:flutter/material.dart';
import 'package:flutter_hubang/pages/personal/personal_controller.dart';
import 'package:flutter_hubang/utils/adapt.dart';
import 'package:get/get.dart';

import 'sliver_top_box.dart';

class PersonalAppBar extends GetView<PersonalController> {
  const PersonalAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SliverAppBar(
        pinned: true,
        title: Text("${controller.isPicFold.toString()}"),
        leading: Icon(Icons.arrow_back),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Adapt.px(25)),
            child: Icon(Icons.ac_unit),
          )
        ],
        expandedHeight: Adapt.px(450) + controller.picHeight.value,
        flexibleSpace: LayoutBuilder(builder: (context, constraints) {
          //获取bar高度
          controller.sliverAppBarHeight = constraints.biggest.height;
          return const FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: SliverTopBox(),
          );
        }),
      ),
    );
  }
}
