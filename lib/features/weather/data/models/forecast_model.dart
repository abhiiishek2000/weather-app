import 'package:weather_app/features/weather/data/models/weather_model.dart';

import '../../domain/entities/forecast_entity.dart';

class ForecastModel extends ForecastEntity {
  const ForecastModel({
    required super.cod,
    required super.message,
    required super.cnt,
    required super.list,
    required super.city,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      cod: json["cod"],
      message: json["message"],
      cnt: json["cnt"],
      list: json["list"] == null
          ? []
          : List<ForecastItemModel>.from(
          json["list"]!.map((x) => ForecastItemModel.fromJson(x))),
      city: json["city"] == null ? null : CityModel.fromJson(json["city"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "cod": cod,
    "message": message,
    "cnt": cnt,
    "list": list.map((x) => (x as ForecastItemModel).toJson()).toList(),
    "city": (city as CityModel?)?.toJson(),
  };
}

class CityModel extends CityEntity {
  const CityModel({
    required super.id,
    required super.name,
    required super.coord,
    required super.country,
    required super.population,
    required super.timezone,
    required super.sunrise,
    required super.sunset,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json["id"],
      name: json["name"],
      coord: json["coord"] == null
          ? null
          : CoordModel.fromJson(json["coord"]),
      country: json["country"],
      population: json["population"],
      timezone: json["timezone"],
      sunrise: json["sunrise"],
      sunset: json["sunset"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "coord": (coord as CoordModel?)?.toJson(),
    "country": country,
    "population": population,
    "timezone": timezone,
    "sunrise": sunrise,
    "sunset": sunset,
  };
}

class ForecastItemModel extends ForecastItemEntity {
  const ForecastItemModel({
    required super.dt,
    required super.main,
    required super.weather,
    required super.clouds,
    required super.wind,
    required super.visibility,
    required super.pop,
    required super.sys,
    required super.dtTxt,
    required super.rain,
  });

  factory ForecastItemModel.fromJson(Map<String, dynamic> json) {
    return ForecastItemModel(
      dt: json["dt"],
      main: json["main"] == null
          ? null
          : ForecastMainModel.fromJson(json["main"]),
      weather: json["weather"] == null
          ? []
          : List<WeatherInfoModel>.from(
          json["weather"]!.map((x) => WeatherInfoModel.fromJson(x))),
      clouds: json["clouds"] == null
          ? null
          : CloudsModel.fromJson(json["clouds"]),
      wind: json["wind"] == null
          ? null
          : WindModel.fromJson(json["wind"]),
      visibility: json["visibility"],
      pop: json["pop"]?.toDouble(),
      sys: json["sys"] == null
          ? null
          : ForecastSysModel.fromJson(json["sys"]),
      dtTxt: DateTime.tryParse(json["dt_txt"] ?? ""),
      rain: json["rain"] == null ? null : RainModel.fromJson(json["rain"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "dt": dt,
    "main": (main as ForecastMainModel?)?.toJson(),
    "weather": weather
        .map((x) => (x as WeatherInfoModel).toJson())
        .toList(),
    "clouds": (clouds as CloudsModel?)?.toJson(),
    "wind": (wind as WindModel?)?.toJson(),
    "visibility": visibility,
    "pop": pop,
    "sys": (sys as ForecastSysModel?)?.toJson(),
    "dt_txt": dtTxt?.toIso8601String(),
    "rain": (rain as RainModel?)?.toJson(),
  };
}

class ForecastMainModel extends ForecastMainEntity {
  const ForecastMainModel({
    required super.temp,
    required super.feelsLike,
    required super.tempMin,
    required super.tempMax,
    required super.pressure,
    required super.seaLevel,
    required super.grndLevel,
    required super.humidity,
    required super.tempKf,
  });

  factory ForecastMainModel.fromJson(Map<String, dynamic> json) {
    return ForecastMainModel(
      temp: json["temp"]?.toDouble(),
      feelsLike: json["feels_like"]?.toDouble(),
      tempMin: json["temp_min"]?.toDouble(),
      tempMax: json["temp_max"]?.toDouble(),
      pressure: json["pressure"],
      seaLevel: json["sea_level"],
      grndLevel: json["grnd_level"],
      humidity: json["humidity"],
      tempKf: json["temp_kf"]?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    "temp": temp,
    "feels_like": feelsLike,
    "temp_min": tempMin,
    "temp_max": tempMax,
    "pressure": pressure,
    "sea_level": seaLevel,
    "grnd_level": grndLevel,
    "humidity": humidity,
    "temp_kf": tempKf,
  };
}

class RainModel extends RainEntity {
  const RainModel({
    required super.threeHour,
  });

  factory RainModel.fromJson(Map<String, dynamic> json) {
    return RainModel(
      threeHour: json["3h"]?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    "3h": threeHour,
  };
}

class ForecastSysModel extends ForecastSysEntity {
  const ForecastSysModel({
    required super.pod,
  });

  factory ForecastSysModel.fromJson(Map<String, dynamic> json) {
    return ForecastSysModel(
      pod: json["pod"],
    );
  }

  Map<String, dynamic> toJson() => {
    "pod": pod,
  };
}