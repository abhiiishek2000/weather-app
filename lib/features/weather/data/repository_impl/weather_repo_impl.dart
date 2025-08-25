import '../../domain/entities/forecast_entity.dart';
import '../../domain/entities/weather_entity.dart';
import '../../domain/repository/weather_repository.dart';
import '../weather_datasource/weather_datasource.dart';

class WeatherRepoImpl implements WeatherRepository {
  final WeatherDataSource _weatherDataSource;

  WeatherRepoImpl({required WeatherDataSource weatherDataSource})
    : _weatherDataSource = weatherDataSource;

  @override
  Future<ForecastEntity> getForecastByLatLong(double lat, double long) =>
      _weatherDataSource.getForecastByLatLong(lat, long);

  @override
  Future<WeatherEntity> getWeatherByCityName(String cityName) =>
      _weatherDataSource.getWeatherByCityName(cityName);

  @override
  Future<WeatherEntity> getWeatherByLatLong(double lat, double long) =>
      _weatherDataSource.getWeatherByLatLong(lat, long);
}
