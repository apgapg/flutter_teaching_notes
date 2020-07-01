// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

class _$UserTearOff {
  const _$UserTearOff();

  _User call(
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
    return _User(
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
const $User = _$UserTearOff();

mixin _$User {
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
  $UserCopyWith<User> get copyWith;
}

abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
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

class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

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

abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
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

class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

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
    return _then(_User(
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
class _$_User implements _User {
  _$_User(
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
    return 'User(id: $id, name: $name, email: $email, avatar: $avatar, provider: $provider, updatedAt: $updatedAt, createdAt: $createdAt, tagline: $tagline, isVerified: $isVerified, bookmarks: $bookmarks)';
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
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

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
      int updatedAt,
      int createdAt,
      @JsonKey(includeIfNull: false) String tagline,
      @JsonKey(includeIfNull: false, defaultValue: false) bool isVerified,
      List<String> bookmarks}) = _$_User;

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
  _$UserCopyWith<_User> get copyWith;
}
