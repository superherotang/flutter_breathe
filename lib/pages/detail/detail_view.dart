import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hubang/common/color.dart';
import 'package:flutter_hubang/widgets/loading_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getId = Get.parameters['id'];
    return Scaffold(
      appBar: AppBar(
        title: Chip(
          labelPadding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.w),
          label: const Text(
            '名字',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColor.primaryColor,
          avatar: const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://goss.cfp.cn/creative/vcg/800/new/VCG211165042753.jpg'),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                print("object");
              },
              icon: const Icon(Icons.ac_unit))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ExtendedNestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [buildSliverHeader()];
            },
            //2.[inner scrollables in tabview sync issue](https://github.com/flutter/flutter/issues/21868)
            onlyOneScrollInBody: true,
            body: Column(children: [
              Row(
                children: [
                  SizedBox(
                    width: 300.w,
                    child: TabBar(
                      controller: controller.tabController,
                      indicator: const BoxDecoration(),
                      labelStyle: TextStyle(fontSize: 26.w),
                      labelPadding: EdgeInsets.zero,
                      isScrollable: false,
                      unselectedLabelColor: Colors.grey,
                      tabs: const [Tab(text: '全部回复'), Tab(text: '只看楼主')],
                    ),
                  ),
                  Expanded(
                      child: Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: const Text("热度"),
                            ),
                          ),
                          SizedBox(
                            width: 1,
                            height: 20.w,
                            child: const DecoratedBox(
                              decoration: BoxDecoration(color: Colors.grey),
                            ),
                          ),
                          InkWell(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: const Text("最新"),
                            ),
                          ),
                          SizedBox(
                            width: 1,
                            height: 20.w,
                            child: const DecoratedBox(
                              decoration: BoxDecoration(color: Colors.grey),
                            ),
                          ),
                          InkWell(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: const Text("最早"),
                            ),
                          ),
                        ]),
                  ))
                ],
              ),
              Expanded(
                child: TabBarView(
                    controller: controller.tabController,
                    children: [reply(), reply()]),
              )
            ]),
          )),
          bottonBox()
        ],
      ),
    );
  }

  Container bottonBox() {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey,
            offset: Offset(0, -1.w), //阴影x轴偏移量
            blurRadius: 1, //阴影模糊程度
            spreadRadius: 0 //阴影扩散程度
            )
      ]),
      width: double.infinity,
      height: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
              child: Container(
            height: 34,
            margin: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 240, 240, 240)),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: const Text(
                    "我来说点什么",
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
          )),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.ac_unit,
                    size: 40.w,
                  ),
                  Text("100",
                      style: TextStyle(
                        height: 2.5.w,
                      ))
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.ac_unit,
                    size: 40.w,
                  ),
                  Text("评论",
                      style: TextStyle(
                        height: 2.5.w,
                      ))
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.ac_unit,
                    size: 40.w,
                  ),
                  Text("收藏",
                      style: TextStyle(
                        height: 2.5.w,
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

//文章
Widget buildSliverHeader() {
  return SliverToBoxAdapter(
    child: Container(width: double.infinity, height: 300, color: Colors.amber),
  );
}

Widget reply() {
  return LoadingView(
      future: getData(),
      errorWidget: Text("error"),
      waitWidget: Center(
        child: CircularProgressIndicator(),
      ),
      doneWidget: Text("asd"));
}

Future getData() async {
  await Future.delayed(Duration(milliseconds: 1000), () {});
}
