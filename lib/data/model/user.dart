import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  factory User({
    String id,
    @JsonKey(includeIfNull: false) String name,
    String email,
    @JsonKey(includeIfNull: false) String avatar,
    String provider,
    @JsonKey(includeIfNull: false) String tagline,
    @JsonKey(includeIfNull: false) List<Education> educations,
    @JsonKey(includeIfNull: false) List<Work> works,
    @JsonKey(includeIfNull: false) List startups,
    @JsonKey(includeIfNull: false) List<String> skills,
    @JsonKey(includeIfNull: false, defaultValue: false) bool isVerified,
    @JsonKey(includeIfNull: false, defaultValue: false) bool showEmail,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
abstract class Education with _$Education {
  factory Education({
    String college,
    String degree,
    String description,
    int startYear,
    int endYear,
  }) = _Education;

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);
}

@freezed
abstract class Work with _$Work {
  factory Work({
    String company,
    String role,
    String description,
    int startYear,
    int endYear,
    @JsonKey(defaultValue: false) bool currentlyWorkHere,
  }) = _Work;

  factory Work.fromJson(Map<String, dynamic> json) => _$WorkFromJson(json);
}
