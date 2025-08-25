import '../../domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel({
    required super.coord,
    required super.weather,
    required super.base,
    required super.main,
    required super.visibility,
    required super.wind,
    required super.clouds,
    required super.dt,
    required super.sys,
    required super.timezone,
    required super.id,
    required super.name,
    required super.cod,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      coord: json["coord"] == null ? null : CoordModel.fromJson(json["coord"]),
      weather: json["weather"] == null
          ? []
          : List<WeatherInfoModel>.from(
          json["weather"]!.map((x) => WeatherInfoModel.fromJson(x))),
      base: json["base"],
      main: json["main"] == null ? null : MainModel.fromJson(json["main"]),
      visibility: json["visibility"],
      wind: json["wind"] == null ? null : WindModel.fromJson(json["wind"]),
      clouds: json["clouds"] == null ? null : CloudsModel.fromJson(json["clouds"]),
      dt: json["dt"],
      sys: json["sys"] == null ? null : SysModel.fromJson(json["sys"]),
      timezone: json["timezone"],
      id: json["id"],
      name: json["name"],
      cod: json["cod"],
    );
  }

  Map<String, dynamic> toJson() => {
    "coord": (coord as CoordModel?)?.toJson(),
    "weather": weather.map((x) => (x as WeatherInfoModel).toJson()).toList(),
    "base": base,
    "main": (main as MainModel?)?.toJson(),
    "visibility": visibility,
    "wind": (wind as WindModel?)?.toJson(),
    "clouds": (clouds as CloudsModel?)?.toJson(),
    "dt": dt,
    "sys": (sys as SysModel?)?.toJson(),
    "timezone": timezone,
    "id": id,
    "name": name,
    "cod": cod,
  };
}

class CloudsModel extends CloudsEntity {
  const CloudsModel({
    required super.all,
  });

  factory CloudsModel.fromJson(Map<String, dynamic> json) {
    return CloudsModel(
      all: json["all"],
    );
  }

  Map<String, dynamic> toJson() => {
    "all": all,
  };
}

class CoordModel extends CoordEntity {
  const CoordModel({
    required super.lon,
    required super.lat,
  });

  factory CoordModel.fromJson(Map<String, dynamic> json) {
    return CoordModel(
      lon: json["lon"]?.toDouble(),
      lat: json["lat"]?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    "lon": lon,
    "lat": lat,
  };
}

class MainModel extends MainEntity {
  const MainModel({
    required super.temp,
    required super.feelsLike,
    required super.tempMin,
    required super.tempMax,
    required super.pressure,
    required super.humidity,
    required super.seaLevel,
    required super.grndLevel,
  });

  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
      temp: json["temp"]?.toDouble(),
      feelsLike: json["feels_like"]?.toDouble(),
      tempMin: json["temp_min"]?.toDouble(),
      tempMax: json["temp_max"]?.toDouble(),
      pressure: json["pressure"],
      humidity: json["humidity"],
      seaLevel: json["sea_level"],
      grndLevel: json["grnd_level"],
    );
  }

  Map<String, dynamic> toJson() => {
    "temp": temp,
    "feels_like": feelsLike,
    "temp_min": tempMin,
    "temp_max": tempMax,
    "pressure": pressure,
    "humidity": humidity,
    "sea_level": seaLevel,
    "grnd_level": grndLevel,
  };
}

class SysModel extends SysEntity {
  const SysModel({
    required super.country,
    required super.sunrise,
    required super.sunset,
  });

  factory SysModel.fromJson(Map<String, dynamic> json) {
    return SysModel(
      country: json["country"],
      sunrise: json["sunrise"],
      sunset: json["sunset"],
    );
  }

  Map<String, dynamic> toJson() => {
    "country": country,
    "sunrise": sunrise,
    "sunset": sunset,
  };
}

class WeatherInfoModel extends WeatherInfoEntity {
  const WeatherInfoModel({
    required super.id,
    required super.main,
    required super.description,
    required super.icon,
  });

  factory WeatherInfoModel.fromJson(Map<String, dynamic> json) {
    return WeatherInfoModel(
      id: json["id"],
      main: json["main"],
      description: json["description"],
      icon: json["icon"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "main": main,
    "description": description,
    "icon": icon,
  };
}

class WindModel extends WindEntity {
  const WindModel({
    required super.speed,
    required super.deg,
    required super.gust,
  });

  factory WindModel.fromJson(Map<String, dynamic> json) {
    return WindModel(
      speed: json["speed"]?.toDouble(),
      deg: json["deg"],
      gust: json["gust"]?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    "speed": speed,
    "deg": deg,
    "gust": gust,
  };
}