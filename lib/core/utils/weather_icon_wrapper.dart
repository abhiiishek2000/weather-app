class WeatherIconMapper {
  static String getWeatherIconUrl(String? iconCode, {String size = '2x'}) {
    if (iconCode == null || iconCode.isEmpty) {
      return 'https://openweathermap.org/img/wn/01d@2x.png'; // Default sunny icon
    }
    return 'https://openweathermap.org/img/wn/$iconCode@$size.png';
  }
}