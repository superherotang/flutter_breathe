import 'dart:convert';

import 'package:custom_nested_scroll_view/custom_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hubang/common/color.dart';
import 'package:flutter_hubang/model/synopsis/synopsis.dart';
import 'package:flutter_hubang/utils/mock.dart';
import 'package:flutter_hubang/widgets/box_content.dart';
import 'package:get/get.dart';

class ChomeView extends GetView {
  const ChomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Synopsis synopsis = Synopsis.fromJson(json.decode(JsonString.synopsisdata));
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: CustomNestedScrollView(
          physics: BouncingScrollPhysics(),
          overscrollType: CustomOverscroll.outer,
          headerSliverBuilder: (context, outerScrolled) => <Widget>[
            CustomSliverOverlapAbsorber(
              overscrollType: CustomOverscroll.outer,
              handle: CustomNestedScrollView.sliverOverlapAbsorberHandleFor(
                  context),
              sliver: SliverAppBar(
                pinned: true,
                stretch: true,
                expandedHeight: 400,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Center(child: Text('Example')),
                  background: Image.asset(
                    'assets/images/topbg.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                bottom: TabBar(
                  tabs: [
                    Tab(child: Text('Tab1')),
                    Tab(child: Text('Tab1')),
                  ],
                ),
              ),
            ),
          ],
          body: TabBarView(
            children: [
              CustomScrollView(
                slivers: <Widget>[
                  Builder(
                    builder: (context) => CustomSliverOverlapInjector(
                      overscrollType: CustomOverscroll.outer,
                      handle:
                          CustomNestedScrollView.sliverOverlapAbsorberHandleFor(
                              context),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return BoxContent(
                        synopsis: synopsis,
                      );
                    }, childCount: 20),
                  )
                ],
              ),
              widgetone()
            ],
          ),
        ),
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
