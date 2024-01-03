part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initSplasher();
}

Future<void> _initSplasher() async {
  final prefs = await SharedPreferences.getInstance();

  sl
    ..registerFactory(() => SplashCubit(
          cacheFirstTimer: sl(),
          checkFirstTimer: sl(),
        ))
    ..registerLazySingleton(() => CacheFirstTimer(sl()))
    ..registerLazySingleton(() => CheckFirstTimer(sl()))
    ..registerLazySingleton<SplasherRepository>(
        () => SplasherRepositoryImplementation(sl()))
    ..registerLazySingleton<SplasherLocalDataSource>(
        () => SplasherLocalDataSourceImplementation(sl()))
    ..registerLazySingleton(() => prefs);
}
