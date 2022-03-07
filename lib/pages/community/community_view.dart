import 'package:flutter/material.dart';
import 'package:flutter_breathe/common/color.dart';

import 'package:flutter_breathe/utils/location_controller.dart';
import 'package:flutter_breathe/widgets/clear_input.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'community_controller.dart';
import 'components/community_card.dart';

class CommunityView extends GetView<CommunityController> {
  const CommunityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locationController = Get.find<LocationController>();
    return Scaffold(
        backgroundColor: AppColor.oftenBackground,
        appBar: AppBar(
          title: ClearInput(
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
                        locationController.city.value,
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
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return const CommunityCard();
                },
                itemCount: 20,
              ),
            )
          ],
        ));
  }
}
