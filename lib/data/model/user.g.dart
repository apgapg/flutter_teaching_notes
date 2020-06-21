// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map json) {
  return $checkedNew(r'_$_User', json, () {
    final val = _$_User(
      id: $checkedConvert(json, 'id', (v) => v as String),
      name: $checkedConvert(json, 'name', (v) => v as String),
      email: $checkedConvert(json, 'email', (v) => v as String),
      avatar: $checkedConvert(json, 'avatar', (v) => v as String),
      provider: $checkedConvert(json, 'provider', (v) => v as String),
      tagline: $checkedConvert(json, 'tagline', (v) => v as String),
      educations: $checkedConvert(
          json,
          'educations',
          (v) => (v as List)
              ?.map((e) => e == null
                  ? null
                  : Education.fromJson((e as Map)?.map(
                      (k, e) => MapEntry(k as String, e),
                    )))
              ?.toList()),
      works: $checkedConvert(
          json,
          'works',
          (v) => (v as List)
              ?.map((e) => e == null
                  ? null
                  : Work.fromJson((e as Map)?.map(
                      (k, e) => MapEntry(k as String, e),
                    )))
              ?.toList()),
      startups: $checkedConvert(json, 'startups', (v) => v as List),
      skills: $checkedConvert(json, 'skills',
          (v) => (v as List)?.map((e) => e as String)?.toList()),
      isVerified:
          $checkedConvert(json, 'isVerified', (v) => v as bool) ?? false,
      showEmail: $checkedConvert(json, 'showEmail', (v) => v as bool) ?? false,
    );
    return val;
  });
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  val['email'] = instance.email;
  writeNotNull('avatar', instance.avatar);
  val['provider'] = instance.provider;
  writeNotNull('tagline', instance.tagline);
  writeNotNull(
      'educations', instance.educations?.map((e) => e?.toJson())?.toList());
  writeNotNull('works', instance.works?.map((e) => e?.toJson())?.toList());
  writeNotNull('startups', instance.startups);
  writeNotNull('skills', instance.skills);
  writeNotNull('isVerified', instance.isVerified);
  writeNotNull('showEmail', instance.showEmail);
  return val;
}

_$_Education _$_$_EducationFromJson(Map json) {
  return $checkedNew(r'_$_Education', json, () {
    final val = _$_Education(
      college: $checkedConvert(json, 'college', (v) => v as String),
      degree: $checkedConvert(json, 'degree', (v) => v as String),
      description: $checkedConvert(json, 'description', (v) => v as String),
      startYear: $checkedConvert(json, 'startYear', (v) => v as int),
      endYear: $checkedConvert(json, 'endYear', (v) => v as int),
    );
    return val;
  });
}

Map<String, dynamic> _$_$_EducationToJson(_$_Education instance) =>
    <String, dynamic>{
      'college': instance.college,
      'degree': instance.degree,
      'description': instance.description,
      'startYear': instance.startYear,
      'endYear': instance.endYear,
    };

_$_Work _$_$_WorkFromJson(Map json) {
  return $checkedNew(r'_$_Work', json, () {
    final val = _$_Work(
      company: $checkedConvert(json, 'company', (v) => v as String),
      role: $checkedConvert(json, 'role', (v) => v as String),
      description: $checkedConvert(json, 'description', (v) => v as String),
      startYear: $checkedConvert(json, 'startYear', (v) => v as int),
      endYear: $checkedConvert(json, 'endYear', (v) => v as int),
      currentlyWorkHere:
          $checkedConvert(json, 'currentlyWorkHere', (v) => v as bool) ?? false,
    );
    return val;
  });
}

Map<String, dynamic> _$_$_WorkToJson(_$_Work instance) => <String, dynamic>{
      'company': instance.company,
      'role': instance.role,
      'description': instance.description,
      'startYear': instance.startYear,
      'endYear': instance.endYear,
      'currentlyWorkHere': instance.currentlyWorkHere,
    };
