import 'package:flutter_breathe/model/city/location.dart';

class CityPinying {
  const CityPinying({
    required this.pinying,
    required this.name,
    required this.location,
  });

  final String pinying;
  final String name;
  final Location location;
}