import 'package:json_annotation/json_annotation.dart'; 
  
part 'user_count_model.g.dart';


@JsonSerializable()
  class UserCountModel extends Object {

  @JsonKey(name: 'like')
  int like;

  @JsonKey(name: 'follow')
  int follow;

  @JsonKey(name: 'fans')
  int fans;

  @JsonKey(name: 'history')
  int history;

  UserCountModel(this.like,this.follow,this.fans,this.history,);

  factory UserCountModel.fromJson(Map<String, dynamic> srcJson) => _$UserCountModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserCountModelToJson(this);

}

  
