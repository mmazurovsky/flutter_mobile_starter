part of 'bag.dart';

class Strings {
  Strings._();
  late final general = _GeneralStrings();
  late final failure = _FailureStrings();
  late final ids = _IdStrings();
}

class _GeneralStrings {}

class _FailureStrings {
  final clientFailure = const FailureMessages(
    forSystem: 'Client failure',
    forUser: 'App error',
  );

  final serverFaliure = const FailureMessages(
    forSystem: 'Server failure',
    forUser: 'Server error, try later',
  );

  final undefinedFailure = const FailureMessages(
    forSystem: 'Undefined failure',
    forUser: 'Something went wrong',
  );

  final noInternetFailure = const FailureMessages(
    forSystem: 'No internet failure',
    forUser: 'No internet, try again',
  );

  final cacheFailure = const FailureMessages(
    forSystem: 'Cache failure',
    forUser: 'Something went wrong',
  );

  final authFaliure = const FailureMessages(
    forSystem: 'Auth failure',
    forUser: 'Authentication error occured',
  );

  final firebaseAuthFaliure = const FailureMessages(
    forSystem: 'Firebase Auth failure',
    forUser: 'Authentication error occured',
  );
}

class _IdStrings {
  final String appName = 'Flutter App';
}
