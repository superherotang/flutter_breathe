// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyResponse _$MyResponseFromJson(Map<String, dynamic> json) => MyResponse(
      json['success'] as bool,
      json['code'] as int,
      json['message'] as String,
      json['data'],
    );

Map<String, dynamic> _$MyResponseToJson(MyResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
