import 'dart:async';

import 'package:dio/dio.dart';
import 'package:local_source/local_source.dart';

import '../../auth/auth_session_notifier.dart';
import '../../constant/urls.dart';
import '../../error/failure.dart';

final class RefreshTokenInterceptor extends Interceptor {
  RefreshTokenInterceptor({required this.localSource, required this.mainDio, required this.authSessionNotifier});

  final LocalSource localSource;
  final Dio mainDio;
  final AuthSessionNotifier authSessionNotifier;

  static const String _refreshExtraKey = 'is_refresh_token_request';
  static const String _retriedExtraKey = 'retried';

  bool _isRefreshing = false;
  Completer<void>? _refreshCompleter;
  Dio? _refreshDio;

  bool _isRefreshTokenRequest(RequestOptions options) => options.extra[_refreshExtraKey] == true;

  Dio _getRefreshDio() {
    final existing = _refreshDio;
    if (existing != null) return existing;

    final baseOptions = mainDio.options;
    final Map<String, Object?> refreshHeaders = .from(baseOptions.headers)..remove('Authorization');

    final dio = Dio(
      BaseOptions(
        baseUrl: baseOptions.baseUrl,
        headers: refreshHeaders.cast<String, dynamic>(),
        connectTimeout: baseOptions.connectTimeout,
        receiveTimeout: baseOptions.receiveTimeout,
        sendTimeout: baseOptions.sendTimeout,
        responseType: baseOptions.responseType,
        validateStatus: baseOptions.validateStatus,
      ),
    );

    // Copy interceptors from main dio except this one.
    for (final interceptor in mainDio.interceptors) {
      if (interceptor is RefreshTokenInterceptor) continue;
      dio.interceptors.add(interceptor);
    }

    // Ensure refresh request never carries Authorization, even if another interceptor adds it.
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (_isRefreshTokenRequest(options)) {
            options.headers.remove('Authorization');
          }
          handler.next(options);
        },
      ),
    );

    _refreshDio = dio;
    return dio;
  }

  Future<void> _logout() async {
    await localSource.clearAll();
    authSessionNotifier.notifySessionChanged();
  }

  ({String accessToken, String refreshToken}) _parseTokens(Object? data) {
    if (data is! Map) throw const ServerFailure(message: 'Invalid refresh response');
    final Map<String, Object?> json = data.cast<String, Object?>();

    if (json case {
      'data': {
        'data': {
          'data': {'token': {'access_token': final String accessToken, 'refresh_token': final String refreshToken}},
        },
      },
    }) {
      return (accessToken: accessToken, refreshToken: refreshToken);
    }

    throw ServerFailure(message: (json['data'] as String?) ?? 'Invalid refresh response');
  }

  Future<void> _performRefreshToken() async {
    if (_isRefreshing) {
      await (_refreshCompleter?.future ?? Future<void>.value());
      return;
    }

    _isRefreshing = true;
    _refreshCompleter = Completer<void>();

    try {
      final refreshToken = localSource.refreshToken;
      if (refreshToken.isEmpty) {
        throw const ServerFailure(message: 'No refresh token found');
      }

      final refreshDio = _getRefreshDio();

      final Response<Object?> response = await refreshDio.post<Object?>(
        Urls.prefix,
        data: <String, Object?>{
          'data': <String, Object?>{
            'method': 'refresh_token',
            'object_data': <String, Object?>{'refresh_token': refreshToken},
          },
        },
        options: Options(
          extra: <String, Object?>{_refreshExtraKey: true},
          headers: <String, dynamic>{'Application-Language': localSource.localization.languageCode},
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      final int? statusCode = response.statusCode;
      if (statusCode != 200 && statusCode != 201) {
        throw ServerFailure(message: 'Refresh failed: $statusCode');
      }

      final parsed = _parseTokens(response.data);
      if (parsed.accessToken.isEmpty || parsed.refreshToken.isEmpty) {
        throw const ServerFailure(message: 'Empty tokens received');
      }

      await localSource.setAccessToken(parsed.accessToken);
      await localSource.setRefreshToken(parsed.refreshToken);
      authSessionNotifier.notifySessionChanged();

      _refreshCompleter?.complete();
    } catch (err) {
      _refreshCompleter?.completeError(err);
      rethrow;
    } finally {
      _isRefreshing = false;
    }
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final RequestOptions requestOptions = err.requestOptions;

    if (_isRefreshTokenRequest(requestOptions)) {
      await _logout();
      return handler.reject(err);
    }

    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    if (localSource.refreshToken.isEmpty) {
      return handler.next(err);
    }

    final bool alreadyRetried = requestOptions.extra[_retriedExtraKey] == true;
    if (alreadyRetried) {
      await _logout();
      return handler.reject(err);
    }

    try {
      await _performRefreshToken();

      final String newAccessToken = localSource.accessToken;
      if (newAccessToken.isEmpty) {
        throw const ServerFailure(message: 'New access token is empty after refresh');
      }

      final Map<String, Object?> updatedHeaders = .from(requestOptions.headers);
      updatedHeaders['Authorization'] = 'Bearer $newAccessToken';

      final RequestOptions retryRequest = requestOptions.copyWith(
        headers: updatedHeaders.cast<String, dynamic>(),
        extra: <String, Object?>{...requestOptions.extra, _retriedExtraKey: true},
      );

      final Response<Object?> response = await mainDio.fetch<Object?>(retryRequest);
      return handler.resolve(response);
    } on Object {
      await _logout();
      return handler.reject(err);
    }
  }
}
