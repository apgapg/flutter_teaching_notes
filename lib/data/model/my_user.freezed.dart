// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'my_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
MyUser _$MyUserFromJson(Map<String, dynamic> json) {
  return _MyUser.fromJson(json);
}

class _$MyUserTearOff {
  const _$MyUserTearOff();

// ignore: unused_element
  _MyUser call(
      {String id,
      @JsonKey(includeIfNull: false) String name,
      String email,
      @JsonKey(includeIfNull: false) String avatar,
      String provider,
      int updatedAt,
      int createdAt,
      @JsonKey(includeIfNull: false) String tagline,
      @JsonKey(includeIfNull: false, defaultValue: false) bool isVerified,
      List<String> bookmarks}) {
    return _MyUser(
      id: id,
      name: name,
      email: email,
      avatar: avatar,
      provider: provider,
      updatedAt: updatedAt,
      createdAt: createdAt,
      tagline: tagline,
      isVerified: isVerified,
      bookmarks: bookmarks,
    );
  }
}

// ignore: unused_element
const $MyUser = _$MyUserTearOff();

mixin _$MyUser {
  String get id;
  @JsonKey(includeIfNull: false)
  String get name;
  String get email;
  @JsonKey(includeIfNull: false)
  String get avatar;
  String get provider;
  int get updatedAt;
  int get createdAt;
  @JsonKey(includeIfNull: false)
  String get tagline;
  @JsonKey(includeIfNull: false, defaultValue: false)
  bool get isVerified;
  List<String> get bookmarks;

  Map<String, dynamic> toJson();
  $MyUserCopyWith<MyUser> get copyWith;
}

abstract class $MyUserCopyWith<$Res> {
  factory $MyUserCopyWith(MyUser value, $Res Function(MyUser) then) =
      _$MyUserCopyWithImpl<$Res>;
  $Res call(
      {String id,
      @JsonKey(includeIfNull: false) String name,
      String email,
      @JsonKey(includeIfNull: false) String avatar,
      String provider,
      int updatedAt,
      int createdAt,
      @JsonKey(includeIfNull: false) String tagline,
      @JsonKey(includeIfNull: false, defaultValue: false) bool isVerified,
      List<String> bookmarks});
}

class _$MyUserCopyWithImpl<$Res> implements $MyUserCopyWith<$Res> {
  _$MyUserCopyWithImpl(this._value, this._then);

  final MyUser _value;
  // ignore: unused_field
  final $Res Function(MyUser) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object email = freezed,
    Object avatar = freezed,
    Object provider = freezed,
    Object updatedAt = freezed,
    Object createdAt = freezed,
    Object tagline = freezed,
    Object isVerified = freezed,
    Object bookmarks = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      email: email == freezed ? _value.email : email as String,
      avatar: avatar == freezed ? _value.avatar : avatar as String,
      provider: provider == freezed ? _value.provider : provider as String,
      updatedAt: updatedAt == freezed ? _value.updatedAt : updatedAt as int,
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as int,
      tagline: tagline == freezed ? _value.tagline : tagline as String,
      isVerified:
          isVerified == freezed ? _value.isVerified : isVerified as bool,
      bookmarks:
          bookmarks == freezed ? _value.bookmarks : bookmarks as List<String>,
    ));
  }
}

abstract class _$MyUserCopyWith<$Res> implements $MyUserCopyWith<$Res> {
  factory _$MyUserCopyWith(_MyUser value, $Res Function(_MyUser) then) =
      __$MyUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      @JsonKey(includeIfNull: false) String name,
      String email,
      @JsonKey(includeIfNull: false) String avatar,
      String provider,
      int updatedAt,
      int createdAt,
      @JsonKey(includeIfNull: false) String tagline,
      @JsonKey(includeIfNull: false, defaultValue: false) bool isVerified,
      List<String> bookmarks});
}

