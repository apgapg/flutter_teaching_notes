import 'package:json_annotation/json_annotation.dart';

part 'course_model.g.dart';

class CourseModel {
  List<CourseItem> list;

  CourseModel._internal(this.list);

  factory CourseModel.fromJson(dynamic json) {
    return CourseModel.fromMapList(list: json as List);
  }

  factory CourseModel.fromMapList({List<dynamic> list}) {
    final items =
        list.cast<Map<String, Object>>().map((Map<String, Object> item) {
      return CourseItem.fromJson(item);
    }).toList();

    return CourseModel._internal(items);
  }
}

@JsonSerializable()
class CourseItem {
  final String name;
  final String description;
  final String cover;
  final int count;
  final String pdfLink;
  final String coursePreffix;
  final String suffix;
  final String videoLink;
  final List<NotesItem> notes;
  final List<String> images;
  final List<Topic> topics;

  CourseItem(
    this.name,
    this.description,
    this.cover,
    this.count,
    this.pdfLink,
    this.coursePreffix,
    this.suffix,
    this.notes,
    this.videoLink,
    this.images,
    this.topics,
  );

  factory CourseItem.fromJson(Map<dynamic, dynamic> json) =>
      _$CourseItemFromJson(json);
}

@JsonSerializable()
class NotesItem {
  final String name;
  final String url;

  NotesItem(this.name, this.url);

  factory NotesItem.fromJson(Map<dynamic, dynamic> json) =>
      _$NotesItemFromJson(json);
}

@JsonSerializable()
class Topic {
  final String id;
  final String title;
  final String video;
  final List<String> images;

  Topic(
    this.id,
    this.title,
    this.images,
    this.video,
  );

  factory Topic.fromJson(Map<dynamic, dynamic> json) => _$TopicFromJson(json);
}
