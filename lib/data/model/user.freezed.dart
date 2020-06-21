// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

mixin _$User {
  String get id;
  @JsonKey(includeIfNull: false)
  String get name;
  String get email;
  @JsonKey(includeIfNull: false)
  String get avatar;
  String get provider;
  @JsonKey(includeIfNull: false)
  String get tagline;
  @JsonKey(includeIfNull: false)
  List<Education> get educations;
  @JsonKey(includeIfNull: false)
  List<Work> get works;
  @JsonKey(includeIfNull: false)
  List<dynamic> get startups;
  @JsonKey(includeIfNull: false)
  List<String> get skills;
  @JsonKey(includeIfNull: false, defaultValue: false)
  bool get isVerified;
  @JsonKey(includeIfNull: false, defaultValue: false)
  bool get showEmail;

  User copyWith(
      {String id,
      @JsonKey(includeIfNull: false) String name,
      String email,
      @JsonKey(includeIfNull: false) String avatar,
      String provider,
      @JsonKey(includeIfNull: false) String tagline,
      @JsonKey(includeIfNull: false) List<Education> educations,
      @JsonKey(includeIfNull: false) List<Work> works,
      @JsonKey(includeIfNull: false) List<dynamic> startups,
      @JsonKey(includeIfNull: false) List<String> skills,
      @JsonKey(includeIfNull: false, defaultValue: false) bool isVerified,
      @JsonKey(includeIfNull: false, defaultValue: false) bool showEmail});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_User implements _User {
  _$_User(
      {this.id,
      @JsonKey(includeIfNull: false) this.name,
      this.email,
      @JsonKey(includeIfNull: false) this.avatar,
      this.provider,
      @JsonKey(includeIfNull: false) this.tagline,
      @JsonKey(includeIfNull: false) this.educations,
      @JsonKey(includeIfNull: false) this.works,
      @JsonKey(includeIfNull: false) this.startups,
      @JsonKey(includeIfNull: false) this.skills,
      @JsonKey(includeIfNull: false, defaultValue: false) this.isVerified,
      @JsonKey(includeIfNull: false, defaultValue: false) this.showEmail});

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(includeIfNull: false)
  final String name;
  @override
  final String email;
  @override
  @JsonKey(includeIfNull: false)
  final String avatar;
  @override
  final String provider;
  @override
  @JsonKey(includeIfNull: false)
  final String tagline;
  @override
  @JsonKey(includeIfNull: false)
  final List<Education> educations;
  @override
  @JsonKey(includeIfNull: false)
  final List<Work> works;
  @override
  @JsonKey(includeIfNull: false)
  final List<dynamic> startups;
  @override
  @JsonKey(includeIfNull: false)
  final List<String> skills;
  @override
  @JsonKey(includeIfNull: false, defaultValue: false)
  final bool isVerified;
  @override
  @JsonKey(includeIfNull: false, defaultValue: false)
  final bool showEmail;

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, avatar: $avatar, provider: $provider, tagline: $tagline, educations: $educations, works: $works, startups: $startups, skills: $skills, isVerified: $isVerified, showEmail: $showEmail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)) &&
            (identical(other.provider, provider) ||
                const DeepCollectionEquality()
                    .equals(other.provider, provider)) &&
            (identical(other.tagline, tagline) ||
                const DeepCollectionEquality()
                    .equals(other.tagline, tagline)) &&
            (identical(other.educations, educations) ||
                const DeepCollectionEquality()
                    .equals(other.educations, educations)) &&
            (identical(other.works, works) ||
                const DeepCollectionEquality().equals(other.works, works)) &&
            (identical(other.startups, startups) ||
                const DeepCollectionEquality()
                    .equals(other.startups, startups)) &&
            (identical(other.skills, skills) ||
                const DeepCollectionEquality().equals(other.skills, skills)) &&
            (identical(other.isVerified, isVerified) ||
                const DeepCollectionEquality()
                    .equals(other.isVerified, isVerified)) &&
            (identical(other.showEmail, showEmail) ||
                const DeepCollectionEquality()
                    .equals(other.showEmail, showEmail)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      avatar.hashCode ^
      provider.hashCode ^
      tagline.hashCode ^
      educations.hashCode ^
      works.hashCode ^
      startups.hashCode ^
      skills.hashCode ^
      isVerified.hashCode ^
      showEmail.hashCode;

  @override
  _$_User copyWith({
    Object id = freezed,
    Object name = freezed,
    Object email = freezed,
    Object avatar = freezed,
    Object provider = freezed,
    Object tagline = freezed,
    Object educations = freezed,
    Object works = freezed,
    Object startups = freezed,
    Object skills = freezed,
    Object isVerified = freezed,
    Object showEmail = freezed,
  }) {
    return _$_User(
      id: id == freezed ? this.id : id as String,
      name: name == freezed ? this.name : name as String,
      email: email == freezed ? this.email : email as String,
      avatar: avatar == freezed ? this.avatar : avatar as String,
      provider: provider == freezed ? this.provider : provider as String,
      tagline: tagline == freezed ? this.tagline : tagline as String,
      educations: educations == freezed
          ? this.educations
          : educations as List<Education>,
      works: works == freezed ? this.works : works as List<Work>,
      startups: startups == freezed ? this.startups : startups as List<dynamic>,
      skills: skills == freezed ? this.skills : skills as List<String>,
      isVerified: isVerified == freezed ? this.isVerified : isVerified as bool,
      showEmail: showEmail == freezed ? this.showEmail : showEmail as bool,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User implements User {
  factory _User(
          {String id,
          @JsonKey(includeIfNull: false) String name,
          String email,
          @JsonKey(includeIfNull: false) String avatar,
          String provider,
          @JsonKey(includeIfNull: false) String tagline,
          @JsonKey(includeIfNull: false) List<Education> educations,
          @JsonKey(includeIfNull: false) List<Work> works,
          @JsonKey(includeIfNull: false) List<dynamic> startups,
          @JsonKey(includeIfNull: false) List<String> skills,
          @JsonKey(includeIfNull: false, defaultValue: false) bool isVerified,
          @JsonKey(includeIfNull: false, defaultValue: false) bool showEmail}) =
      _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get id;
  @override
  @JsonKey(includeIfNull: false)
  String get name;
  @override
  String get email;
  @override
  @JsonKey(includeIfNull: false)
  String get avatar;
  @override
  String get provider;
  @override
  @JsonKey(includeIfNull: false)
  String get tagline;
  @override
  @JsonKey(includeIfNull: false)
  List<Education> get educations;
  @override
  @JsonKey(includeIfNull: false)
  List<Work> get works;
  @override
  @JsonKey(includeIfNull: false)
  List<dynamic> get startups;
  @override
  @JsonKey(includeIfNull: false)
  List<String> get skills;
  @override
  @JsonKey(includeIfNull: false, defaultValue: false)
  bool get isVerified;
  @override
  @JsonKey(includeIfNull: false, defaultValue: false)
  bool get showEmail;

  @override
  _User copyWith(
      {String id,
      @JsonKey(includeIfNull: false) String name,
      String email,
      @JsonKey(includeIfNull: false) String avatar,
      String provider,
      @JsonKey(includeIfNull: false) String tagline,
      @JsonKey(includeIfNull: false) List<Education> educations,
      @JsonKey(includeIfNull: false) List<Work> works,
      @JsonKey(includeIfNull: false) List<dynamic> startups,
      @JsonKey(includeIfNull: false) List<String> skills,
      @JsonKey(includeIfNull: false, defaultValue: false) bool isVerified,
      @JsonKey(includeIfNull: false, defaultValue: false) bool showEmail});
}

Education _$EducationFromJson(Map<String, dynamic> json) {
  return _Education.fromJson(json);
}

mixin _$Education {
  String get college;
  String get degree;
  String get description;
  int get startYear;
  int get endYear;

  Education copyWith(
      {String college,
      String degree,
      String description,
      int startYear,
      int endYear});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_Education implements _Education {
  _$_Education(
      {this.college,
      this.degree,
      this.description,
      this.startYear,
      this.endYear});

  factory _$_Education.fromJson(Map<String, dynamic> json) =>
      _$_$_EducationFromJson(json);

  @override
  final String college;
  @override
  final String degree;
  @override
  final String description;
  @override
  final int startYear;
  @override
  final int endYear;

  @override
  String toString() {
    return 'Education(college: $college, degree: $degree, description: $description, startYear: $startYear, endYear: $endYear)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Education &&
            (identical(other.college, college) ||
                const DeepCollectionEquality()
                    .equals(other.college, college)) &&
            (identical(other.degree, degree) ||
                const DeepCollectionEquality().equals(other.degree, degree)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.startYear, startYear) ||
                const DeepCollectionEquality()
                    .equals(other.startYear, startYear)) &&
            (identical(other.endYear, endYear) ||
                const DeepCollectionEquality().equals(other.endYear, endYear)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      college.hashCode ^
      degree.hashCode ^
      description.hashCode ^
      startYear.hashCode ^
      endYear.hashCode;

  @override
  _$_Education copyWith({
    Object college = freezed,
    Object degree = freezed,
    Object description = freezed,
    Object startYear = freezed,
    Object endYear = freezed,
  }) {
    return _$_Education(
      college: college == freezed ? this.college : college as String,
      degree: degree == freezed ? this.degree : degree as String,
      description:
          description == freezed ? this.description : description as String,
      startYear: startYear == freezed ? this.startYear : startYear as int,
      endYear: endYear == freezed ? this.endYear : endYear as int,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EducationToJson(this);
  }
}

abstract class _Education implements Education {
  factory _Education(
      {String college,
      String degree,
      String description,
      int startYear,
      int endYear}) = _$_Education;

  factory _Education.fromJson(Map<String, dynamic> json) =
      _$_Education.fromJson;

  @override
  String get college;
  @override
  String get degree;
  @override
  String get description;
  @override
  int get startYear;
  @override
  int get endYear;

  @override
  _Education copyWith(
      {String college,
      String degree,
      String description,
      int startYear,
      int endYear});
}

Work _$WorkFromJson(Map<String, dynamic> json) {
  return _Work.fromJson(json);
}

mixin _$Work {
  String get company;
  String get role;
  String get description;
  int get startYear;
  int get endYear;
  @JsonKey(defaultValue: false)
  bool get currentlyWorkHere;

  Work copyWith(
      {String company,
      String role,
      String description,
      int startYear,
      int endYear,
      @JsonKey(defaultValue: false) bool currentlyWorkHere});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_Work implements _Work {
  _$_Work(
      {this.company,
      this.role,
      this.description,
      this.startYear,
      this.endYear,
      @JsonKey(defaultValue: false) this.currentlyWorkHere});

  factory _$_Work.fromJson(Map<String, dynamic> json) =>
      _$_$_WorkFromJson(json);

  @override
  final String company;
  @override
  final String role;
  @override
  final String description;
  @override
  final int startYear;
  @override
  final int endYear;
  @override
  @JsonKey(defaultValue: false)
  final bool currentlyWorkHere;

  @override
  String toString() {
    return 'Work(company: $company, role: $role, description: $description, startYear: $startYear, endYear: $endYear, currentlyWorkHere: $currentlyWorkHere)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Work &&
            (identical(other.company, company) ||
                const DeepCollectionEquality()
                    .equals(other.company, company)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.startYear, startYear) ||
                const DeepCollectionEquality()
                    .equals(other.startYear, startYear)) &&
            (identical(other.endYear, endYear) ||
                const DeepCollectionEquality()
                    .equals(other.endYear, endYear)) &&
            (identical(other.currentlyWorkHere, currentlyWorkHere) ||
                const DeepCollectionEquality()
                    .equals(other.currentlyWorkHere, currentlyWorkHere)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      company.hashCode ^
      role.hashCode ^
      description.hashCode ^
      startYear.hashCode ^
      endYear.hashCode ^
      currentlyWorkHere.hashCode;

  @override
  _$_Work copyWith({
    Object company = freezed,
    Object role = freezed,
    Object description = freezed,
    Object startYear = freezed,
    Object endYear = freezed,
    Object currentlyWorkHere = freezed,
  }) {
    return _$_Work(
      company: company == freezed ? this.company : company as String,
      role: role == freezed ? this.role : role as String,
      description:
          description == freezed ? this.description : description as String,
      startYear: startYear == freezed ? this.startYear : startYear as int,
      endYear: endYear == freezed ? this.endYear : endYear as int,
      currentlyWorkHere: currentlyWorkHere == freezed
          ? this.currentlyWorkHere
          : currentlyWorkHere as bool,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_WorkToJson(this);
  }
}

abstract class _Work implements Work {
  factory _Work(
      {String company,
      String role,
      String description,
      int startYear,
      int endYear,
      @JsonKey(defaultValue: false) bool currentlyWorkHere}) = _$_Work;

  factory _Work.fromJson(Map<String, dynamic> json) = _$_Work.fromJson;

  @override
  String get company;
  @override
  String get role;
  @override
  String get description;
  @override
  int get startYear;
  @override
  int get endYear;
  @override
  @JsonKey(defaultValue: false)
  bool get currentlyWorkHere;

  @override
  _Work copyWith(
      {String company,
      String role,
      String description,
      int startYear,
      int endYear,
      @JsonKey(defaultValue: false) bool currentlyWorkHere});
}
