import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/utils/error_message_extractor.dart';
import '../../domain/entities/weather_entity.dart';
import '../../domain/usecases/get_city_forecast.dart';
part 'city_weather_state.dart';

class CityWeatherCubit extends Cubit<CityWeatherState> {
  final GetCityForecast getCityWeather;

  CityWeatherCubit({required this.getCityWeather})
    : super(CityWeatherInitial());

  Future<void> getCityWeatherData(String cityName) async {
    if (state is CityWeatherLoading) return;
    emit(CityWeatherLoading());

    try {
      final weather = await getCityWeather.call(cityName);
      emit(CityWeatherLoaded(weather: weather));
    } catch (e) {
      emit(CityWeatherError(message: ErrorMessageExtractor.call(e.toString())));
    }
  }
}
