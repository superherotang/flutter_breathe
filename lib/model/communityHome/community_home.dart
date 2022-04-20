import 'package:json_annotation/json_annotation.dart'; 
  
part 'community_home.g.dart';


@JsonSerializable()
  class CommunityHome extends Object {

  @JsonKey(name: 'community')
  Community community;

  @JsonKey(name: 'cAdmin')
  String cAdmin;

  CommunityHome(this.community,this.cAdmin,);

  factory CommunityHome.fromJson(Map<String, dynamic> srcJson) => _$CommunityHomeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CommunityHomeToJson(this);

}

  
@JsonSerializable()
  class Community extends Object {

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

  Community(this.id,this.communityName,this.avatar,this.description,this.location,this.founder,this.administrator,this.status,this.createdTime,);

  factory Community.fromJson(Map<String, dynamic> srcJson) => _$CommunityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CommunityToJson(this);

}

  
