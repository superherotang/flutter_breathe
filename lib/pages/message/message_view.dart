import 'package:flutter/material.dart';
import 'package:flutter_hubang/pages/message/components/chat_list_view.dart';
import 'package:flutter_hubang/pages/message/message_controller.dart';
import 'package:flutter_hubang/routes/app_routes.dart';
import 'package:flutter_hubang/utils/adapt.dart';
import 'package:flutter_hubang/widgets/keep_alive_wrapper.dart';
import 'package:get/get.dart';

import 'components/group_list_view.dart';

class MessageView extends GetView<MessageController> {
  const MessageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MessageController());
    return Scaffold(
      appBar: messageAppBar(),
      body: TabBarView(controller: controller.tabController, children: const [
        KeepAliveWrapper(child: ChatListView()),
        KeepAliveWrapper(child: GroupListView()),
      ]),
    );
  }

  //顶部
  AppBar messageAppBar() {
    return AppBar(
        leadingWidth: double.infinity,
        leading: Padding(
          padding: EdgeInsets.only(left: Adapt.px(30), top: Adapt.px(25)),
          child: Text(
            "消息",
            style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: Adapt.px(40)),
          ),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: Adapt.px(15)),
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  size: Adapt.px(60),
                ),
                onPressed: () {
                  Get.toNamed(Routes.MESSAGE + Routes.MESSAGESERACH);
                },
              )),
          Padding(
            padding: EdgeInsets.only(right: Adapt.px(25)),
            child: Icon(
              Icons.add,
              size: Adapt.px(60),
            ),
          )
        ],
        bottom: TabBar(
          controller: controller.tabController,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 2.0,
          isScrollable: false,
          tabs: const <Tab>[Tab(text: '聊天'), Tab(text: '群组')],
        ));
  }
}


 




// import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyrefresh/easy_refresh.dart';
// import 'package:flutter_hubang/pages/message/message_controller.dart';
// import 'package:flutter_hubang/utils/adapt.dart';
// import 'package:get/get.dart';

// import 'components/top_content.dart';

