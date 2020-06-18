// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chapter _$ChapterFromJson(Map<String, dynamic> json) {
  return Chapter(
    json['id'] as String,
    json['title'] as String,
    json['description'] as String,
    json['subject'] as String,
    json['image'] as String,
    json['topic'] as String,
    json['createdAt'] as int,
    json['video'] as String,
  );
}

Map<String, dynamic> _$ChapterToJson(Chapter instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'subject': instance.subject,
      'image': instance.image,
      'topic': instance.topic,
      'createdAt': instance.createdAt,
      'video': instance.video,
    };
