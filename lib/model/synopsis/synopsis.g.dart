// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'synopsis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Synopsis _$SynopsisFromJson(Map<String, dynamic> json) => Synopsis(
      json['code'] as int,
      json['msg'] as String,
      (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SynopsisToJson(Synopsis instance) => <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['id'] as int,
      json['likeCount'] as int,
      json['commentCount'] as int,
      json['watchCount'] as int,
      json['text'] as String,
      (json['resource'] as List<dynamic>)
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'likeCount': instance.likeCount,
      'commentCount': instance.commentCount,
      'watchCount': instance.watchCount,
      'text': instance.text,
      'resource': instance.resource,
    };

Resource _$ResourceFromJson(Map<String, dynamic> json) => Resource(
      (json['imgList'] as List<dynamic>).map((e) => e as String).toList(),
      json['videoList'] as List<dynamic>,
      json['soundList'] as List<dynamic>,
      json['bountyList'] as List<dynamic>,
    );

Map<String, dynamic> _$ResourceToJson(Resource instance) => <String, dynamic>{
      'imgList': instance.imgList,
      'videoList': instance.videoList,
      'soundList': instance.soundList,
      'bountyList': instance.bountyList,
    };
