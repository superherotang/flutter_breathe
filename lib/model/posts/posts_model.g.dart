// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostsModel _$PostsModelFromJson(Map<String, dynamic> json) => PostsModel(
      json['uuid'] as String,
      json['postsType'] as int,
      json['postsFormat'] as int,
      json['communityId'] as int,
      json['uid'] as int,
      json['postsStatus'] as int,
      json['isTop'] as int,
      json['createTime'] as String,
      json['updateTime'] as String,
      json['isDeleted'] as int,
      (json['postsContent'] ?? '') as String,
      (json['postsImages'] ?? '') as String,
      (json['postsVideos'] ?? '') as String,
      (json['thumbnailImg'] ?? '') as String,
      (json['postsAudio'] ?? '') as String,
    );

Map<String, dynamic> _$PostsModelToJson(PostsModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'postsType': instance.postsType,
      'postsFormat': instance.postsFormat,
      'communityId': instance.communityId,
      'uid': instance.uid,
      'postsStatus': instance.postsStatus,
      'isTop': instance.isTop,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'isDeleted': instance.isDeleted,
      'postsContent': instance.postsContent,
      'postsImages': instance.postsImages,
      'postsVideos': instance.postsVideos,
      'thumbnailImg': instance.thumbnailImg,
      'postsAudio': instance.postsAudio,
    };
