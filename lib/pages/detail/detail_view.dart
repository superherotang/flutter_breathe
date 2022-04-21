import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breathe/common/color.dart';
import 'package:flutter_breathe/common/middlewares/router_auth.dart';
import 'package:flutter_breathe/pages/detail/components/all_reply.dart';
import 'package:flutter_breathe/utils/utils.dart';
import 'package:flutter_breathe/widgets/multi_content.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Chip(
          labelPadding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.w),
          label: Text(
            controller.postsInfoModel.nickname,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColor.primaryColor,
          avatar: CircleAvatar(
            backgroundImage: NetworkImage(controller.postsInfoModel.avatar),
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
            onlyOneScrollInBody: true,
            body: Stack(
              children: [
                replyList(),
              ],
            ),
          )),
          bottonBox()
        ],
      ),
    );
  }

  //回复列表
  Widget replyList() {
    return Column(children: [
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
            physics: const NeverScrollableScrollPhysics(), //禁止滑动
            controller: controller.tabController,
            children: [
              AllReply(
                pid: controller.postsInfoModel.uuid,
              ),
              AllReply(
                pid: controller.postsInfoModel.uuid,
              ),
            ]),
      )
    ]);
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
              child: GestureDetector(
            onTap: () {
              RouteAuth().auth();
            },
            child: Container(
              height: 70.w,
              child: Center(
                child: TextField(
                  controller: controller.textEditingController,
                  focusNode: controller.focusNode,
                  style: TextStyle(fontSize: 30.w),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.w),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
              ),
            ),
          )),
          InkWell(
            onTap: () {},
            child: Obx(
              () => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: controller.isFocus.value
                      ? InkWell(
                          onTap: () => controller.publishComment(),
                          child: Container(
                            color: Colors.blueAccent[200],
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 10.w),
                              child: const Text(
                                "发送",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      : Icon(
                          Icons.ac_unit,
                          size: 40.w,
                        )),
            ),
          ),
        ],
      ),
    );
  }
}

// Row(
//         children: [
//           Expanded(
//               child: GestureDetector(
//             onTap: () {
//               RouteAuth().auth();
//             },
//             child: Container(
//               height: 34,
//               margin: const EdgeInsets.only(right: 5),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30),
//                   color: const Color.fromARGB(255, 240, 240, 240)),
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(left: 20.w),
//                     child: const Text(
//                       "我来说点什么",
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           )),
//           InkWell(
//             onTap: () {},
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 15.w),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.ac_unit,
//                     size: 40.w,
//                   ),
//                   Text("100",
//                       style: TextStyle(
//                         height: 2.5.w,
//                       ))
//                 ],
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: () {},
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 15.w),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.ac_unit,
//                     size: 40.w,
//                   ),
//                   Text("评论",
//                       style: TextStyle(
//                         height: 2.5.w,
//                       ))
//                 ],
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: () {},
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 15.w),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.ac_unit,
//                     size: 40.w,
//                   ),
//                   Text("收藏",
//                       style: TextStyle(
//                         height: 2.5.w,
//                       ))
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),

//文章
Widget buildSliverHeader() {
  var controller = Get.find<DetailController>();
  return SliverToBoxAdapter(
      child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
    child: Column(
      children: [
        Row(children: [
          Expanded(
              child: Text(
            "发布日期:" + Utils.myDataFormat(controller.postsInfoModel.createTime),
            style: TextStyle(fontSize: 30.w),
          )),
          Expanded(
              child: Text(
            "更新日期:" + Utils.myDataFormat(controller.postsInfoModel.updateTime),
            style: TextStyle(fontSize: 30.w),
          )),
        ]),
        Text(
          "所属社区: " + controller.postsInfoModel.communityName,
          style: TextStyle(fontSize: 40.w),
        ),
        SizedBox(height: 10.w),
        MultiContent(
          postsInfoModel: controller.postsInfoModel,
        ),
      ],
    ),
  ));
}
