// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageInfo _$MessageInfoFromJson(Map<String, dynamic> json) => MessageInfo(
      json['suid'] as int,
      json['tuid'] as int,
      json['content'] as String,
      json['states'] as int,
    );

Map<String, dynamic> _$MessageInfoToJson(MessageInfo instance) =>
    <String, dynamic>{
      'suid': instance.suid,
      'tuid': instance.tuid,
      'content': instance.content,
      'states': instance.states,
    };
