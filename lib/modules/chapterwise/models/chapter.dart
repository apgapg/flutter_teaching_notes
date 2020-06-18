import 'package:json_annotation/json_annotation.dart';

part 'chapter.g.dart';

@JsonSerializable()
class Chapter {
  final String id;
  final String title;
  final String description;
  final String subject;
  final String image;
  final String topic;
  final int createdAt;
  final String video;

  Chapter(
    this.id,
    this.title,
    this.description,
    this.subject,
    this.image,
    this.topic,
    this.createdAt,
    this.video,
  );

  factory Chapter.fromJson(Map<dynamic, dynamic> json) =>
      _$ChapterFromJson(json);
}
