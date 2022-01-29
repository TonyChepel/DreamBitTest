// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cats_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatsImage _$CatsImageFromJson(Map<String, dynamic> json) => CatsImage(
      url: json['url'] as String?,
    );

Map<String, dynamic> _$CatsImageToJson(CatsImage instance) => <String, dynamic>{
      'url': instance.url,
    };

CatsInfo _$CatsInfoFromJson(Map<String, dynamic> json) => CatsInfo(
      name: json['name'] as String?,
      origin: json['origin'] as String?,
      wikipedia_url: json['wikipedia_url'] as String?,
      image: json['image'] == null
          ? null
          : CatsImage.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CatsInfoToJson(CatsInfo instance) => <String, dynamic>{
      'name': instance.name,
      'origin': instance.origin,
      'wikipedia_url': instance.wikipedia_url,
      'image': instance.image,
    };
