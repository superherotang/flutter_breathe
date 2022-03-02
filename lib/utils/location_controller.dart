import 'package:flutter_hubang/data/db/database.dart';
import 'package:flutter_hubang/data/db/locations/locations_dao.dart';
import 'package:drift/drift.dart' as D;
import 'package:get/get.dart';

class LocationController extends GetxController {
  late var city = "".obs;
  final LocationsDao locationsDao = Get.find<LocationsDao>();

  final List<Location> locations = [];

  @override
  void onReady() {
    super.onReady();
    getLocation();
  }

  void updateLocation() {
    getLocation();
  }

  void getLocation() async {
    try {
      var list = await locationsDao.getDescLocations();

      if (list.isNotEmpty) {
        locations.clear();
        locations.add(list[0]);
      } else {
        //无数据 定义
        Location location = Location(city: "北京");
        locations.add(location);
        await locationsDao.insertLocation(const LocationsCompanion(
          city: D.Value('北京'),
        ));
      }
    } catch (e) {}
    if (locations[0].area == null) {
      city.value = locations[0].city;
    } else {
      city.value = locations[0].area!;
    }
  }
}
