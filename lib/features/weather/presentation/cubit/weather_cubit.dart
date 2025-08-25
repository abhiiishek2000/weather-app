import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/location_service.dart';
import '../../../../core/utils/error_message_extractor.dart';
import '../../domain/entities/weather_entity.dart';
import '../../domain/usecases/get_current_weather.dart';
import '../../domain/usecases/get_fivedays_forecast.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/forecast_entity.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetCurrentWeather getCurrentWeather;
  final GetFiveDaysForecast getForecast;
  final LocationService locationService;

  WeatherCubit({
    required this.getCurrentWeather,
    required this.getForecast,
    required this.locationService,
  }) : super(WeatherInitial());

  Future<void> getCurrentWeatherData() async {
    if (state is WeatherLoading || state is WeatherLoaded) return;
    emit(WeatherLoading());
    try {
      final position = await locationService.getCurrentPosition();
      final weather = await getCurrentWeather.call(
        position.latitude,
        position.longitude,
      );
      emit(WeatherLoaded(currentWeather: weather));
    } catch (e) {
      emit(WeatherError(ErrorMessageExtractor.call(e.toString())));
    }
  }

  Future<void> getForecastData() async {
    var loadedState = state is WeatherLoaded ? state as WeatherLoaded : null;
    if (loadedState == null ||
        loadedState.forecast != null ||
        loadedState.isForecastLoading)
      return;
    emit(loadedState.copyWith(isForecastLoading: true));
    try {
      final position = await locationService.getCurrentPosition();
      final forecast = await getForecast.call(
        position.latitude,
        position.longitude,
      );

      emit(loadedState.copyWith(forecast: forecast, isForecastLoading: false));
    } catch (e) {
      emit(WeatherError(ErrorMessageExtractor.call(e.toString())));
    }
  }
}
