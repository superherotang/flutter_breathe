import 'package:flutter/material.dart';
import 'package:flutter_hubang/pages/personal/personal_controller.dart';
import 'package:flutter_hubang/utils/adapt.dart';
import 'package:flutter_hubang/widgets/more_text.dart';
import 'package:get/get.dart';

class AccInfoSet extends GetView<PersonalController> {
  const AccInfoSet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: Adapt.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Adapt.px(30)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ALECTANG",
                style: TextStyle(
                    fontSize: Adapt.px(50), fontWeight: FontWeight.bold),
              ),
              SizedBox(height: Adapt.px(10)),
              const Text("ID:1111111111"),
              SizedBox(height: Adapt.px(10)),
              const Divider(
                height: 1.0,
                color: Colors.grey,

                // indent: 15.0,
                // endIndent: 15.0,
              ),
              Wrap(
                spacing: Adapt.px(15),
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
                          width: Adapt.px(10),
                        ),
                        const Text("编辑资料")
                      ],
                    ),
                  ),
                  SizedBox(width: Adapt.px(20)),
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        const Icon(Icons.ice_skating),
                        SizedBox(
                          width: Adapt.px(20),
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
