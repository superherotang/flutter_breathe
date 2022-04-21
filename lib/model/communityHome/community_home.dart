import 'package:json_annotation/json_annotation.dart'; 
  
part 'community_home.g.dart';


@JsonSerializable()
  class CommunityHome extends Object {

  @JsonKey(name: 'cAvatar')
  String cAvatar;

  @JsonKey(name: 'cAdmin')
  String cAdmin;

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

  CommunityHome(this.cAvatar,this.cAdmin,this.id,this.communityName,this.avatar,this.description,this.location,);

  factory CommunityHome.fromJson(Map<String, dynamic> srcJson) => _$CommunityHomeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CommunityHomeToJson(this);

}

  
