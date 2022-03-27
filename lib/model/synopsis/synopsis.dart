import 'package:json_annotation/json_annotation.dart';

part 'synopsis.g.dart';

@JsonSerializable()
class Synopsis extends Object {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  List<Data> data;

  Synopsis(
    this.code,
    this.msg,
    this.data,
  );

  factory Synopsis.fromJson(Map<String, dynamic> srcJson) =>
      _$SynopsisFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SynopsisToJson(this);
}

@JsonSerializable()
class Data extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'likeCount')
  int likeCount;

  @JsonKey(name: 'commentCount')
  int commentCount;

  @JsonKey(name: 'watchCount')
  int watchCount;

  @JsonKey(name: 'text')
  String text;

  @JsonKey(name: 'resource')
  List<Resource> resource;

  Data(
    this.id,
    this.likeCount,
    this.commentCount,
    this.watchCount,
    this.text,
    this.resource,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Resource extends Object {
  @JsonKey(name: 'imgList')
  List<String> imgList;

  @JsonKey(name: 'videoList')
  List<dynamic> videoList;

  @JsonKey(name: 'soundList')
  List<dynamic> soundList;

  @JsonKey(name: 'bountyList')
  List<dynamic> bountyList;

  Resource(
    this.imgList,
    this.videoList,
    this.soundList,
    this.bountyList,
  );

  factory Resource.fromJson(Map<String, dynamic> srcJson) =>
      _$ResourceFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResourceToJson(this);
}