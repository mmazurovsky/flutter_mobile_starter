import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

abstract class Failure {
  FailureMessages get m;
  Exception? get e;

  String get forSystem;
  String get forUser;
}

@freezed
class RequestFailure with _$RequestFailure implements Failure {
  const RequestFailure._();

  factory RequestFailure.server({
    required FailureMessages m,
    Exception? e,
  }) = ServerFailure;

  factory RequestFailure.undefined({
    required FailureMessages m,
    Exception? e,
  }) = UndefinedFailure;

  factory RequestFailure.client({
    required FailureMessages m,
    Exception? e,
  }) = ClientFailure;

  factory RequestFailure.auth({
    required FailureMessages m,
    Exception? e,
  }) = AuthFailure;

  @override
  String get forUser => m._forUser;
  @override
  String get forSystem {
    return '${m._forSystem} / ${e.toString()}';
  }
}

@freezed
abstract class CacheFailure with _$CacheFailure implements Failure {
  const CacheFailure._();
  const factory CacheFailure({
    required FailureMessages m,
    Exception? e,
  }) = _CacheFailure;

  @override
  String get forUser => m._forUser;
  @override
  String get forSystem {
    return '${m._forSystem} / ${e.toString()}';
  }
}

@freezed
abstract class GenericFailure with _$GenericFailure implements Failure {
  const GenericFailure._();
  const factory GenericFailure({
    required FailureMessages m,
    Exception? e,
  }) = _GenericFailure;

  @override
  String get forUser => m._forUser;
  @override
  String get forSystem {
    return '${m._forSystem} / ${e.toString()}';
  }
}

class FailureMessages {
  final String _forSystem;
  final String _forUser;

  const FailureMessages({
    required String forSystem,
    required String forUser,
  })  : _forUser = forUser,
        _forSystem = forSystem;
}
