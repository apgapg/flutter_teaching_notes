// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Skill _$_$_SkillFromJson(Map json) {
  return $checkedNew(r'_$_Skill', json, () {
    final val = _$_Skill(
      id: $checkedConvert(json, 'id', (v) => v as String),
      name: $checkedConvert(json, 'name', (v) => v as String),
      image: $checkedConvert(json, 'image', (v) => v as String),
    );
    return val;
  });
}

Map<String, dynamic> _$_$_SkillToJson(_$_Skill instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
