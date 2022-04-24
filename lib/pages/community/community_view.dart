import 'package:flutter/material.dart';
import 'package:flutter_breathe/common/color.dart';
import 'package:flutter_breathe/common/store/location_store.dart';
import 'package:flutter_breathe/widgets/keep_alive_wrapper.dart';
import 'package:flutter_breathe/widgets/loading_view.dart';

import 'package:flutter_breathe/widgets/search_input.dart';
import 'package:flutter_breathe/widgets/status.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'community_controller.dart';
import 'components/community_card.dart';

class CommunityView extends GetView<CommunityController> {
  const CommunityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocationStore locationService = Get.find<LocationStore>();
    return Scaffold(
        backgroundColor: AppColor.oftenBackground,
        appBar: AppBar(
          title: SearchInput(
            readOnly: true,
            onTap: () {},
          ),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              alignment: Alignment.center,
              width: double.infinity,
              height: 70.w,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Row(children: [
                  Text("当前位置:",
                      style: TextStyle(fontSize: 34.w, color: Colors.grey)),
                  SizedBox(
                    width: 5.w,
                  ),
                  InkWell(
                    child: Obx(
                      () => Text(
                        locationService.city.value,
                        style: TextStyle(
                            fontSize: 34.w,
                            color: AppColor.primaryText,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  InkWell(
                    child: Icon(
                      Icons.ac_unit,
                      size: 40.w,
                    ),
                  )
                ]),
              ),
            ),
            Expanded(
              child: KeepAliveWrapper(
                child: LoadingView(
                    future: controller.refreshMyPost(),
                    doneWidget: Obx(() => EasyRefresh(
                          emptyWidget: controller.communityList.isEmpty
                              ? nullStatus()
                              : null,
                          header: PhoenixHeader(),
                          footer: ClassicalFooter(enableHapticFeedback: true),
                          onRefresh: () async {
                            controller.refreshMyPost();
                          },
                          onLoad: () async {
                            controller.loadMyPost();
                          },
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return CommunityCard(
                                  communityModel:
                                      controller.communityList[index]);
                            },
                            itemCount: controller.communityList.length,
                          ),
                        ))),
              ),
            )
          ],
        ));
  }
}
