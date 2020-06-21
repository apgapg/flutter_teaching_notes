// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Startup _$_$_StartupFromJson(Map json) {
  return $checkedNew(r'_$_Startup', json, () {
    final val = _$_Startup(
      id: $checkedConvert(json, 'id', (v) => v as String),
      name: $checkedConvert(json, 'name', (v) => v as String),
      tagline: $checkedConvert(json, 'tagline', (v) => v as String),
      description: $checkedConvert(json, 'description', (v) => v as String),
      avatar: $checkedConvert(json, 'avatar', (v) => v as String),
      isVerified:
          $checkedConvert(json, 'isVerified', (v) => v as bool) ?? false,
      isTrending: $checkedConvert(json, 'isTrending', (v) => v as bool),
      isUpcoming: $checkedConvert(json, 'isUpcoming', (v) => v as bool),
      isNew: $checkedConvert(json, 'isNew', (v) => v as bool),
      founders: $checkedConvert(json, 'founders', (v) => v as List),
      facebook: $checkedConvert(json, 'facebook', (v) => v as String),
      linkedIn: $checkedConvert(json, 'linkedIn', (v) => v as String),
      website: $checkedConvert(json, 'website', (v) => v as String),
      admins: $checkedConvert(json, 'admins', (v) => v as List),
    );
    return val;
  });
}

Map<String, dynamic> _$_$_StartupToJson(_$_Startup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tagline': instance.tagline,
      'description': instance.description,
      'avatar': instance.avatar,
      'isVerified': instance.isVerified,
      'isTrending': instance.isTrending,
      'isUpcoming': instance.isUpcoming,
      'isNew': instance.isNew,
      'founders': instance.founders,
      'facebook': instance.facebook,
      'linkedIn': instance.linkedIn,
      'website': instance.website,
      'admins': instance.admins,
    };
