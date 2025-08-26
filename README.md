# Flutter Weather App

A Flutter app that shows weather data and forecasts using OpenWeatherMap API with Google Maps integration.

## 📱 Download APK

[Download Latest APK](https://drive.google.com/file/d/1PgANOuZuJXisKaN2t_c1ab6hwTprpbP3/view?usp=sharing)

## Features

- Current weather display with temperature and conditions
- 5-day weather forecast
- GPS location detection
- Manual city search
- Google Maps with weather overlay
- Location markers showing weather details

## Setup Instructions

### 1. Clone the project
```bash
git clone https://github.com/abhiiishek2000/weather-app.git
cd weather-app
flutter pub get
```

### 2. Get API Keys
- **OpenWeatherMap**: [Sign up here](https://openweathermap.org/api)
- **Google Maps**: [Get key from Google Cloud Console](https://console.cloud.google.com/)

### 3. Setup API Keys

**Update Google Maps in AndroidManifest.xml** - Keep existing hardcoded key:
```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="${googleMapsApiKey}" />
```

### 4. Run the app with dart-define
```bash
flutter run --dart-define=WEATHER_BASE_URL=api.openweathermap.org --dart-define=WEATHER_BASE_EXTENDER=/data/2.5 --dart-define=WEATHER_API_KEY=yourApiKey --dart-define=GOOGLE_MAPS_API_KEY=yourMapApiKey
```

## Architecture Overview

This project follows **Clean Architecture** principles with:

- **State Management**: Bloc/Cubit pattern for predictable state handling
- **Dependency Injection**: Using get_it for loose coupling between layers
- **Layer Separation**:
  - **Data Layer**: Repositories, data sources, models
  - **Domain Layer**: Business logic, entities, use cases
  - **Presentation Layer**: UI, Bloc/Cubit, widgets
- **Error Handling**: Network errors, location permissions, API failures

## Project Structure
```
lib/
├── core/
│   ├── common/             # Shared utilities and helpers
│   ├── config/             # API keys and configuration
│   ├── networking/         # HTTP client setup
│   ├── routes/             # App navigation routes
│   ├── services/           # Core services (location, permissions)
│   ├── theme/              # App theme and styling
│   └── utils/              # Utility functions
├── features/
│   └── weather/
│       ├── data/           # Data sources and repositories
│       ├── domain/         # Business logic and entities
│       ├── presentation/   # UI screens and widgets
│       └── weather_container_injection.dart
├── main_container_injection.dart
└── main.dart
```
