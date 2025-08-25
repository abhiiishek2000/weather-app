part of 'city_weather_cubit.dart';
abstract class CityWeatherState extends Equatable {
  const CityWeatherState();
}

class CityWeatherInitial extends CityWeatherState {
  @override
  List<Object> get props => [];
}

class CityWeatherLoading extends CityWeatherState {
  @override
  List<Object> get props => [];
}

class CityWeatherLoaded extends CityWeatherState {
  final WeatherEntity weather;

  const CityWeatherLoaded({required this.weather});

  @override
  List<Object> get props => [weather];
}

class CityWeatherError extends CityWeatherState {
  final String message;

  const CityWeatherError({required this.message});

  @override
  List<Object> get props => [message];
}
