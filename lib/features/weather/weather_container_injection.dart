import 'package:weather_app/features/weather/presentation/cubit/city_weather_cubit.dart';
import 'package:weather_app/features/weather/presentation/cubit/map_weather_cubit.dart';
import 'package:weather_app/features/weather/presentation/cubit/weather_cubit.dart';
import '../../main_container_injection.dart';
import 'data/repository_impl/weather_repo_impl.dart';
import 'data/weather_datasource/weather_datasource.dart';
import 'data/weather_datasource/weather_datasource_impl.dart';
import 'domain/repository/weather_repository.dart';
import 'domain/usecases/get_city_forecast.dart';
import 'domain/usecases/get_current_weather.dart';
import 'domain/usecases/get_fivedays_forecast.dart';

Future<void> weatherContainerInjection() async {
  // * CUBITS INJECTION
  sl.registerFactory<WeatherCubit>(
    () => WeatherCubit(
      getCurrentWeather: sl.call(),
      getForecast: sl.call(),
      locationService: sl.call(),
    ),
  );

  sl.registerFactory<CityWeatherCubit>(
    () => CityWeatherCubit(getCityWeather: sl.call()),
  );
  sl.registerFactory<MapWeatherCubit>(
    () => MapWeatherCubit(getCurrentWeather: sl.call()),
  );

  // * USE CASES INJECTION
  sl.registerLazySingleton<GetCityForecast>(
    () => GetCityForecast(weatherRepository: sl.call()),
  );
  sl.registerLazySingleton<GetFiveDaysForecast>(
    () => GetFiveDaysForecast(weatherRepository: sl.call()),
  );
  sl.registerLazySingleton<GetCurrentWeather>(
    () => GetCurrentWeather(weatherRepository: sl.call()),
  );

  // * REPOSITORY & DATA SOURCES INJECTION

  sl.registerLazySingleton<WeatherRepository>(
    () => WeatherRepoImpl(weatherDataSource: sl.call()),
  );

  sl.registerLazySingleton<WeatherDataSource>(
    () => WeatherDataSourceImpl(apiProvider: sl.call()),
  );
}
