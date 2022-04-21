// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

pageModel _$pageModelFromJson(Map<String, dynamic> json) => pageModel(
      json['current'] as int,
      json['total'] as int,
      json['pages'] as int,
      json['size'] as int,
      json['items'] as List<dynamic>,
    );

Map<String, dynamic> _$pageModelToJson(pageModel instance) => <String, dynamic>{
      'current': instance.current,
      'total': instance.total,
      'pages': instance.pages,
      'size': instance.size,
      'items': instance.items,
    };
