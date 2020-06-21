import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
abstract class Result<T> with _$Result<T> {
  const factory Result(T value) = Data<T>;

  const factory Result.loading() = Loading<T>;

  const factory Result.error([String message]) = ErrorDetails<T>;
}
