import '../entities/weather_entity.dart';
import '../repository/weather_repository.dart';

class GetCityForecast {
  final WeatherRepository _weatherRepository;

  const GetCityForecast({required WeatherRepository weatherRepository})
    : _weatherRepository = weatherRepository;

  Future<WeatherEntity> call(String cityName) =>
      _weatherRepository.getWeatherByCityName(cityName);
}