// class MessageView extends GetView<MessageController> {
//   const MessageView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Get.put(MessageController());
//     final double statusBarHeight = MediaQuery.of(context).padding.top;
//     final double pinnedHeaderHeight =
//         //statusBar height
//         statusBarHeight +
//             //pinned SliverAppBar height in header
//             kToolbarHeight;
//     return Scaffold(
//       appBar: messageAppBar(),
//       body: ExtendedNestedScrollView(
//         pinnedHeaderSliverHeightBuilder: () {
//           return pinnedHeaderHeight + Adapt.px(180);
//         },
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return [
//             const SliverToBoxAdapter(
//               child: TopContent(),
//             ),
//             SliverAppBar(
//                 pinned: true,
//                 toolbarHeight: 0,
//                 bottom: TabBar(
//                   controller: controller.tabController,
//                   labelColor: Colors.blue,
//                   indicatorColor: Colors.blue,
//                   indicatorSize: TabBarIndicatorSize.label,
//                   indicatorWeight: 2.0,
//                   isScrollable: false,
//                   unselectedLabelColor: Colors.grey,
//                   tabs: const <Tab>[Tab(text: 'Tab0'), Tab(text: 'Tab1')],
//                 ))
//           ];
//         },
//         body: Column(
//           children: [
//             Expanded(
//               child: TabBarView(
//                 controller: controller.tabController,
//                 children: [
//                   EasyRefresh(
//                     firstRefresh: true,
//                     firstRefreshWidget: Container(
//                       width: double.infinity,
//                       height: double.infinity,
//                       child: Text("首次刷新"),
//                     ),
//                     header: PhoenixHeader(),
//                     onRefresh: () async {
//                       await Future.delayed(Duration(seconds: 2), () {
//                         if (true) {
//                           controller.count.value = 20;
//                         }
//                       });
//                     },
//                     onLoad: () async {
//                       await Future.delayed(Duration(seconds: 2), () {
//                         if (true) {
//                           controller.count.value += 10;
//                         }
//                       });
//                     },
//                     child: Obx(
//                       () => ListView.builder(
//                         controller: controller.scrollController,
//                         shrinkWrap: true,
//                         itemBuilder: (BuildContext context, int index) {
//                           return Container(
//                             height: 80,
//                             color: Colors
//                                 .primaries[index % Colors.primaries.length],
//                             alignment: Alignment.center,
//                             child: Text(
//                               '$index',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 20),
//                             ),
//                           );
//                         },
//                         itemCount: controller.count.value,
//                       ),
//                     ),
//                   ),
//                   Text("data2")
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   //顶部
//   AppBar messageAppBar() {
//     return AppBar(
//       leadingWidth: double.infinity,
//       leading: Padding(
//         padding: EdgeInsets.only(left: Adapt.px(30), top: Adapt.px(25)),
//         child: Text(
//           "消息",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: Adapt.px(40)),
//         ),
//       ),
//       actions: [
//         Padding(
//           padding: EdgeInsets.only(right: Adapt.px(15)),
//           child: Icon(
//             Icons.search,
//             size: Adapt.px(60),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(right: Adapt.px(25)),
//           child: Icon(
//             Icons.add,
//             size: Adapt.px(60),
//           ),
//         )
//       ],
//     );
//   }
// }

















// import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyrefresh/easy_refresh.dart';
// import 'package:flutter_hubang/pages/message/components/message_tab.dart';
// import 'package:flutter_hubang/pages/message/components/top_content.dart';
// import 'package:flutter_hubang/pages/message/message_controller.dart';
// import 'package:flutter_hubang/utils/adapt.dart';
// import 'package:get/get.dart';

// class MessageView extends GetView<MessageController> {
//   const MessageView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Get.put(MessageController());
//     final double pinnedHeaderHeight =
//         //statusBar height
//         Adapt.botbarH +
//             //pinned SliverAppBar height in header
//             kToolbarHeight +
//             Adapt.px(180);
//     return Scaffold(
//         appBar: messageAppBar(),
//         body: ExtendedNestedScrollView(
//           pinnedHeaderSliverHeightBuilder: () {
//             return pinnedHeaderHeight;
//           },
//           onlyOneScrollInBody: true,
//           headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//             return messageTop();
//           },
//           body: Column(
//             children: [
//               TabBar(
//                 controller: controller.tabController,
//                 labelColor: Colors.blue,
//                 indicatorColor: Colors.blue,
//                 indicatorSize: TabBarIndicatorSize.label,
//                 indicatorWeight: 2.0,
//                 isScrollable: false,
//                 unselectedLabelColor: Colors.grey,
//                 tabs: const <Tab>[Tab(text: 'Tab0'), Tab(text: 'Tab1')],
//               ),
//               Expanded(
//                   child: TabBarView(
//                 controller: controller.tabController,
//                 children: [Text("data1"), Text("data2")],
//               ))
//             ],
//           ),
//         ));
//   }

//   //顶部
//   AppBar messageAppBar() {
//     return AppBar(
//       leadingWidth: double.infinity,
//       leading: Padding(
//         padding: EdgeInsets.only(left: Adapt.px(30), top: Adapt.px(25)),
//         child: Text(
//           "消息",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: Adapt.px(40)),
//         ),
//       ),
//       actions: [
//         Padding(
//           padding: EdgeInsets.only(right: Adapt.px(15)),
//           child: Icon(
//             Icons.search,
//             size: Adapt.px(60),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(right: Adapt.px(25)),
//           child: Icon(
//             Icons.add,
//             size: Adapt.px(60),
//           ),
//         )
//       ],
//     );
//   }
// }

// List<Widget> messageTop() {
//   final List<Widget> widgets = <Widget>[];
//   widgets.add(const SliverToBoxAdapter(
//     child: TopContent(),
//   ));
//   return widgets;
// }

// EasyRefresh.custom(
//           header: PhoenixHeader(),
//           footer: PhoenixFooter(),
//           onRefresh: () async {
//             await Future.delayed(Duration(seconds: 2), () {
//               if (true) {
//                 controller.count.value = 20;
//               }
//             });
//           },
//           onLoad: () async {
//             await Future.delayed(Duration(seconds: 2), () {
//               if (true) {
//                 controller.count.value += 20;
//               }
//             });
//           },
//           slivers: [
//             const SliverToBoxAdapter(
//               child: TopContent(),
//             ),
//             SliverPersistentHeader(delegate: MessageTabBarDelegate())
//           ],
//         )
