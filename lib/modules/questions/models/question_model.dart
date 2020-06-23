import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
abstract class Question with _$Question {
  factory Question({
    String id,
    @JsonKey(defaultValue: 0) int level,
    String title,
    String description,
    String subject,
    String topic,
    List<String> images,
    List<Solution> solutions,
    @JsonKey(defaultValue: 0) int createdAt,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}

@freezed
abstract class Solution with _$Solution {
  factory Solution({
    int id,
    List<String> images,
    String video,
  }) = _Solution;

  factory Solution.fromJson(Map<String, dynamic> json) =>
      _$SolutionFromJson(json);
}
