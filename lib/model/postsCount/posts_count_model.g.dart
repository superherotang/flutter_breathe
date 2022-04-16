// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_count_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostsCountModel _$PostsCountModelFromJson(Map<String, dynamic> json) =>
    PostsCountModel(
      json['share'] as int,
      json['comment'] as int,
      json['like'] as int,
    );

Map<String, dynamic> _$PostsCountModelToJson(PostsCountModel instance) =>
    <String, dynamic>{
      'share': instance.share,
      'comment': instance.comment,
      'like': instance.like,
    };
