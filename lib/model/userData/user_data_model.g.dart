// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) =>
    UserDataModel(
      json['uid'] as int,
      json['avatar']??[] as String,
      json['background']??[] as String,
      json['nickname'] as String,
      json['description']??[] as String,
      json['sex']??[] as int,
      json['birthday']??[] as String,
      json['location']??[] as String,
    );

Map<String, dynamic> _$UserDataModelToJson(UserDataModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'avatar': instance.avatar,
      'background': instance.background,
      'nickname': instance.nickname,
      'description': instance.description,
      'sex': instance.sex,
      'birthday': instance.birthday,
      'location': instance.location,
    };
