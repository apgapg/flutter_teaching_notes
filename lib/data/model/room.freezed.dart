// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package

part of 'room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) {
  return _Room.fromJson(json);
}

mixin _$Room {
  String get id;
  int get time;
  List<String> get users;

  Room copyWith({String id, int time, List<String> users});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_Room implements _Room {
  _$_Room({this.id, this.time, this.users});

  factory _$_Room.fromJson(Map<String, dynamic> json) =>
      _$_$_RoomFromJson(json);

  @override
  final String id;
  @override
  final int time;
  @override
  final List<String> users;

  @override
  String toString() {
    return 'Room(id: $id, time: $time, users: $users)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Room &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)) &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ id.hashCode ^ time.hashCode ^ users.hashCode;

  @override
  _$_Room copyWith({
    Object id = freezed,
    Object time = freezed,
    Object users = freezed,
  }) {
    return _$_Room(
      id: id == freezed ? this.id : id as String,
      time: time == freezed ? this.time : time as int,
      users: users == freezed ? this.users : users as List<String>,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RoomToJson(this);
  }
}

abstract class _Room implements Room {
  factory _Room({String id, int time, List<String> users}) = _$_Room;

  factory _Room.fromJson(Map<String, dynamic> json) = _$_Room.fromJson;

  @override
  String get id;
  @override
  int get time;
  @override
  List<String> get users;

  @override
  _Room copyWith({String id, int time, List<String> users});
}
