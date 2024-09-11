// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Character {
  int? id;
  String? fullName, title, family, imageUrl;
  Character({this.family, this.fullName, this.imageUrl, this.title,this.id});

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}