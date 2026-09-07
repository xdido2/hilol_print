import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:local_source/local_source.dart';

import '../../common/constant/constants.dart';
import '../../features/auth/data/datasources/local/auth_local_data_source.dart';
import '../../features/auth/data/repository/auth_repository_impl.dart';
import '../../features/auth/domain/repository/auth_repository.dart';
import '../../features/auth/domain/usecase/login_use_case.dart';
import '../../features/auth/domain/usecase/logout_use_case.dart';
import '../../features/auth/presentation/bloc/auth_cubit.dart';
import '../../features/card/data/datasources/local/card_local_data_source.dart';
import '../../features/card/data/repository/card_repository_impl.dart';
import '../../features/card/domain/repository/card_repository.dart';
import '../../features/card/domain/usecase/add_card_use_case.dart';
import '../../features/card/domain/usecase/get_cards_use_case.dart';
import '../../features/card/presentation/cubit/card_cubit.dart';
import '../../features/card/presentation/cubit/card_list_cubit.dart';
import '../../features/card/data/datasources/local/card_scanner_data_source.dart';
import '../../features/card/data/repository/card_scanner_repository_impl.dart';
import '../../features/card/domain/repository/card_scanner_repository.dart';
import '../../features/card/domain/usecase/dispose_card_scanner_use_case.dart';
import '../../features/card/domain/usecase/open_app_settings_use_case.dart';
import '../../features/card/domain/usecase/recognize_card_use_case.dart';
import '../../features/card/domain/usecase/request_camera_permission_use_case.dart';
import '../../features/card/presentation/cubit/card_scanner_cubit.dart';
import '../../features/home/data/repository/home_repository_impl.dart';
import '../../features/home/domain/repository/home_repository.dart';
import '../../features/home/domain/usecase/get_home_items_use_case.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../../features/journal/data/repository/journal_repository_impl.dart';
import '../../features/journal/domain/repository/journal_repository.dart';
import '../../features/journal/domain/usecase/get_journal_entries_use_case.dart';
import '../../features/journal/presentation/cubit/journal_cubit.dart';
import '../../features/profile/data/repository/profile_repository_impl.dart';
import '../../features/profile/domain/repository/profile_repository.dart';
import '../../features/profile/domain/usecase/get_profile_use_case.dart';
import '../../features/profile/presentation/cubit/profile_cubit.dart';
import '../auth/auth_session_notifier.dart';
import '../constant/config.dart';
import '../shared/settings/data/repository/settings_repository_impl.dart';
import '../shared/settings/domain/repository/settings_repository.dart';

final GetIt sl = .instance;

Future<void> setupLocator() async {
  final localSource = await LocalSource.instance;
  sl.registerLazySingleton<LocalSource>(() => localSource);
  sl.registerLazySingleton<AuthSessionNotifier>(() => AuthSessionNotifier());
  final dio = await _initDio(localSource: localSource);
  sl.registerLazySingleton<Dio>(() => dio);

  await _initSettings();
  await _initAuth();
  await _initHome();
  await _initJournal();
  await _initProfile();
  await _initCard();
}

Future<void> _initSettings() async {
  sl.registerLazySingleton<SettingsRepository>(() => SettingsRepositoryImpl(localSource: sl<LocalSource>()));
}

Future<void> _initAuth() async {
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(localSource: sl<LocalSource>(), authSessionNotifier: sl<AuthSessionNotifier>()),
  );
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(localDataSource: sl<AuthLocalDataSource>()));
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(authRepository: sl<AuthRepository>()));
  sl.registerLazySingleton<LogoutUseCase>(() => LogoutUseCase(authRepository: sl<AuthRepository>()));
  sl.registerFactory<AuthCubit>(() => AuthCubit(loginUseCase: sl<LoginUseCase>(), logoutUseCase: sl<LogoutUseCase>()));
}

