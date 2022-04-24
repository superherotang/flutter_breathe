// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_community_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyCommunityModel _$MyCommunityModelFromJson(Map<String, dynamic> json) =>
    MyCommunityModel(
      json['id'] as int,
      json['communityName'] as String,
      json['avatar'] as String,
    );

Map<String, dynamic> _$MyCommunityModelToJson(MyCommunityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'communityName': instance.communityName,
      'avatar': instance.avatar,
    };
