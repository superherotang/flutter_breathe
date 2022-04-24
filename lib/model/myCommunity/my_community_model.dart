import 'package:json_annotation/json_annotation.dart'; 
  
part 'my_community_model.g.dart';


@JsonSerializable()
  class MyCommunityModel extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'communityName')
  String communityName;

  @JsonKey(name: 'avatar')
  String avatar;

  MyCommunityModel(this.id,this.communityName,this.avatar,);

  factory MyCommunityModel.fromJson(Map<String, dynamic> srcJson) => _$MyCommunityModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MyCommunityModelToJson(this);

}

  
