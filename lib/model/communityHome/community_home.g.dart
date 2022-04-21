// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityHome _$CommunityHomeFromJson(Map<String, dynamic> json) =>
    CommunityHome(
      json['cAvatar'] as String,
      json['cAdmin'] as String,
      json['id'] as int,
      json['communityName'] as String,
      json['avatar'] as String,
      json['description'] as String,
      json['location'] as String,
    );

Map<String, dynamic> _$CommunityHomeToJson(CommunityHome instance) =>
    <String, dynamic>{
      'cAvatar': instance.cAvatar,
      'cAdmin': instance.cAdmin,
      'id': instance.id,
      'communityName': instance.communityName,
      'avatar': instance.avatar,
      'description': instance.description,
      'location': instance.location,
    };
