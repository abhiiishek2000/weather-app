

part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoaded extends WeatherState {
  final ForecastEntity? forecast;
  final WeatherEntity? currentWeather;
  final bool isForecastLoading;

  const WeatherLoaded({
    this.forecast,
    this.currentWeather,
    this.isForecastLoading = false,
  });

  @override
  List<Object?> get props => [forecast, currentWeather, isForecastLoading];

  WeatherLoaded copyWith({
    ForecastEntity? forecast,
    WeatherEntity? currentWeather,
    bool? isForecastLoading,
  }) {
    return WeatherLoaded(
      forecast: forecast ?? this.forecast,
      currentWeather: currentWeather ?? this.currentWeather,
      isForecastLoading: isForecastLoading ?? this.isForecastLoading,
    );
  }
}

class WeatherError extends WeatherState {
  final String message;

  const WeatherError(this.message);

  @override
  List<Object?> get props => [message];
}
