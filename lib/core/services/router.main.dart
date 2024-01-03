part of 'router.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      final prefs = sl<SharedPreferences>();
      return _pageBuilder(
        (context) {
          if (prefs.getBool(kFirstTimerKey) ?? false) {
            return BlocProvider(
              create: (_) => sl<SplashCubit>(),
              child: const SplashView(),
            );
          }
          return BlocProvider(
            create: (_) => sl<HomeBloc>(),
            child: const HomeView(),
          );
        },
        settings: settings,
      );
    case HomeView.routeName:
      return _pageBuilder(
        (_) => BlocProvider(
          create: (_) => sl<HomeBloc>(),
          child: const HomeView(),
        ),
        settings: settings,
      );

    default:
      return _pageBuilder(
        (_) => const PageUnderConstruction(),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
    pageBuilder: (context, _, __) => page(context),
  );
}
