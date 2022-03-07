import 'package:flutter_breathe/data/providers/location_dao_service.dart';
import 'package:get/get.dart';

class DenpendencyInjection {
  static Future<void> init() async {
    // 数据库
    Get.put(LocationDaoSerivce().init());
  }
}
