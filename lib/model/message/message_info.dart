import 'package:json_annotation/json_annotation.dart'; 
  
part 'message_info.g.dart';


@JsonSerializable()
  class MessageInfo extends Object {

  @JsonKey(name: 'suid')
  int suid;

  @JsonKey(name: 'tuid')
  int tuid;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'states')
  int states;

  MessageInfo(this.suid,this.tuid,this.content,this.states,);

  factory MessageInfo.fromJson(Map<String, dynamic> srcJson) => _$MessageInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MessageInfoToJson(this);

}

  
