import 'package:dio/dio.dart';

/// Extracts a user-friendly message from common API error payloads.
///
/// Expected payload example:
/// ```json
/// {
///   "status": "INVALID_ARGUMENT",
///   "description": "Invalid argument value passed",
///   "data": "user not found",
///   "custom_message": ""
/// }
/// ```
final class ApiErrorMessageExtractor {
  const ApiErrorMessageExtractor._();

  static String? fromDioException(DioException exception) {
    final String? apiMessage = fromResponseData(exception.response?.data);
    if (apiMessage != null) return apiMessage;

    final String? fallback = exception.message;
    if (fallback == null) return null;

    final normalized = fallback.trim();
    return normalized.isEmpty ? null : normalized;
  }

  static String? fromResponseData(Object? data) {
    if (data is String) {
      final normalized = data.trim();
      return normalized.isEmpty ? null : normalized;
    }

    if (data is! Map) return null;
    final Map<String, Object?> map = data.cast<String, Object?>();

    String? pickString(Object? value) {
      if (value is! String) return null;
      final normalized = value.trim();
      return normalized.isEmpty ? null : normalized;
    }

    // Prefer server-provided message in `data`.
    return pickString(map['data']) ?? pickString(map['custom_message']) ?? pickString(map['description']);
  }
}
