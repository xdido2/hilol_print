import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../di/injection.dart';
import 'app.dart';

sealed class AppInit {
  static Future<void> run() async {
    WidgetsFlutterBinding.ensureInitialized();
    await setupLocator();
    await _initAppSettings();
    await _initLocalServices();
    runApp(const App());
  }

  static Future<void> _initAppSettings() async {
    await SystemChrome.setPreferredOrientations([.portraitUp, .portraitDown]);
  }

  static Future<void> _initLocalServices() async {
    // Initialize services here
  }
}
