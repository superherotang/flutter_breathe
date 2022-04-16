import 'package:json_annotation/json_annotation.dart'; 
  
part 'posts_model.g.dart';


List<postsModel> getpostsModelList(List<dynamic> list){
    List<postsModel> result = [];
    list.forEach((item){
      result.add(postsModel.fromJson(item));
    });
    return result;
  }
@JsonSerializable()
  class postsModel extends Object {

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

  postsModel(this.uuid,this.postsType,this.postsFormat,this.communityId,this.uid,this.postsStatus,this.isTop,this.createTime,this.updateTime,this.isDeleted,this.postsContent,this.postsImages,this.postsVideos,this.thumbnailImg,this.postsAudio,);

  factory postsModel.fromJson(Map<String, dynamic> srcJson) => _$postsModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$postsModelToJson(this);

}

  
