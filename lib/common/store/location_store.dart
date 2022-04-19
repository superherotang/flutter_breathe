import 'package:flutter_breathe/model/city/location.dart';
import 'package:get/get.dart';

import '../../service/storage_service.dart';

class LocationStore extends GetxController {
  static LocationStore get to => Get.find();
  // 历史记录
  RxList<dynamic> historyLocationList = [].obs;

  var city = ''.obs;

  @override
  void onInit() {
    super.onInit();
    List<Map<String, dynamic>> hisData =
        List.from(StorageService().getJSON("location") ?? []);
    historyLocationList.addAll(hisData);
    if (historyLocationList.isEmpty) {
      add(location: const Location(area: '北京市', city: '北京', county: ''));
    }
    updateCity();
  }

  //更新城市
  void updateCity() {
    if (historyLocationList.first['county'] == '') {
      city.value = historyLocationList.first['city'];
    } else {
      city.value = historyLocationList.first['county'];
    }
  }

  Future<void> upadte() async {
    List<Map<String, dynamic>> hisData =
        List.from(await StorageService().getJSON("location") ?? []);
    List<dynamic> list = hisData;
    historyLocationList.value = list;
    updateCity();
  }

  Future<bool> add({
    required Location location,
  }) async {
    //判断是否被记录过
    if (location.county == "") {
      if (historyLocationList.any((el) => el["city"] == city)) {
        historyLocationList.removeWhere((el) => el["city"] == city);
      }
    } else {
      if (historyLocationList.any((el) => el["district"] == location.county)) {
        historyLocationList
            .removeWhere((el) => el["district"] == location.county);
      }
    }

    //大于容量删除
    if (historyLocationList.length >= 5) {
      historyLocationList.removeLast();
    }
    historyLocationList.insert(0, <String, String>{
      "area": location.area,
      "city": location.city,
      "county": location.county,
    });
    return StorageService().setJSON('location', historyLocationList.toList());
  }
}
