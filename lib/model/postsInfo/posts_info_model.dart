import 'package:json_annotation/json_annotation.dart'; 
  
part 'posts_info_model.g.dart';


@JsonSerializable()
  class PostsInfoModel extends Object {

  @JsonKey(name: 'current')
  int current;

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'pages')
  int pages;

  @JsonKey(name: 'size')
  int size;

  @JsonKey(name: 'items')
  List<Items> items;

  PostsInfoModel(this.current,this.total,this.pages,this.size,this.items,);

  factory PostsInfoModel.fromJson(Map<String, dynamic> srcJson) => _$PostsInfoModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PostsInfoModelToJson(this);

}

  
@JsonSerializable()
  class Items extends Object {

  @JsonKey(name: 'uuid')
  String uuid;

  @JsonKey(name: 'postsType')
  int postsType;

  @JsonKey(name: 'postsFormat')
  int postsFormat;

  @JsonKey(name: 'communityId')
  int communityId;

  @JsonKey(name: 'uid')
  int uid;

  @JsonKey(name: 'postsStatus')
  int postsStatus;

  @JsonKey(name: 'isTop')
  int isTop;

  @JsonKey(name: 'createTime')
  String createTime;

  @JsonKey(name: 'updateTime')
  String updateTime;

  @JsonKey(name: 'isDeleted')
  int isDeleted;

  @JsonKey(name: 'postsContent')
  String postsContent;

  @JsonKey(name: 'postsImages')
  String postsImages;

  @JsonKey(name: 'postsVideos')
  String postsVideos;

  @JsonKey(name: 'thumbnailImg')
  String thumbnailImg;

  @JsonKey(name: 'postsAudio')
  String postsAudio;

  @JsonKey(name: 'nickname')
  String nickname;

  @JsonKey(name: 'avatar')
  String avatar;

  @JsonKey(name: 'share')
  int share;

  @JsonKey(name: 'comment')
  int comment;

  @JsonKey(name: 'like')
  int like;

  @JsonKey(name: 'communityName')
  String communityName;

  Items(this.uuid,this.postsType,this.postsFormat,this.communityId,this.uid,this.postsStatus,this.isTop,this.createTime,this.updateTime,this.isDeleted,this.postsContent,this.postsImages,this.postsVideos,this.thumbnailImg,this.postsAudio,this.nickname,this.avatar,this.share,this.comment,this.like,this.communityName,);

  factory Items.fromJson(Map<String, dynamic> srcJson) => _$ItemsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);

}

  
