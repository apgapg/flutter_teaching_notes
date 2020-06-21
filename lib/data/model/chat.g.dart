// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Chat _$_$_ChatFromJson(Map json) {
  return $checkedNew(r'_$_Chat', json, () {
    final val = _$_Chat(
      id: $checkedConvert(json, 'id', (v) => v as String),
      message: $checkedConvert(json, 'message', (v) => v as String),
      senderId: $checkedConvert(json, 'senderId', (v) => v as String),
      receiverId: $checkedConvert(json, 'receiverId', (v) => v as String),
      time: $checkedConvert(json, 'time', (v) => v as int),
      read: $checkedConvert(json, 'read', (v) => v as bool) ?? false,
    );
    return val;
  });
}

Map<String, dynamic> _$_$_ChatToJson(_$_Chat instance) => <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'time': instance.time,
      'read': instance.read,
    };
