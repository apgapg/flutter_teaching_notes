// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

class _$QuestionTearOff {
  const _$QuestionTearOff();

// ignore: unused_element
  _Question call(
      {String id,
      @JsonKey(defaultValue: 0) int level,
      String title,
      String description,
      String subject,
      String topic,
      List<String> images,
      List<Solution> solutions,
      @JsonKey(defaultValue: 0) int createdAt}) {
    return _Question(
      id: id,
      level: level,
      title: title,
      description: description,
      subject: subject,
      topic: topic,
      images: images,
      solutions: solutions,
      createdAt: createdAt,
    );
  }
}

// ignore: unused_element
const $Question = _$QuestionTearOff();

mixin _$Question {
  String get id;
  @JsonKey(defaultValue: 0)
  int get level;
  String get title;
  String get description;
  String get subject;
  String get topic;
  List<String> get images;
  List<Solution> get solutions;
  @JsonKey(defaultValue: 0)
  int get createdAt;

  Map<String, dynamic> toJson();
  $QuestionCopyWith<Question> get copyWith;
}

abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res>;
  $Res call(
      {String id,
      @JsonKey(defaultValue: 0) int level,
      String title,
      String description,
      String subject,
      String topic,
      List<String> images,
      List<Solution> solutions,
      @JsonKey(defaultValue: 0) int createdAt});
}

class _$QuestionCopyWithImpl<$Res> implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  final Question _value;
  // ignore: unused_field
  final $Res Function(Question) _then;

  @override
  $Res call({
    Object id = freezed,
    Object level = freezed,
    Object title = freezed,
    Object description = freezed,
    Object subject = freezed,
    Object topic = freezed,
    Object images = freezed,
    Object solutions = freezed,
    Object createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      level: level == freezed ? _value.level : level as int,
      title: title == freezed ? _value.title : title as String,
      description:
          description == freezed ? _value.description : description as String,
      subject: subject == freezed ? _value.subject : subject as String,
      topic: topic == freezed ? _value.topic : topic as String,
      images: images == freezed ? _value.images : images as List<String>,
      solutions:
          solutions == freezed ? _value.solutions : solutions as List<Solution>,
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as int,
    ));
  }
}

abstract class _$QuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$QuestionCopyWith(_Question value, $Res Function(_Question) then) =
      __$QuestionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      @JsonKey(defaultValue: 0) int level,
      String title,
      String description,
      String subject,
      String topic,
      List<String> images,
      List<Solution> solutions,
      @JsonKey(defaultValue: 0) int createdAt});
}

class __$QuestionCopyWithImpl<$Res> extends _$QuestionCopyWithImpl<$Res>
    implements _$QuestionCopyWith<$Res> {
  __$QuestionCopyWithImpl(_Question _value, $Res Function(_Question) _then)
      : super(_value, (v) => _then(v as _Question));

  @override
  _Question get _value => super._value as _Question;

  @override
  $Res call({
    Object id = freezed,
    Object level = freezed,
    Object title = freezed,
    Object description = freezed,
    Object subject = freezed,
    Object topic = freezed,
    Object images = freezed,
    Object solutions = freezed,
    Object createdAt = freezed,
  }) {
    return _then(_Question(
      id: id == freezed ? _value.id : id as String,
      level: level == freezed ? _value.level : level as int,
      title: title == freezed ? _value.title : title as String,
      description:
          description == freezed ? _value.description : description as String,
      subject: subject == freezed ? _value.subject : subject as String,
      topic: topic == freezed ? _value.topic : topic as String,
      images: images == freezed ? _value.images : images as List<String>,
      solutions:
          solutions == freezed ? _value.solutions : solutions as List<Solution>,
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as int,
    ));
  }
}

@JsonSerializable()
class _$_Question implements _Question {
  _$_Question(
      {this.id,
      @JsonKey(defaultValue: 0) this.level,
      this.title,
      this.description,
      this.subject,
      this.topic,
      this.images,
      this.solutions,
      @JsonKey(defaultValue: 0) this.createdAt});

  factory _$_Question.fromJson(Map<String, dynamic> json) =>
      _$_$_QuestionFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(defaultValue: 0)
  final int level;
  @override
  final String title;
  @override
  final String description;
  @override
  final String subject;
  @override
  final String topic;
  @override
  final List<String> images;
  @override
  final List<Solution> solutions;
  @override
  @JsonKey(defaultValue: 0)
  final int createdAt;

