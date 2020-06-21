// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$Result<T> {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(T value), {
    @required Result loading(),
    @required Result error(String message),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(T value), {
    Result loading(),
    Result error(String message),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(Data<T> value), {
    @required Result loading(Loading<T> value),
    @required Result error(ErrorDetails<T> value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(Data<T> value), {
    Result loading(Loading<T> value),
    Result error(ErrorDetails<T> value),
    @required Result orElse(),
  });
}

class _$Data<T> with DiagnosticableTreeMixin implements Data<T> {
  const _$Data(this.value) : assert(value != null);

  @override
  final T value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Result<$T>(value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Result<$T>'))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Data<T> &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;

  @override
  _$Data<T> copyWith({
    Object value = freezed,
  }) {
    assert(value != null);
    return _$Data<T>(
      value == freezed ? this.value : value as T,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(T value), {
    @required Result loading(),
    @required Result error(String message),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return $default(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(T value), {
    Result loading(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(Data<T> value), {
    @required Result loading(Loading<T> value),
    @required Result error(ErrorDetails<T> value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(Data<T> value), {
    Result loading(Loading<T> value),
    Result error(ErrorDetails<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class Data<T> implements Result<T> {
  const factory Data(T value) = _$Data<T>;

  T get value;

  Data<T> copyWith({T value});
}

class _$Loading<T> with DiagnosticableTreeMixin implements Loading<T> {
  const _$Loading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Result<$T>.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'Result<$T>.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(T value), {
    @required Result loading(),
    @required Result error(String message),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(T value), {
    Result loading(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(Data<T> value), {
    @required Result loading(Loading<T> value),
    @required Result error(ErrorDetails<T> value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(Data<T> value), {
    Result loading(Loading<T> value),
    Result error(ErrorDetails<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<T> implements Result<T> {
  const factory Loading() = _$Loading<T>;
}

class _$ErrorDetails<T>
    with DiagnosticableTreeMixin
    implements ErrorDetails<T> {
  const _$ErrorDetails([this.message]);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Result<$T>.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Result<$T>.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ErrorDetails<T> &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ message.hashCode;

  @override
  _$ErrorDetails<T> copyWith({
    Object message = freezed,
  }) {
    return _$ErrorDetails<T>(
      message == freezed ? this.message : message as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(T value), {
    @required Result loading(),
    @required Result error(String message),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return error(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(T value), {
    Result loading(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(Data<T> value), {
    @required Result loading(Loading<T> value),
    @required Result error(ErrorDetails<T> value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(Data<T> value), {
    Result loading(Loading<T> value),
    Result error(ErrorDetails<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorDetails<T> implements Result<T> {
  const factory ErrorDetails([String message]) = _$ErrorDetails<T>;

  String get message;

  ErrorDetails<T> copyWith({String message});
}
