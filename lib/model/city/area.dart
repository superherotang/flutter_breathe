import 'package:json_annotation/json_annotation.dart';

part 'area.g.dart';

List<Area> getAreaList(List<dynamic> list) {
  List<Area> result = [];
  list.forEach((item) {
    result.add(Area.fromJson(item));
  });
  return result;
}

@JsonSerializable()
class Area extends Object {
  @JsonKey(name: 'value')
  String value;

  @JsonKey(name: 'label')
  String label;

  @JsonKey(name: 'city')
  List<City> city;

  Area(
    this.value,
    this.label,
    this.city,
  );

  factory Area.fromJson(Map<String, dynamic> srcJson) =>
      _$AreaFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AreaToJson(this);
}

@JsonSerializable()
class City extends Object {
  @JsonKey(name: 'value')
  String value;

  @JsonKey(name: 'label')
  String label;

  @JsonKey(name: 'county')
  List<County> county;

  City(
    this.value,
    this.label,
    this.county,
  );

  factory City.fromJson(Map<String, dynamic> srcJson) =>
      _$CityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable()
class County extends Object {
  @JsonKey(name: 'value')
  String value;

  @JsonKey(name: 'label')
  String label;

  County(
    this.value,
    this.label,
  );

  factory County.fromJson(Map<String, dynamic> srcJson) =>
      _$CountyFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CountyToJson(this);
}
