import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thunder/thunder.dart';

import '../../common/constant/constants.dart';
import '../di/injection.dart';
import '../localization/generated/app_localizations.dart';
import '../router/routes.dart';
import '../shared/settings/domain/repository/settings_repository.dart';
import '../shared/settings/presentation/bloc/settings_cubit.dart';
import '../shared/settings/presentation/bloc/settings_state.dart';
import '../theme/theme_data.dart';
import 'initialization.dart';
import 'splash_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late Stream<InitializationResult> _initSteam;
  @override
  void initState() {
    super.initState();
    _initSteam = initDependencies();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => SettingsCubit(settingsRepository: sl<SettingsRepository>()),
    child: BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) => MaterialApp.router(
        debugShowCheckedModeBanner: false,

        routerConfig: AppRouter.router,
        theme: AppThemeData.light(),
        darkTheme: AppThemeData.dark(),
        themeMode: state.themeMode,

        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: .noScaling),
          child: StreamBuilder(
            stream: _initSteam,
            builder: (context, snapshot) => Thunder(
              dio: [sl<Dio>()],
              child: AnimatedSwitcher(
                duration: Constants.transitionDuration,
                child: snapshot.connectionState == .active && snapshot.hasData
                    ? const SplashScreen(key: ValueKey('splash'))
                    : KeyedSubtree(key: const ValueKey('app'), child: child!),
              ),
            ),
          ),
        ),

        locale: state.locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
      ),
    ),
  );
}
