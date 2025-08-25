import '../entities/forecast_entity.dart';
import '../repository/weather_repository.dart';

class GetFiveDaysForecast {
  final WeatherRepository _weatherRepository;

  GetFiveDaysForecast({required WeatherRepository weatherRepository})
    : _weatherRepository = weatherRepository;

  Future<ForecastEntity> call(double lat, double long) =>
      _weatherRepository.getForecastByLatLong(lat, long);
}
