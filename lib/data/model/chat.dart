import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
abstract class Chat with _$Chat {
  factory Chat({
    String id,
    String message,
    String senderId,
    String receiverId,
    int time,
    @JsonKey(defaultValue: false) bool read,
  }) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}
