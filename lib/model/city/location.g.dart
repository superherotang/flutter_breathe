// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      (json['area']?? '') as String,
      (json['city']?? '') as String,
      (json['county']?? '') as String,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'area': instance.area,
      'city': instance.city,
      'county': instance.county,
    };
