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
      json['suffix'] as String);
}

Map<String, dynamic> _$CourseItemToJson(CourseItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'cover': instance.cover,
      'count': instance.count,
      'pdfLink': instance.pdfLink,
      'coursePreffix': instance.coursePreffix,
      'suffix': instance.suffix
    };
