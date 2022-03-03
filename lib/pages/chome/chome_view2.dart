import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hubang/utils/adapt.dart';
import 'package:get/get.dart';

class ChomeView extends GetView {
  const ChomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _mySliverAppBar() {
      return SliverAppBar(
        title: Text('NestedScrollView'),
        expandedHeight: 200,
        flexibleSpace: FlexibleSpaceBar(
          background: Image.asset(
            "assets/images/topbg.jpg",
            fit: BoxFit.cover,
          ),
          collapseMode: CollapseMode.parallax,
        ),
      );
    }

    _myItem(int index) {
      return Container(
        color: Colors.yellow,
        child: ListTile(
          title: Text('List $index'),
        ),
      );
    }

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: _mySliverAppBar(),
            )
          ];
        },
        body: Builder(
          builder: (context) {
            return CustomScrollView(
              slivers: [
                SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return _myItem(index);
                    },
                    childCount: 15,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
