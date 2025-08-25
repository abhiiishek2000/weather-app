import '../entities/weather_entity.dart';
import '../repository/weather_repository.dart';

class GetCurrentWeather {
  final WeatherRepository _weatherRepository;

  const GetCurrentWeather({required WeatherRepository weatherRepository})
    : _weatherRepository = weatherRepository;

  Future<WeatherEntity> call(double lat, double long) =>
      _weatherRepository.getWeatherByLatLong(lat, long);
}
