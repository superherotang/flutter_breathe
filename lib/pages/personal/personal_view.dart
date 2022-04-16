import 'dart:convert';

import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breathe/common/apis/posts_api.dart';
import 'package:flutter_breathe/common/color.dart';
import 'package:flutter_breathe/common/middlewares/router_auth.dart';
import 'package:flutter_breathe/common/store/user_store.dart';
import 'package:flutter_breathe/model/request/my_response.dart';
import 'package:flutter_breathe/model/synopsis/synopsis.dart';
import 'package:flutter_breathe/pages/personal/components/top_image_appbar.dart';
import 'package:flutter_breathe/routes/app_routes.dart';
import 'package:flutter_breathe/utils/mock.dart';
import 'package:flutter_breathe/widgets/more_text.dart';
import 'package:flutter_breathe/widgets/multi_content.dart';
import 'package:flutter_breathe/widgets/null_content.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            tabs: const [Tab(text: '我的帖子'), Tab(text: '我的收藏')],
          ),
          Expanded(
              child: TabBarView(
            controller: controller.tabController,
            children: [
              posts(),
              NullContent(),
            ],
          ))
        ]),
      ),
    );
  }
}

Widget posts() {
  var controller = Get.find<PersonalController>();
  //Synopsis synopsis = Synopsis.fromJson(json.decode(JsonString.postsCount));
  return Material(
    color: AppColor.listBackground,
    child: Obx(
      () => EasyRefresh(
        header: LinkHeader(
          controller.headerNotifier,
          extent: 1.sh,
          triggerDistance: 1.sh,
          completeDuration: Duration(milliseconds: 500),
        ),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1), () {
            controller.refreshMyPost();
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 2), () {
            controller.loadMyPost();
          });
        },
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 20.w),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.w)),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(255, 223, 241, 243),
                          offset: Offset(0.0, 15.0), //阴影xy轴偏移量
                          blurRadius: 10.0, //阴影模糊程度
                          spreadRadius: 1.0 //阴影扩散程度
                          )
                    ]),
                child: MultiContent(
                    postsModel: controller.myPosts.elementAt(index)),
              ),
            );
          },
          itemCount: controller.myPosts.length,
        ),
      ),
    ),
  );
}

List<Widget> personalTopBuilder() {
  final List<Widget> widgets = <Widget>[];
  widgets.add(const TopImageAppbar());
  widgets.add(topContent());

  return widgets;
}

Widget topContent() {
  var controller = Get.find<PersonalController>();
  return SliverToBoxAdapter(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GestureDetector(
          onTap: () {
            if (controller.id == null) {
              UserStore().token.value.isEmpty ? RouteAuth().auth(null) : null;
            }
          },
          child: Obx(
            () => Text(
              controller.userDataModel.value.nickname,
              style: TextStyle(
                  fontSize: 40.w,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
        ),
        SizedBox(height: 10.w),
        Row(
          children: [
            Obx(
              () => Text.rich(TextSpan(children: [
                const TextSpan(text: "呼吸号: "),
                TextSpan(
                  text: controller.userDataModel.value.uid.toString(),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      if (controller.id == null) {
                        UserStore().token.value.isEmpty
                            ? RouteAuth().auth(null)
                            : null;
                      }
                    },
                )
              ])),
            ),
          ],
        ),
        const Divider(),
        Obx(() =>
            MoreText(controller.userDataModel.value.description, maxLines: 4)),
        SizedBox(height: 10.w),
        Row(
          children: [
            Expanded(
              child: controller.id == null
                  ? InkWell(
                      onTap: () {
                        if (controller.id == null) {
                          UserStore().token.value.isEmpty
                              ? RouteAuth().auth(null)
                              : null;
                        }
                      },
                      child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 10.w),
                          color: AppColor.primaryColor,
                          child: Text(
                            "编辑资料",
                            style: TextStyle(
                                height: 1.5,
                                fontSize: 30.w,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    )
                  : InkWell(
                      onTap: () {},
                      child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 10.w),
                          color: AppColor.primaryColor,
                          child: Text(
                            "+ 关注",
                            style: TextStyle(
                                height: 1.5,
                                fontSize: 30.w,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: controller.id == null
                  ? InkWell(
                      onTap: () {
                        if (controller.id == null) {
                          UserStore().token.value.isEmpty
                              ? RouteAuth().auth(null)
                              : null;
                        }
                      },
                      child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 10.w),
                          color: AppColor.primaryColor,
                          child: Text(
                            "添加朋友",
                            style: TextStyle(
                                height: 1.5,
                                fontSize: 30.w,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    )
                  : InkWell(
                      onTap: () {},
                      child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 10.w),
                          color: AppColor.primaryColor,
                          child: Text(
                            "私信",
                            style: TextStyle(
                                height: 1.5,
                                fontSize: 30.w,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
            ),
          ],
        )
      ]),
    ),
  );
}
