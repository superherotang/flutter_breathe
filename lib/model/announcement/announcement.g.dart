// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Announcement _$AnnouncementFromJson(Map<String, dynamic> json) => Announcement(
      json['contentType'] as int,
      json['postsContent'] as String,
    );

Map<String, dynamic> _$AnnouncementToJson(Announcement instance) =>
    <String, dynamic>{
      'contentType': instance.contentType,
      'postsContent': instance.postsContent,
    };
