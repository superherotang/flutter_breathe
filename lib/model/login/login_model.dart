import 'package:json_annotation/json_annotation.dart'; 
  
part 'login_model.g.dart';


@JsonSerializable()
  class LoginModel extends Object {

  @JsonKey(name: 'token')
  String token;

  @JsonKey(name: 'status')
  int status;

  LoginModel(this.token,this.status,);

  factory LoginModel.fromJson(Map<String, dynamic> srcJson) => _$LoginModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

}

  
