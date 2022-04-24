import 'package:json_annotation/json_annotation.dart'; 
  
part 'community_model.g.dart';


@JsonSerializable()
  class CommunityModel extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'communityName')
  String communityName;

  @JsonKey(name: 'avatar')
  String avatar;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'location')
  String location;

  @JsonKey(name: 'founder')
  int founder;

  @JsonKey(name: 'administrator')
  int administrator;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'createdTime')
  String createdTime;

  CommunityModel(this.id,this.communityName,this.avatar,this.description,this.location,this.founder,this.administrator,this.status,this.createdTime,);

  factory CommunityModel.fromJson(Map<String, dynamic> srcJson) => _$CommunityModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CommunityModelToJson(this);

}

  
