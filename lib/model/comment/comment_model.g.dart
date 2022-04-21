// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
      json['content'] as String,
      json['like'] as int,
      json['createTime'] as String,
      json['nickname'] as String,
      json['avatar'] as String,
    );

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'content': instance.content,
      'like': instance.like,
      'createTime': instance.createTime,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
    };
