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

  @JsonKey(name: 'citys')
  List<Citys> citys;

  Area(
    this.value,
    this.label,
    this.citys,
  );

  factory Area.fromJson(Map<String, dynamic> srcJson) =>
      _$AreaFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AreaToJson(this);
}

@JsonSerializable()
class Citys extends Object {
  @JsonKey(name: 'value')
  String value;

  @JsonKey(name: 'label')
  String label;

  @JsonKey(name: 'children')
  List<Children> children;

  Citys(
    this.value,
    this.label,
    this.children,
  );

  factory Citys.fromJson(Map<String, dynamic> srcJson) =>
      _$CitysFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CitysToJson(this);
}

@JsonSerializable()
class Children extends Object {
  @JsonKey(name: 'value')
  String value;

  @JsonKey(name: 'label')
  String label;

  Children(
    this.value,
    this.label,
  );

  factory Children.fromJson(Map<String, dynamic> srcJson) =>
      _$ChildrenFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ChildrenToJson(this);
}
