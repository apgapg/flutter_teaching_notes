import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'void_result.freezed.dart';

@freezed
abstract class VoidResult with _$VoidResult{
  const factory VoidResult.success() = Success;

  const factory VoidResult.error([String message]) = ErrorDetails;
}
