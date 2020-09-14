// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyUser _$_$_MyUserFromJson(Map<String, dynamic> json) {
  return _$_MyUser(
    id: json['id'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    avatar: json['avatar'] as String,
    provider: json['provider'] as String,
    updatedAt: json['updatedAt'] as int,
    createdAt: json['createdAt'] as int,
    tagline: json['tagline'] as String,
    isVerified: json['isVerified'] as bool ?? false,
    bookmarks: (json['bookmarks'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$_$_MyUserToJson(_$_MyUser instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  val['email'] = instance.email;
  writeNotNull('avatar', instance.avatar);
  val['provider'] = instance.provider;
  val['updatedAt'] = instance.updatedAt;
  val['createdAt'] = instance.createdAt;
  writeNotNull('tagline', instance.tagline);
  writeNotNull('isVerified', instance.isVerified);
  val['bookmarks'] = instance.bookmarks;
  return val;
}
