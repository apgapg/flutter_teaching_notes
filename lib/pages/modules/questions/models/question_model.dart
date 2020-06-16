import 'package:json_annotation/json_annotation.dart';

part 'question_model.g.dart';

@JsonSerializable()
class Question {
  final int level;
  final String title;
  final String description;
  final String subject;
  final String topic;
  final List<String> images;
  final List<Solution> solutions;

  Question(
    this.level,
    this.title,
    this.description,
    this.subject,
    this.images,
    this.topic,
    this.solutions,
  );

  factory Question.fromJson(Map<dynamic, dynamic> json) =>
      _$QuestionFromJson(json);
}

@JsonSerializable()
class Solution {
  final int id;
  final List<String> images;

  Solution(
    this.id,
    this.images,
  );

  factory Solution.fromJson(Map<dynamic, dynamic> json) =>
      _$SolutionFromJson(json);
}
