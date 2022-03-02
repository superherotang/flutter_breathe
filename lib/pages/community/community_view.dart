import 'package:flutter/material.dart';
import 'package:flutter_hubang/common/color.dart';
import 'package:flutter_hubang/utils/adapt.dart';
import 'package:flutter_hubang/utils/location_controller.dart';
import 'package:flutter_hubang/widgets/clear_input.dart';
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
              height: Adapt.px(70),
              child: Row(children: [
                Text("当前位置:",
                    style:
                        TextStyle(fontSize: Adapt.px(34), color: Colors.grey)),
                SizedBox(
                  width: Adapt.px(5),
                ),
                InkWell(
                  child: Obx(
                    () => Text(
                      locationController.city.value,
                      style: TextStyle(
                          fontSize: Adapt.px(34),
                          color: AppColor.primaryText,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: Adapt.px(15),
                ),
                InkWell(
                  child: Icon(
                    Icons.ac_unit,
                    size: Adapt.px(40),
                  ),
                )
              ]),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return CommunityCard();
                },
                itemCount: 20,
              ),
            )
          ],
        ));
  }
}
