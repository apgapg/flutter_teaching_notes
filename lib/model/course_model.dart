import 'package:json_annotation/json_annotation.dart';

part 'course_model.g.dart';
class CourseModel {
  List<CourseItem> list;

  CourseModel._internal(this.list);

  factory CourseModel.fromJson(dynamic json) {
    return CourseModel.fromMapList(list: json as List);
  }

  factory CourseModel.fromMapList({List<dynamic> list}) {
    final items = list.cast<Map<String, Object>>().map((Map<String, Object> item) {
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

  CourseItem(this.name, this.description, this.cover, this.count, this.pdfLink, this.coursePreffix, this.suffix);

  factory CourseItem.fromJson(Map<String, dynamic> json) => _$CourseItemFromJson(json);
}
