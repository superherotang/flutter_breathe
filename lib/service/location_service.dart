import 'package:flutter_breathe/utils/storage.dart';
import 'package:get/get.dart';

class LocationService extends GetxService {
  // 历史记录
  RxList<dynamic> historyLocationList = [].obs;

  var city = ''.obs;

  Future<LocationService> init() async {
    List<Map<String, dynamic>> hisData =
        List.from(SpUtil().getJSON("location") ?? []);
    historyLocationList.addAll(hisData);
    if (historyLocationList.isEmpty) {
      add(area: '北京市', city: '北京', county: '');
    }
    updateCity();
    return this;
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
        List.from(SpUtil().getJSON("location") ?? []);
    List<dynamic> list = hisData;
    historyLocationList.value = list;
    updateCity();
  }

  Future<bool> add({
    required String area,
    required String city,
    required String county,
  }) async {
    //判断是否被记录过
    if (county == "") {
      if (historyLocationList.any((el) => el["city"] == city)) {
        historyLocationList.removeWhere((el) => el["city"] == city);
      }
    } else {
      if (historyLocationList.any((el) => el["district"] == county)) {
        historyLocationList.removeWhere((el) => el["district"] == county);
      }
    }

    //大于容量删除
    if (historyLocationList.length >= 5) {
      historyLocationList.removeLast();
    }
    historyLocationList.insert(0, <String, String>{
      "area": area,
      "city": city,
      "county": county,
    });
    return SpUtil().setJSON('location', historyLocationList.toList());
  }
}
