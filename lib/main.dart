import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/theme/app_theme.dart';
import 'package:weather_app/features/weather/presentation/cubit/map_weather_cubit.dart';
import 'core/routes/router_lib.dart';
import 'features/weather/presentation/cubit/city_weather_cubit.dart';
import 'features/weather/presentation/cubit/weather_cubit.dart';
import 'main_container_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This common is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<WeatherCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<CityWeatherCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<MapWeatherCubit>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Weather',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
