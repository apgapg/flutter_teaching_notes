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
    int updatedAt,
    int createdAt,
    @JsonKey(includeIfNull: false) String tagline,
    @JsonKey(includeIfNull: false, defaultValue: false) bool isVerified,
    List<String> bookmarks,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
