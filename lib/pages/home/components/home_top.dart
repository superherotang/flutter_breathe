import 'package:flutter/material.dart';
import 'package:flutter_hubang/pages/home/home_controller.dart';
import 'package:flutter_hubang/routes/app_routes.dart';
import 'package:flutter_hubang/utils/location_controller.dart';
import 'package:flutter_hubang/widgets/clear_input.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeTop extends GetView<HomeController> {
  const HomeTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //选择城市
        selectCity(),
        //搜索框
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 10.w),
          child: ClearInput(
              readOnly: true,
              onTap: () {
                print("object");
              }),
        )),
        add(),
      ],
    );
  }

  Widget selectCity() {
    var locationController = Get.find<LocationController>();
    return InkWell(
      onTap: () async {
        //跳转传值
        await Get.toNamed(Routes.CITY);
        controller.getLocation();
      },
      child: Row(
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: 150.w),
            child: Obx(
              () => Text(locationController.city.value,
                  style: TextStyle(fontSize: 36.w, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1),
            ),
          ),
          SvgPicture.asset(
            'assets/icon/down.svg',
            width: 32.w,
            height: 32.w,
          )
        ],
      ),
    );
  }

  Widget add() {
    return Container(
      padding: const EdgeInsets.only(left: 5),
      child: const Icon(
        Icons.add,
        size: 30,
      ),
    );
  }
}
