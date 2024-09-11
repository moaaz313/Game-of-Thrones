// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      family: json['family'] as String?,
      fullName: json['fullName'] as String?,
      imageUrl: json['imageUrl'] as String?,
      title: json['title'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'title': instance.title,
      'family': instance.family,
      'imageUrl': instance.imageUrl,
    };
