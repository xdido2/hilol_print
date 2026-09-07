import 'package:flutter/foundation.dart';

/// Notifies app-wide listeners about auth/session changes (login, logout, token refresh).
final class AuthSessionNotifier extends ChangeNotifier {
  void notifySessionChanged() => notifyListeners();
}
