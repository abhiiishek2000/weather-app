class ApiCredentials {
  static const String baseURL = String.fromEnvironment(
    'WEATHER_BASE_URL',
    defaultValue: '',
  );
  static const String weatherBaseExtender = String.fromEnvironment(
    'WEATHER_BASE_EXTENDER',
    defaultValue: '',
  );
  static const String weatherApiKey = String.fromEnvironment(
    'WEATHER_API_KEY',
    defaultValue: '',
  );
  static const String googleMapsApiKey = String.fromEnvironment(
    'GOOGLE_MAPS_API_KEY',
    defaultValue: '',
  );
}