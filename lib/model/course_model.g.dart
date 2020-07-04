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
            e == null ? null : NotesItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['videoLink'] as String,
    (json['images'] as List)?.map((e) => e as String)?.toList(),
    (json['topics'] as List)
        ?.map(
            (e) => e == null ? null : Topic.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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
      'videoLink': instance.videoLink,
      'notes': instance.notes,
      'images': instance.images,
      'topics': instance.topics,
    };

NotesItem _$NotesItemFromJson(Map<String, dynamic> json) {
  return NotesItem(
    json['name'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$NotesItemToJson(NotesItem instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

Topic _$TopicFromJson(Map<String, dynamic> json) {
  return Topic(
    json['id'] as String,
    json['title'] as String,
    (json['images'] as List)?.map((e) => e as String)?.toList(),
    json['video'] as String,
  );
}

Map<String, dynamic> _$TopicToJson(Topic instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'video': instance.video,
      'images': instance.images,
    };
