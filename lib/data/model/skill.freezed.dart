// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package

part of 'skill.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Skill _$SkillFromJson(Map<String, dynamic> json) {
  return _Skill.fromJson(json);
}

mixin _$Skill {
  String get id;
  String get name;
  String get image;

  Skill copyWith({String id, String name, String image});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_Skill implements _Skill {
  _$_Skill({this.id, this.name, this.image});

  factory _$_Skill.fromJson(Map<String, dynamic> json) =>
      _$_$_SkillFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String image;

  @override
  String toString() {
    return 'Skill(id: $id, name: $name, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Skill &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ id.hashCode ^ name.hashCode ^ image.hashCode;

  @override
  _$_Skill copyWith({
    Object id = freezed,
    Object name = freezed,
    Object image = freezed,
  }) {
    return _$_Skill(
      id: id == freezed ? this.id : id as String,
      name: name == freezed ? this.name : name as String,
      image: image == freezed ? this.image : image as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SkillToJson(this);
  }
}

abstract class _Skill implements Skill {
  factory _Skill({String id, String name, String image}) = _$_Skill;

  factory _Skill.fromJson(Map<String, dynamic> json) = _$_Skill.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get image;

  @override
  _Skill copyWith({String id, String name, String image});
}
