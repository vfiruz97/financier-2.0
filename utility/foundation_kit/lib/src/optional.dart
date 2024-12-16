import 'dart:async';

import 'package:barrel_files_annotation/barrel_files_annotation.dart';

/// This class will be used by class users in their methods
@includeInBarrelFile
sealed class Optional<T> {
  const Optional._();

  B fold<B>(B Function(T t) ifPresent, B Function() ifAbsent);

  /// This function applies a transformation to the value of the Optional,
  /// and returns a new Optional that contains the transformed value. If the Optional
  /// is empty, the transformation is not applied and the empty Optional is returned.
  Optional<T2> map<T2>(T2 Function(T t) f) => fold((T t) => some(f(t)), none);

  /// Similar to map, but the transformation function returns an Optional
  /// rather than a raw value. This is useful when the transformation itself can result in an empty value.
  Optional<T2> flatMap<T2>(Optional<T2> Function(T t) f) => fold(f, none);

  /// An asynchronous version of flatMap.
  /// The transformation function is asynchronous (returns a Future<Optional>) and
  /// so is asyncFlatMap itself.
  Future<Optional<T2>> asyncFlatMap<T2>(
    Future<Optional<T2>> Function(T t) f,
  ) =>
      fold(f, () => Future.value(none()));

  /// Similar to map, but doesn't return a new Optional. Instead, it simply applies
  /// a function for its side effects and returns nothing. If the Optional is empty,
  /// the function is not applied.
  FutureOr<void> forEach(FutureOr<void> Function(T) f) => fold(f, () {});

  /// Returns the value if the Optional is present, and defaultValue's
  /// result if it is absent.
  T getOrElse(T Function() defaultValue) => fold((t) => t, defaultValue);

  /// Returns the value if the Optional is present, and null
  /// if it is absent.
  T? getOrNull() => fold((t) => t, () => null);

  /// Constructs an Optional from a Future. If the Future completes successfully,
  /// the Optional is present with the value of the Future. If the Future fails,
  /// the Optional is empty.
  static Future<Optional<T>> fromAsync<T>(
    Future<T> Function() func,
  ) async {
    try {
      final result = await func();
      return some(result);
    } catch (_) {
      return none();
    }
  }

  /// Constructs an Optional from a value that may be null. If the value is non-null,
  /// the Optional is present with that value. If the value is null, the Optional
  /// is empty.
  static Optional<T> fromNullable<T>(T? value) {
    if (value != null) {
      return some(value);
    } else {
      return none();
    }
  }
}

/// A container for absent values
@includeInBarrelFile
class None<T> extends Optional<T> {
  const None._() : super._();

  @override
  B fold<B>(B Function(T t) ifPresent, B Function() ifAbsent) => ifAbsent();

  @override
  bool operator ==(Object other) => other is None;

  @override
  int get hashCode => 0;
}

/// A container for present values
@includeInBarrelFile
class Some<T> extends Optional<T> {
  const Some._(this._t) : super._();

  final T _t;

  T get value => _t;

  @override
  B fold<B>(B Function(T t) ifPresent, B Function() ifAbsent) => ifPresent(_t);

  @override
  bool operator ==(Object other) => other is Some && other._t == _t;

  @override
  int get hashCode => _t.hashCode;
}

Optional<T> none<T>() => const None._(); // helper function
Optional<T> some<T>(T t) => Some._(t); // helper function
