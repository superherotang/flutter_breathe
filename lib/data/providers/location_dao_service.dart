import 'package:flutter_hubang/data/db/database.dart';
import 'package:flutter_hubang/data/db/locations/locations_dao.dart';
import 'package:get/get.dart';

class LocationDaoSerivce extends GetxService {
  LocationsDao init() {
    AppDatabase database = AppDatabase();
    return LocationsDao(database);
  }
}
