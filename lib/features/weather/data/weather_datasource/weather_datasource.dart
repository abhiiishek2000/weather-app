import '../models/forecast_model.dart';
import '../models/weather_model.dart';

abstract class WeatherDataSource {
  Future<WeatherModel> getWeatherByLatLong(double lat, double long);

  Future<WeatherModel> getWeatherByCityName(String cityName);

  Future<ForecastModel> getForecastByLatLong(double lat, double long);
}