class __$MyUserCopyWithImpl<$Res> extends _$MyUserCopyWithImpl<$Res>
    implements _$MyUserCopyWith<$Res> {
  __$MyUserCopyWithImpl(_MyUser _value, $Res Function(_MyUser) _then)
      : super(_value, (v) => _then(v as _MyUser));

  @override
  _MyUser get _value => super._value as _MyUser;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object email = freezed,
    Object avatar = freezed,
    Object provider = freezed,
    Object updatedAt = freezed,
    Object createdAt = freezed,
    Object tagline = freezed,
    Object isVerified = freezed,
    Object bookmarks = freezed,
  }) {
    return _then(_MyUser(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      email: email == freezed ? _value.email : email as String,
      avatar: avatar == freezed ? _value.avatar : avatar as String,
      provider: provider == freezed ? _value.provider : provider as String,
      updatedAt: updatedAt == freezed ? _value.updatedAt : updatedAt as int,
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as int,
      tagline: tagline == freezed ? _value.tagline : tagline as String,
      isVerified:
          isVerified == freezed ? _value.isVerified : isVerified as bool,
      bookmarks:
          bookmarks == freezed ? _value.bookmarks : bookmarks as List<String>,
    ));
  }
}

@JsonSerializable()
class _$_MyUser implements _MyUser {
  _$_MyUser(
      {this.id,
      @JsonKey(includeIfNull: false) this.name,
      this.email,
      @JsonKey(includeIfNull: false) this.avatar,
      this.provider,
      this.updatedAt,
      this.createdAt,
      @JsonKey(includeIfNull: false) this.tagline,
      @JsonKey(includeIfNull: false, defaultValue: false) this.isVerified,
      this.bookmarks});

  factory _$_MyUser.fromJson(Map<String, dynamic> json) =>
      _$_$_MyUserFromJson(json);

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
  final int updatedAt;
  @override
  final int createdAt;
  @override
  @JsonKey(includeIfNull: false)
  final String tagline;
  @override
  @JsonKey(includeIfNull: false, defaultValue: false)
  final bool isVerified;
  @override
  final List<String> bookmarks;

  @override
  String toString() {
    return 'MyUser(id: $id, name: $name, email: $email, avatar: $avatar, provider: $provider, updatedAt: $updatedAt, createdAt: $createdAt, tagline: $tagline, isVerified: $isVerified, bookmarks: $bookmarks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MyUser &&
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
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.tagline, tagline) ||
                const DeepCollectionEquality()
                    .equals(other.tagline, tagline)) &&
            (identical(other.isVerified, isVerified) ||
                const DeepCollectionEquality()
                    .equals(other.isVerified, isVerified)) &&
            (identical(other.bookmarks, bookmarks) ||
                const DeepCollectionEquality()
                    .equals(other.bookmarks, bookmarks)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(avatar) ^
      const DeepCollectionEquality().hash(provider) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(tagline) ^
      const DeepCollectionEquality().hash(isVerified) ^
      const DeepCollectionEquality().hash(bookmarks);

  @override
  _$MyUserCopyWith<_MyUser> get copyWith =>
      __$MyUserCopyWithImpl<_MyUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MyUserToJson(this);
  }
}

abstract class _MyUser implements MyUser {
  factory _MyUser(
      {String id,
      @JsonKey(includeIfNull: false) String name,
      String email,
      @JsonKey(includeIfNull: false) String avatar,
      String provider,
      int updatedAt,
      int createdAt,
      @JsonKey(includeIfNull: false) String tagline,
      @JsonKey(includeIfNull: false, defaultValue: false) bool isVerified,
      List<String> bookmarks}) = _$_MyUser;

  factory _MyUser.fromJson(Map<String, dynamic> json) = _$_MyUser.fromJson;

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
  int get updatedAt;
  @override
  int get createdAt;
  @override
  @JsonKey(includeIfNull: false)
  String get tagline;
  @override
  @JsonKey(includeIfNull: false, defaultValue: false)
  bool get isVerified;
  @override
  List<String> get bookmarks;
  @override
  _$MyUserCopyWith<_MyUser> get copyWith;
}
