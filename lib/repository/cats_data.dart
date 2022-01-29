
import 'package:json_annotation/json_annotation.dart';

part 'cats_data.g.dart';

@JsonSerializable()
class CatsImage{
  @JsonKey(name: "url")
  String? url;
  CatsImage({this.url});
  factory CatsImage.fromJson(Map<String,dynamic> json) => _$CatsImageFromJson(json);
  Map<String,dynamic> toJson() => _$CatsImageToJson(this);
}

@JsonSerializable()
class CatsInfo{
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "origin")
  String? origin;
  @JsonKey(name: "wikipedia_url")
  String? wikipedia_url;
  @JsonKey(name: "image")
  CatsImage? image;

  CatsInfo({required this.name,this.origin,this.wikipedia_url,this.image});

  factory CatsInfo.fromJson(Map<String,dynamic> json) => _$CatsInfoFromJson(json);
  Map<String,dynamic> toJson() => _$CatsInfoToJson(this);
}



