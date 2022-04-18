// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostsPageModel _$PostsPageModelFromJson(Map<String, dynamic> json) =>
    PostsPageModel(
      json['current'] as int,
      json['total'] as int,
      json['pages'] as int,
      json['size'] as int,
      (json['items'] as List<dynamic>)
          .map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostsPageModelToJson(PostsPageModel instance) =>
    <String, dynamic>{
      'current': instance.current,
      'total': instance.total,
      'pages': instance.pages,
      'size': instance.size,
      'items': instance.items,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
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
      json['postsContent'] as String,
      json['postsImages'] as String,
      json['postsVideos'] as String,
      json['thumbnailImg'] as String,
      json['postsAudio'] as String,
      json['nickname'] as String,
      json['avatar'] as String,
      json['share'] as int,
      json['comment'] as int,
      json['like'] as int,
      json['communityName'] as String,
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
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
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'share': instance.share,
      'comment': instance.comment,
      'like': instance.like,
      'communityName': instance.communityName,
    };
