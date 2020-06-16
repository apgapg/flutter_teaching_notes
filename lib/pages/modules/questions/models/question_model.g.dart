// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return Question(
    json['id'] as String,
    json['level'] as int,
    json['title'] as String,
    json['description'] as String,
    json['subject'] as String,
    (json['images'] as List)?.map((e) => e as String)?.toList(),
    json['topic'] as String,
    (json['solutions'] as List)
        ?.map((e) =>
            e == null ? null : Solution.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'title': instance.title,
      'description': instance.description,
      'subject': instance.subject,
      'topic': instance.topic,
      'images': instance.images,
      'solutions': instance.solutions,
    };

Solution _$SolutionFromJson(Map<String, dynamic> json) {
  return Solution(
    json['id'] as int,
    (json['images'] as List)?.map((e) => e as String)?.toList(),
    json['video'] as String,
  );
}

Map<String, dynamic> _$SolutionToJson(Solution instance) => <String, dynamic>{
      'id': instance.id,
      'images': instance.images,
      'video': instance.video,
    };
