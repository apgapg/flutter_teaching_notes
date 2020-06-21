// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) {
  return _Chat.fromJson(json);
}

mixin _$Chat {
  String get id;
  String get message;
  String get senderId;
  String get receiverId;
  int get time;
  @JsonKey(defaultValue: false)
  bool get read;

  Chat copyWith(
      {String id,
      String message,
      String senderId,
      String receiverId,
      int time,
      @JsonKey(defaultValue: false) bool read});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_Chat implements _Chat {
  _$_Chat(
      {this.id,
      this.message,
      this.senderId,
      this.receiverId,
      this.time,
      @JsonKey(defaultValue: false) this.read});

  factory _$_Chat.fromJson(Map<String, dynamic> json) =>
      _$_$_ChatFromJson(json);

  @override
  final String id;
  @override
  final String message;
  @override
  final String senderId;
  @override
  final String receiverId;
  @override
  final int time;
  @override
  @JsonKey(defaultValue: false)
  final bool read;

  @override
  String toString() {
    return 'Chat(id: $id, message: $message, senderId: $senderId, receiverId: $receiverId, time: $time, read: $read)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Chat &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.senderId, senderId) ||
                const DeepCollectionEquality()
                    .equals(other.senderId, senderId)) &&
            (identical(other.receiverId, receiverId) ||
                const DeepCollectionEquality()
                    .equals(other.receiverId, receiverId)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)) &&
            (identical(other.read, read) ||
                const DeepCollectionEquality().equals(other.read, read)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      id.hashCode ^
      message.hashCode ^
      senderId.hashCode ^
      receiverId.hashCode ^
      time.hashCode ^
      read.hashCode;

  @override
  _$_Chat copyWith({
    Object id = freezed,
    Object message = freezed,
    Object senderId = freezed,
    Object receiverId = freezed,
    Object time = freezed,
    Object read = freezed,
  }) {
    return _$_Chat(
      id: id == freezed ? this.id : id as String,
      message: message == freezed ? this.message : message as String,
      senderId: senderId == freezed ? this.senderId : senderId as String,
      receiverId:
          receiverId == freezed ? this.receiverId : receiverId as String,
      time: time == freezed ? this.time : time as int,
      read: read == freezed ? this.read : read as bool,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ChatToJson(this);
  }
}

abstract class _Chat implements Chat {
  factory _Chat(
      {String id,
      String message,
      String senderId,
      String receiverId,
      int time,
      @JsonKey(defaultValue: false) bool read}) = _$_Chat;

  factory _Chat.fromJson(Map<String, dynamic> json) = _$_Chat.fromJson;

  @override
  String get id;
  @override
  String get message;
  @override
  String get senderId;
  @override
  String get receiverId;
  @override
  int get time;
  @override
  @JsonKey(defaultValue: false)
  bool get read;

  @override
  _Chat copyWith(
      {String id,
      String message,
      String senderId,
      String receiverId,
      int time,
      @JsonKey(defaultValue: false) bool read});
}
