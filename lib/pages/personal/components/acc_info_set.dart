import 'package:flutter/material.dart';
import 'package:flutter_hubang/pages/personal/personal_controller.dart';
import 'package:flutter_hubang/widgets/more_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AccInfoSet extends GetView<PersonalController> {
  const AccInfoSet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: 1.sw,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ALECTANG",
                style: TextStyle(fontSize: 50.w, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.w),
              const Text("ID:1111111111"),
              SizedBox(height: 10.w),
              const Divider(
                height: 1.0,
                color: Colors.grey,

                // indent: 15.0,
                // endIndent: 15.0,
              ),
              Wrap(
                spacing: 15.w,
                children: [
                  Chip(
                    label: Text("标签"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  Chip(
                    label: Text("标签"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ],
              ),
              MoreText(
                  "人生无常，大肠包小肠，人生无常，大肠包小肠，人生无常，大肠包小肠，人生无常，大肠包小肠，人生无常，大肠包小肠，人生无常，大肠包小肠",
                  maxLines: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        const Icon(Icons.ice_skating),
                        SizedBox(
                          width: 10.w,
                        ),
                        const Text("编辑资料")
                      ],
                    ),
                  ),
                  SizedBox(width: 20.w),
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        const Icon(Icons.ice_skating),
                        SizedBox(
                          width: 20.w,
                        ),
                        const Text("设置")
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
