// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Room _$_$_RoomFromJson(Map json) {
  return $checkedNew(r'_$_Room', json, () {
    final val = _$_Room(
      id: $checkedConvert(json, 'id', (v) => v as String),
      time: $checkedConvert(json, 'time', (v) => v as int),
      users: $checkedConvert(
          json, 'users', (v) => (v as List)?.map((e) => e as String)?.toList()),
    );
    return val;
  });
}

Map<String, dynamic> _$_$_RoomToJson(_$_Room instance) => <String, dynamic>{
      'id': instance.id,
      'time': instance.time,
      'users': instance.users,
    };
