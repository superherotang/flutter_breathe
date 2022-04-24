// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityModel _$CommunityModelFromJson(Map<String, dynamic> json) =>
    CommunityModel(
      json['id'] as int,
      json['communityName'] as String,
      json['avatar'] as String,
      json['description'] as String,
      json['location'] as String,
      json['founder'] as int,
      json['administrator'] as int,
      json['status'] as int,
      json['createdTime'] as String,
    );

Map<String, dynamic> _$CommunityModelToJson(CommunityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'communityName': instance.communityName,
      'avatar': instance.avatar,
      'description': instance.description,
      'location': instance.location,
      'founder': instance.founder,
      'administrator': instance.administrator,
      'status': instance.status,
      'createdTime': instance.createdTime,
    };