  @override
  String toString() {
    return 'Question(id: $id, level: $level, title: $title, description: $description, subject: $subject, topic: $topic, images: $images, solutions: $solutions, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Question &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.level, level) ||
                const DeepCollectionEquality().equals(other.level, level)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.subject, subject) ||
                const DeepCollectionEquality()
                    .equals(other.subject, subject)) &&
            (identical(other.topic, topic) ||
                const DeepCollectionEquality().equals(other.topic, topic)) &&
            (identical(other.images, images) ||
                const DeepCollectionEquality().equals(other.images, images)) &&
            (identical(other.solutions, solutions) ||
                const DeepCollectionEquality()
                    .equals(other.solutions, solutions)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(level) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(subject) ^
      const DeepCollectionEquality().hash(topic) ^
      const DeepCollectionEquality().hash(images) ^
      const DeepCollectionEquality().hash(solutions) ^
      const DeepCollectionEquality().hash(createdAt);

  @override
  _$QuestionCopyWith<_Question> get copyWith =>
      __$QuestionCopyWithImpl<_Question>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_QuestionToJson(this);
  }
}

abstract class _Question implements Question {
  factory _Question(
      {String id,
      @JsonKey(defaultValue: 0) int level,
      String title,
      String description,
      String subject,
      String topic,
      List<String> images,
      List<Solution> solutions,
      @JsonKey(defaultValue: 0) int createdAt}) = _$_Question;

  factory _Question.fromJson(Map<String, dynamic> json) = _$_Question.fromJson;

  @override
  String get id;
  @override
  @JsonKey(defaultValue: 0)
  int get level;
  @override
  String get title;
  @override
  String get description;
  @override
  String get subject;
  @override
  String get topic;
  @override
  List<String> get images;
  @override
  List<Solution> get solutions;
  @override
  @JsonKey(defaultValue: 0)
  int get createdAt;
  @override
  _$QuestionCopyWith<_Question> get copyWith;
}

Solution _$SolutionFromJson(Map<String, dynamic> json) {
  return _Solution.fromJson(json);
}

class _$SolutionTearOff {
  const _$SolutionTearOff();

// ignore: unused_element
  _Solution call({int id, List<String> images, String video}) {
    return _Solution(
      id: id,
      images: images,
      video: video,
    );
  }
}

// ignore: unused_element
const $Solution = _$SolutionTearOff();

mixin _$Solution {
  int get id;
  List<String> get images;
  String get video;

  Map<String, dynamic> toJson();
  $SolutionCopyWith<Solution> get copyWith;
}

abstract class $SolutionCopyWith<$Res> {
  factory $SolutionCopyWith(Solution value, $Res Function(Solution) then) =
      _$SolutionCopyWithImpl<$Res>;
  $Res call({int id, List<String> images, String video});
}

class _$SolutionCopyWithImpl<$Res> implements $SolutionCopyWith<$Res> {
  _$SolutionCopyWithImpl(this._value, this._then);

  final Solution _value;
  // ignore: unused_field
  final $Res Function(Solution) _then;

  @override
  $Res call({
    Object id = freezed,
    Object images = freezed,
    Object video = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      images: images == freezed ? _value.images : images as List<String>,
      video: video == freezed ? _value.video : video as String,
    ));
  }
}

abstract class _$SolutionCopyWith<$Res> implements $SolutionCopyWith<$Res> {
  factory _$SolutionCopyWith(_Solution value, $Res Function(_Solution) then) =
      __$SolutionCopyWithImpl<$Res>;
  @override
  $Res call({int id, List<String> images, String video});
}

class __$SolutionCopyWithImpl<$Res> extends _$SolutionCopyWithImpl<$Res>
    implements _$SolutionCopyWith<$Res> {
  __$SolutionCopyWithImpl(_Solution _value, $Res Function(_Solution) _then)
      : super(_value, (v) => _then(v as _Solution));

  @override
  _Solution get _value => super._value as _Solution;

  @override
  $Res call({
    Object id = freezed,
    Object images = freezed,
    Object video = freezed,
  }) {
    return _then(_Solution(
      id: id == freezed ? _value.id : id as int,
      images: images == freezed ? _value.images : images as List<String>,
      video: video == freezed ? _value.video : video as String,
    ));
  }
}

@JsonSerializable()
class _$_Solution implements _Solution {
  _$_Solution({this.id, this.images, this.video});

  factory _$_Solution.fromJson(Map<String, dynamic> json) =>
      _$_$_SolutionFromJson(json);

  @override
  final int id;
  @override
  final List<String> images;
  @override
  final String video;

  @override
  String toString() {
    return 'Solution(id: $id, images: $images, video: $video)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Solution &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.images, images) ||
                const DeepCollectionEquality().equals(other.images, images)) &&
            (identical(other.video, video) ||
                const DeepCollectionEquality().equals(other.video, video)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(images) ^
      const DeepCollectionEquality().hash(video);

  @override
  _$SolutionCopyWith<_Solution> get copyWith =>
      __$SolutionCopyWithImpl<_Solution>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SolutionToJson(this);
  }
}

abstract class _Solution implements Solution {
  factory _Solution({int id, List<String> images, String video}) = _$_Solution;

  factory _Solution.fromJson(Map<String, dynamic> json) = _$_Solution.fromJson;

  @override
  int get id;
  @override
  List<String> get images;
  @override
  String get video;
  @override
  _$SolutionCopyWith<_Solution> get copyWith;
}
