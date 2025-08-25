import '../entities/forecast_entity.dart';
import '../entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<WeatherEntity> getWeatherByLatLong(double lat, double long);

  Future<WeatherEntity> getWeatherByCityName(String cityName);

  Future<ForecastEntity> getForecastByLatLong(double lat, double long);
}
