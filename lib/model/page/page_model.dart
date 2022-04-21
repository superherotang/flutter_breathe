import 'package:json_annotation/json_annotation.dart'; 
  
part 'page_model.g.dart';


@JsonSerializable()
  class PageModel extends Object {

  @JsonKey(name: 'current')
  int current;

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'pages')
  int pages;

  @JsonKey(name: 'size')
  int size;

  @JsonKey(name: 'items')
  List<dynamic> items;

  PageModel(this.current,this.total,this.pages,this.size,this.items,);

  factory PageModel.fromJson(Map<String, dynamic> srcJson) => _$PageModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PageModelToJson(this);

}

  
