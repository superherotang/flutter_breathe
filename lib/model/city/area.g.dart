// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Area _$AreaFromJson(Map<String, dynamic> json) => Area(
      json['value'] as String,
      json['label'] as String,
      (json['citys'] as List<dynamic>)
          .map((e) => Citys.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
      'citys': instance.citys,
    };

Citys _$CitysFromJson(Map<String, dynamic> json) => Citys(
      json['value'] as String,
      json['label'] as String,
      (json['children'] as List<dynamic>)
          .map((e) => Children.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CitysToJson(Citys instance) => <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
      'children': instance.children,
    };

Children _$ChildrenFromJson(Map<String, dynamic> json) => Children(
      json['value'] as String,
      json['label'] as String,
    );

Map<String, dynamic> _$ChildrenToJson(Children instance) => <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
    };
