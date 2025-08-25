import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/utils/error_message_extractor.dart';
import '../../domain/usecases/get_current_weather.dart';
import 'map_weather_state.dart';

class MapWeatherCubit extends Cubit<MapWeatherState> {
  final GetCurrentWeather getCurrentWeather;

  MapWeatherCubit({required this.getCurrentWeather})
    : super(MapWeatherInitial());

  Future<void> getMapWeather(LatLng input) async {
    emit(MapWeatherLoading());
    try {
      var result = await getCurrentWeather.call(
        input.latitude,
        input.longitude,
      );
      emit(MapWeatherDataLoaded(data: result));
    } catch (e) {
      emit(
        MapWeatherDataError(message: ErrorMessageExtractor.call(e.toString())),
      );
    }
  }
}