Future<void> _initHome() async {
  sl.registerLazySingleton<HomeRepository>(() => const HomeRepositoryImpl());
  sl.registerLazySingleton<GetHomeItemsUseCase>(() => GetHomeItemsUseCase(homeRepository: sl<HomeRepository>()));
  sl.registerFactory<HomeCubit>(() => HomeCubit(getHomeItemsUseCase: sl<GetHomeItemsUseCase>()));
}

Future<void> _initJournal() async {
  sl.registerLazySingleton<JournalRepository>(() => const JournalRepositoryImpl());
  sl.registerLazySingleton<GetJournalEntriesUseCase>(
    () => GetJournalEntriesUseCase(repository: sl<JournalRepository>()),
  );
  sl.registerFactory<JournalCubit>(() => JournalCubit(getJournalEntriesUseCase: sl<GetJournalEntriesUseCase>()));
}

Future<void> _initProfile() async {
  sl.registerLazySingleton<ProfileRepository>(() => const ProfileRepositoryImpl());
  sl.registerLazySingleton<GetProfileUseCase>(() => GetProfileUseCase(repository: sl<ProfileRepository>()));
  sl.registerFactory<ProfileCubit>(() => ProfileCubit(getProfileUseCase: sl<GetProfileUseCase>()));
}

Future<void> _initCard() async {
  sl.registerLazySingleton<CardLocalDataSource>(() => CardLocalDataSourceImpl(localSource: sl<LocalSource>()));
  sl.registerLazySingleton<CardRepository>(() => CardRepositoryImpl(localDataSource: sl<CardLocalDataSource>()));
  sl.registerLazySingleton<AddCardUseCase>(() => AddCardUseCase(cardRepository: sl<CardRepository>()));
  sl.registerLazySingleton<GetCardsUseCase>(() => GetCardsUseCase(cardRepository: sl<CardRepository>()));
  sl.registerFactory<CardCubit>(() => CardCubit(addCardUseCase: sl<AddCardUseCase>()));
  sl.registerFactory<CardListCubit>(() => CardListCubit(getCardsUseCase: sl<GetCardsUseCase>()));

  sl.registerLazySingleton<CardScannerDataSource>(CardScannerDataSourceImpl.new);
  sl.registerLazySingleton<CardScannerRepository>(
    () => CardScannerRepositoryImpl(dataSource: sl<CardScannerDataSource>()),
  );
  sl.registerLazySingleton<RequestCameraPermissionUseCase>(
    () => RequestCameraPermissionUseCase(cardScannerRepository: sl<CardScannerRepository>()),
  );
  sl.registerLazySingleton<RecognizeCardUseCase>(
    () => RecognizeCardUseCase(cardScannerRepository: sl<CardScannerRepository>()),
  );
  sl.registerLazySingleton<OpenAppSettingsUseCase>(
    () => OpenAppSettingsUseCase(cardScannerRepository: sl<CardScannerRepository>()),
  );
  sl.registerLazySingleton<DisposeCardScannerUseCase>(
    () => DisposeCardScannerUseCase(cardScannerRepository: sl<CardScannerRepository>()),
  );
  sl.registerFactory<CardScannerCubit>(
    () => CardScannerCubit(
      requestCameraPermissionUseCase: sl<RequestCameraPermissionUseCase>(),
      recognizeCardUseCase: sl<RecognizeCardUseCase>(),
      openAppSettingsUseCase: sl<OpenAppSettingsUseCase>(),
      disposeCardScannerUseCase: sl<DisposeCardScannerUseCase>(),
    ),
  );
}

Future<Dio> _initDio({required LocalSource localSource}) async {
  final dio = Dio(
    BaseOptions(
      baseUrl: Config.current().apiBaseUrl,
      connectTimeout: Constants.connectTimeout,
      receiveTimeout: Constants.receiveTimeout,
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers.addAll(<String, String>{
          if (localSource.accessToken.isNotEmpty) 'Authorization': 'Bearer ${localSource.accessToken}',
          'Application-Language': localSource.localization.languageCode,
        });
        handler.next(options);
      },
    ),
  );

  return dio;
}
