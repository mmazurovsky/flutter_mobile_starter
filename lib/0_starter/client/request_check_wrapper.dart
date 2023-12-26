import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../bag/bag.dart';
import '../data/entities/failures.dart';
import '../utils/logger/custom_logger.dart';
import '../utils/logger/logger_name_provider.dart';

abstract class RequestCheckWrapper {
  Future<Either<RequestFailure, RESPONSE>> requestToRemoteServer<RESPONSE>(
    Future<RESPONSE> requestFuture,
  );
}

@LazySingleton(as: RequestCheckWrapper)
class RequestCheckWrapperImpl
    with LoggerNameProvider
    implements RequestCheckWrapper {
  final CustomLogger _customLogger;

  RequestCheckWrapperImpl(
    this._customLogger,
  );

  FailureMessages get _authFailureMessages => Bag.strings.failure.authFaliure;
  FailureMessages get _serverFailureMessages =>
      Bag.strings.failure.serverFaliure;
  FailureMessages get _clientFailureMessages =>
      Bag.strings.failure.clientFailure;
  FailureMessages get _undefinedFailureMessages =>
      Bag.strings.failure.undefinedFailure;

  @override
  Future<Either<RequestFailure, RESPONSE>> requestToRemoteServer<RESPONSE>(
    Future<RESPONSE> requestFuture,
  ) async {
    late final RESPONSE response;
    RequestFailure? failure;

    try {
      response = await requestFuture;
    } on FirebaseException catch (e) {
      failure = RequestFailure.server(
        m: _serverFailureMessages,
        e: e,
      );
    } on DioError catch (e) {
      final statusCode = e.response?.statusCode;
      if (statusCode != null) {
        if (statusCode >= 400 && statusCode <= 499) {
          if (statusCode == 401 || statusCode == 403) {
            failure = RequestFailure.auth(
              m: _authFailureMessages,
              e: e,
            );
          } else {
            failure = RequestFailure.client(
              m: _clientFailureMessages,
              e: e,
            );
          }
        } else if (statusCode >= 500 && statusCode <= 599) {
          failure = RequestFailure.server(
            m: _serverFailureMessages,
            e: e,
          );
        } else {
          failure = RequestFailure.undefined(
            m: _undefinedFailureMessages,
            e: e,
          );
        }
      } else {
        failure = RequestFailure.undefined(
          m: _undefinedFailureMessages,
          e: e,
        );
      }
    }

    if (failure != null) {
      _customLogger.logFailure(
        loggerName: loggerName,
        failure: failure,
      );
      return Left(failure);
    } else {
      return Right(response);
    }
  }
}
