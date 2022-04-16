import 'package:json_annotation/json_annotation.dart'; 
  
part 'posts_count_model.g.dart';


@JsonSerializable()
  class PostsCountModel extends Object {

  @JsonKey(name: 'share')
  int share;

  @JsonKey(name: 'comment')
  int comment;

  @JsonKey(name: 'like')
  int like;

  PostsCountModel(this.share,this.comment,this.like,);

  factory PostsCountModel.fromJson(Map<String, dynamic> srcJson) => _$PostsCountModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PostsCountModelToJson(this);

}

  
