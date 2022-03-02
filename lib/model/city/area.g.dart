// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Area _$AreaFromJson(Map<String, dynamic> json) => Area(
      json['value'] as String,
      json['label'] as String,
      (json['city'] as List<dynamic>)
          .map((e) => City.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
      'city': instance.city,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      json['value'] as String,
      json['label'] as String,
      (json['county'] as List<dynamic>)
          .map((e) => County.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
      'county': instance.county,
    };

County _$CountyFromJson(Map<String, dynamic> json) => County(
      json['value'] as String,
      json['label'] as String,
    );

Map<String, dynamic> _$CountyToJson(County instance) => <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
    };
