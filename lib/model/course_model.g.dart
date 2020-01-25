// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseItem _$CourseItemFromJson(Map<String, dynamic> json) {
  return CourseItem(
    json['name'] as String,
    json['description'] as String,
    json['cover'] as String,
    json['count'] as int,
    json['pdfLink'] as String,
    json['coursePreffix'] as String,
    json['suffix'] as String,
    (json['notes'] as List)
        ?.map((e) =>
            e == null ? null : NotesItem.fromJson(e as Map<dynamic, dynamic>))
        ?.toList(),
    json['videoLink'] as String,
  );
}

Map<String, dynamic> _$CourseItemToJson(CourseItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'cover': instance.cover,
      'count': instance.count,
      'pdfLink': instance.pdfLink,
      'coursePreffix': instance.coursePreffix,
      'suffix': instance.suffix,
      'notes': instance.notes
    };

NotesItem _$NotesItemFromJson(Map<dynamic, dynamic> json) {
  return NotesItem(json['name'] as String, json['url'] as String);
}

Map<String, dynamic> _$NotesItemToJson(NotesItem instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};
