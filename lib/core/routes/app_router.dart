part of 'router_lib.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.mainWeather,
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return BottomNav(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            GoRoute(
              path: AppRoutes.mainWeather,
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  child: const MainWeatherScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBKey,
          routes: [
            GoRoute(
              path: AppRoutes.map,
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  child: const MapViewWeatherScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                );
              },
            ),
          ],
        ),
      ],
    ),

    GoRoute(
      path: AppRoutes.searchCity,
      builder: (context, state) => const CitySearchScreen(),
    ),
    GoRoute(
      path: AppRoutes.cityWeather,
      builder: (context, state) =>
          CityWeatherScreen(cityName: state.pathParameters['cityName']!),
    ),
  ],
);
