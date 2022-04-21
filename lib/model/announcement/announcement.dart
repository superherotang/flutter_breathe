import 'package:json_annotation/json_annotation.dart'; 
  
part 'announcement.g.dart';


@JsonSerializable()
  class Announcement extends Object {

  @JsonKey(name: 'contentType')
  int contentType;

  @JsonKey(name: 'postsContent')
  String postsContent;

  Announcement(this.contentType,this.postsContent,);

  factory Announcement.fromJson(Map<String, dynamic> srcJson) => _$AnnouncementFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AnnouncementToJson(this);

}

  
