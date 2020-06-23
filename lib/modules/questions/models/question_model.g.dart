// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Question _$_$_QuestionFromJson(Map<String, dynamic> json) {
  return _$_Question(
    id: json['id'] as String,
    level: json['level'] as int ?? 0,
    title: json['title'] as String,
    description: json['description'] as String,
    subject: json['subject'] as String,
    topic: json['topic'] as String,
    images: (json['images'] as List)?.map((e) => e as String)?.toList(),
    solutions: (json['solutions'] as List)
        ?.map((e) =>
            e == null ? null : Solution.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    createdAt: json['createdAt'] as int ?? 0,
  );
}

Map<String, dynamic> _$_$_QuestionToJson(_$_Question instance) =>
    <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'title': instance.title,
      'description': instance.description,
      'subject': instance.subject,
      'topic': instance.topic,
      'images': instance.images,
      'solutions': instance.solutions,
      'createdAt': instance.createdAt,
    };

_$_Solution _$_$_SolutionFromJson(Map<String, dynamic> json) {
  return _$_Solution(
    id: json['id'] as int,
    images: (json['images'] as List)?.map((e) => e as String)?.toList(),
    video: json['video'] as String,
  );
}

Map<String, dynamic> _$_$_SolutionToJson(_$_Solution instance) =>
    <String, dynamic>{
      'id': instance.id,
      'images': instance.images,
      'video': instance.video,
    };
