import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

import '../../data/entities/failures.dart';

abstract class CustomLogger {
  void logDetailed({
    required Level level,
    required String loggerName,
    required String message,
    Exception? exception,
    StackTrace? stackTrace,
  });

  void logFailure({
    required String loggerName,
    required Failure failure,
  });

  void logMessage({
    required String loggerName,
    required Level level,
    required String message,
  });
}

@LazySingleton(as: CustomLogger)
class LoggerImpl implements CustomLogger {
  @override
  void logDetailed({
    required Level level,
    required String loggerName,
    required String message,
    Exception? exception,
    StackTrace? stackTrace,
  }) {
    final logger = Logger(loggerName);
    logger.log(
      level,
      message,
      exception,
      stackTrace,
    );
  }

  @override
  void logMessage({
    required String loggerName,
    required Level level,
    required String message,
  }) {
    final logger = Logger(loggerName);

    logger.log(level, message);
  }

  @override
  void logFailure({
    required String loggerName,
    required Failure failure,
  }) {
    const level = Level.SEVERE;
    logDetailed(
      loggerName: loggerName,
      level: level,
      message: failure.forSystem,
      exception: failure.e,
    );
    if (failure.e is DioError) {
      final responseDetails = (failure.e as DioError).response.toString();
      logMessage(
        loggerName: loggerName,
        level: level,
        message: 'Dio Error details: $responseDetails',
      );
    }
  }
}
