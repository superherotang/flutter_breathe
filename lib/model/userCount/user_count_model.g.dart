// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_count_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCountModel _$UserCountModelFromJson(Map<String, dynamic> json) =>
    UserCountModel(
      json['like'] as int,
      json['follow'] as int,
      json['fans'] as int,
      json['history'] as int,
    );

Map<String, dynamic> _$UserCountModelToJson(UserCountModel instance) =>
    <String, dynamic>{
      'like': instance.like,
      'follow': instance.follow,
      'fans': instance.fans,
      'history': instance.history,
    };
