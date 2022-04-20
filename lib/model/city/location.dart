import 'package:json_annotation/json_annotation.dart'; 
  
part 'location.g.dart';


@JsonSerializable()
  class Location extends Object {

  @JsonKey(name: 'area')
  String area;

  @JsonKey(name: 'city')
  String city;

  @JsonKey(name: 'county')
  String county;

  Location(this.area,this.city,this.county,);

  factory Location.fromJson(Map<String, dynamic> srcJson) => _$LocationFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

}

  
