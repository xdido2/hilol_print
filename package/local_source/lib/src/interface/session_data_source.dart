part of '../local_source.dart';

/// {@template session_data_source}
/// Data source for onboarding/session id.
/// {@endtemplate}
abstract interface class SessionDataSource {
  /// {@macro session_data_source}
  const SessionDataSource._();

  String get sessionId;
  Future<void> setSessionId(String sessionId);
}

/// {@template session_data_source_mixin}
/// Mixin for session id storage.
/// {@endtemplate}
base mixin SessionDataSourceMixin on PreferenceDao implements SessionDataSource {
  PreferenceEntry<String> get _sessionIdKey => stringEntry(key: 'auth.session_id');

  @override
  String get sessionId => readFromCache<String>(_sessionIdKey) ?? '';

  @override
  Future<void> setSessionId(String sessionId) async {
    cache[_sessionIdKey.key] = sessionId;
    await _sessionIdKey.set(sessionId);
  }
}
