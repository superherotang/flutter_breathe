import 'package:json_annotation/json_annotation.dart'; 
  
part 'comment_model.g.dart';


@JsonSerializable()
  class CommentModel extends Object {

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'like')
  int like;

  @JsonKey(name: 'createTime')
  String createTime;

  @JsonKey(name: 'nickname')
  String nickname;

  @JsonKey(name: 'avatar')
  String avatar;

  CommentModel(this.content,this.like,this.createTime,this.nickname,this.avatar,);

  factory CommentModel.fromJson(Map<String, dynamic> srcJson) => _$CommentModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CommentModelToJson(this);

}

  
