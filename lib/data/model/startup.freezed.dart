// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package

part of 'startup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Startup _$StartupFromJson(Map<String, dynamic> json) {
  return _Startup.fromJson(json);
}

mixin _$Startup {
  String get id;
  String get name;
  String get tagline;
  String get description;
  String get avatar;
  @JsonKey(defaultValue: false)
  bool get isVerified;
  bool get isTrending;
  bool get isUpcoming;
  bool get isNew;
  List<dynamic> get founders;
  String get facebook;
  String get linkedIn;
  String get website;
  List<dynamic> get admins;

  Startup copyWith(
      {String id,
      String name,
      String tagline,
      String description,
      String avatar,
      @JsonKey(defaultValue: false) bool isVerified,
      bool isTrending,
      bool isUpcoming,
      bool isNew,
      List<dynamic> founders,
      String facebook,
      String linkedIn,
      String website,
      List<dynamic> admins});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_Startup implements _Startup {
  _$_Startup(
      {this.id,
      this.name,
      this.tagline,
      this.description,
      this.avatar,
      @JsonKey(defaultValue: false) this.isVerified,
      this.isTrending,
      this.isUpcoming,
      this.isNew,
      this.founders,
      this.facebook,
      this.linkedIn,
      this.website,
      this.admins});

  factory _$_Startup.fromJson(Map<String, dynamic> json) =>
      _$_$_StartupFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String tagline;
  @override
  final String description;
  @override
  final String avatar;
  @override
  @JsonKey(defaultValue: false)
  final bool isVerified;
  @override
  final bool isTrending;
  @override
  final bool isUpcoming;
  @override
  final bool isNew;
  @override
  final List<dynamic> founders;
  @override
  final String facebook;
  @override
  final String linkedIn;
  @override
  final String website;
  @override
  final List<dynamic> admins;

  @override
  String toString() {
    return 'Startup(id: $id, name: $name, tagline: $tagline, description: $description, avatar: $avatar, isVerified: $isVerified, isTrending: $isTrending, isUpcoming: $isUpcoming, isNew: $isNew, founders: $founders, facebook: $facebook, linkedIn: $linkedIn, website: $website, admins: $admins)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Startup &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.tagline, tagline) ||
                const DeepCollectionEquality()
                    .equals(other.tagline, tagline)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)) &&
            (identical(other.isVerified, isVerified) ||
                const DeepCollectionEquality()
                    .equals(other.isVerified, isVerified)) &&
            (identical(other.isTrending, isTrending) ||
                const DeepCollectionEquality()
                    .equals(other.isTrending, isTrending)) &&
            (identical(other.isUpcoming, isUpcoming) ||
                const DeepCollectionEquality()
                    .equals(other.isUpcoming, isUpcoming)) &&
            (identical(other.isNew, isNew) ||
                const DeepCollectionEquality().equals(other.isNew, isNew)) &&
            (identical(other.founders, founders) ||
                const DeepCollectionEquality()
                    .equals(other.founders, founders)) &&
            (identical(other.facebook, facebook) ||
                const DeepCollectionEquality()
                    .equals(other.facebook, facebook)) &&
            (identical(other.linkedIn, linkedIn) ||
                const DeepCollectionEquality()
                    .equals(other.linkedIn, linkedIn)) &&
            (identical(other.website, website) ||
                const DeepCollectionEquality()
                    .equals(other.website, website)) &&
            (identical(other.admins, admins) ||
                const DeepCollectionEquality().equals(other.admins, admins)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      id.hashCode ^
      name.hashCode ^
      tagline.hashCode ^
      description.hashCode ^
      avatar.hashCode ^
      isVerified.hashCode ^
      isTrending.hashCode ^
      isUpcoming.hashCode ^
      isNew.hashCode ^
      founders.hashCode ^
      facebook.hashCode ^
      linkedIn.hashCode ^
      website.hashCode ^
      admins.hashCode;

  @override
  _$_Startup copyWith({
    Object id = freezed,
    Object name = freezed,
    Object tagline = freezed,
    Object description = freezed,
    Object avatar = freezed,
    Object isVerified = freezed,
    Object isTrending = freezed,
    Object isUpcoming = freezed,
    Object isNew = freezed,
    Object founders = freezed,
    Object facebook = freezed,
    Object linkedIn = freezed,
    Object website = freezed,
    Object admins = freezed,
  }) {
    return _$_Startup(
      id: id == freezed ? this.id : id as String,
      name: name == freezed ? this.name : name as String,
      tagline: tagline == freezed ? this.tagline : tagline as String,
      description:
          description == freezed ? this.description : description as String,
      avatar: avatar == freezed ? this.avatar : avatar as String,
      isVerified: isVerified == freezed ? this.isVerified : isVerified as bool,
      isTrending: isTrending == freezed ? this.isTrending : isTrending as bool,
      isUpcoming: isUpcoming == freezed ? this.isUpcoming : isUpcoming as bool,
      isNew: isNew == freezed ? this.isNew : isNew as bool,
      founders: founders == freezed ? this.founders : founders as List<dynamic>,
      facebook: facebook == freezed ? this.facebook : facebook as String,
      linkedIn: linkedIn == freezed ? this.linkedIn : linkedIn as String,
      website: website == freezed ? this.website : website as String,
      admins: admins == freezed ? this.admins : admins as List<dynamic>,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StartupToJson(this);
  }
}

abstract class _Startup implements Startup {
  factory _Startup(
      {String id,
      String name,
      String tagline,
      String description,
      String avatar,
      @JsonKey(defaultValue: false) bool isVerified,
      bool isTrending,
      bool isUpcoming,
      bool isNew,
      List<dynamic> founders,
      String facebook,
      String linkedIn,
      String website,
      List<dynamic> admins}) = _$_Startup;

  factory _Startup.fromJson(Map<String, dynamic> json) = _$_Startup.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get tagline;
  @override
  String get description;
  @override
  String get avatar;
  @override
  @JsonKey(defaultValue: false)
  bool get isVerified;
  @override
  bool get isTrending;
  @override
  bool get isUpcoming;
  @override
  bool get isNew;
  @override
  List<dynamic> get founders;
  @override
  String get facebook;
  @override
  String get linkedIn;
  @override
  String get website;
  @override
  List<dynamic> get admins;

  @override
  _Startup copyWith(
      {String id,
      String name,
      String tagline,
      String description,
      String avatar,
      @JsonKey(defaultValue: false) bool isVerified,
      bool isTrending,
      bool isUpcoming,
      bool isNew,
      List<dynamic> founders,
      String facebook,
      String linkedIn,
      String website,
      List<dynamic> admins});
}
