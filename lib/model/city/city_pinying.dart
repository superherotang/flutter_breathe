import 'package:flutter_hubang/model/city/area.dart';

class CityPinying {
  const CityPinying({
    required this.pinying,
    required this.name,
    required this.city,
  });

  final String pinying;
  final String name;
  final City city;
}
