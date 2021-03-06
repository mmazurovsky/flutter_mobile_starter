import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../auth/repo/auth_repo.dart';

import '../exceptions/custom_exceptions.dart';
import 'network_check.dart';

abstract class RemoteRequestWrapper<T> {
  Future<T> call(Future<T> Function(Map<String, String>) request,
      {Map<String, String>? httpHeaders});
}

class RemoteRequestWrapperJsonContentAddon<T>
    implements RemoteRequestWrapper<T> {
  final RemoteRequestWrapper<T> _remoteRequestWrapper;
  RemoteRequestWrapperJsonContentAddon(this._remoteRequestWrapper);

  @override
  Future<T> call(Future<T> Function(Map<String, String>) request,
      {Map<String, String>? httpHeaders}) {
    if (httpHeaders == null) {
      httpHeaders = {HttpHeaders.contentTypeHeader: 'application/json'};
    } else {
      httpHeaders[HttpHeaders.contentTypeHeader] = 'application/json';
    }
    return _remoteRequestWrapper(request, httpHeaders: httpHeaders);
  }
}

class RemoteRequestWrapperAuthTokenAddon<T> implements RemoteRequestWrapper<T> {
  final RemoteRequestWrapper<T> _remoteRequestWrapper;
  final AuthRepo _authRepo;
  RemoteRequestWrapperAuthTokenAddon(
      this._remoteRequestWrapper, this._authRepo);

  @override
  Future<T> call(Future<T> Function(Map<String, String>) request,
      {Map<String, String>? httpHeaders}) async {
    final String? authToken = _authRepo.currentUser != null
        ? await _authRepo.currentUser!.idToken
        : null;
    if (authToken != null) {
      if (httpHeaders == null) {
        httpHeaders = {HttpHeaders.authorizationHeader: 'Bearer $authToken'};
      } else {
        httpHeaders[HttpHeaders.authorizationHeader] = 'Bearer $authToken';
      }
    }
    return _remoteRequestWrapper(request, httpHeaders: httpHeaders);
  }
}

class RemoteRequestWrapperImpl<T> implements RemoteRequestWrapper<T> {
  final NetworkCheck _networkCheck;

  RemoteRequestWrapperImpl(
    this._networkCheck,
  );

  @override
  Future<T> call(Future<T> Function(Map<String, String>) request,
      {Map<String, String>? httpHeaders}) async {
    _networkCheck();
    final T result = await request(httpHeaders!);
    return result;
  }
}
