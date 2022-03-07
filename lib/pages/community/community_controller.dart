import 'package:flutter_breathe/data/db/database.dart';
import 'package:drift/drift.dart' as D;
import 'package:flutter_breathe/data/db/locations/locations_dao.dart';
import 'package:get/get.dart';

class CommunityController extends GetxController {
  final LocationsDao locationsDao = Get.find<LocationsDao>();

  final List<Location> locations = [];
  var location = "".obs;

  @override
  void onReady() {
    super.onReady();
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
      location.value = locations[0].city;
    } else {
      location.value = locations[0].area!;
    }
    update();
  }
}
