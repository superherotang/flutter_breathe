import 'package:json_annotation/json_annotation.dart'; 
  
part 'user_data_model.g.dart';


@JsonSerializable()
  class UserDataModel extends Object {

  @JsonKey(name: 'uid')
  int uid;

  @JsonKey(name: 'avatar')
  String avatar;

  @JsonKey(name: 'background')
  String background;

  @JsonKey(name: 'nickname')
  String nickname;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'sex')
  int sex;

  @JsonKey(name: 'birthday')
  String birthday;

  @JsonKey(name: 'location')
  String location;

  UserDataModel(this.uid,this.avatar,this.background,this.nickname,this.description,this.sex,this.birthday,this.location,);

  factory UserDataModel.fromJson(Map<String, dynamic> srcJson) => _$UserDataModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);

}

  
