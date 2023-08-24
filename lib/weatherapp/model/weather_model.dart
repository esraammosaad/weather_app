// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

class Weather {
  final Location? location;
  final Current? current;
  final Forecast? forecast;

  Weather({
    this.location,
    this.current,
    this.forecast,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        current:
            json["current"] == null ? null : Current.fromJson(json["current"]),
        forecast: json["forecast"] == null
            ? null
            : Forecast.fromJson(json["forecast"]),
      );
}

class Current {
  final int? lastUpdatedEpoch;
  final String? lastUpdated;
  final double? tempC;
  final double? tempF;
  final Condition? condition;
  final double? windMph;
  final double? humidity;

  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.condition,
    this.windMph,
    this.humidity,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch: json["last_updated_epoch"],
        lastUpdated: json["last_updated"],
        tempC: json["temp_c"],
        tempF: json["temp_f"]?.toDouble(),
        condition: json["condition"] == null
            ? null
            : Condition.fromJson(json["condition"]),
        windMph: json["wind_mph"]?.toDouble(),
      );
}

class Condition {
  final String? text;
  final String? icon;
  final int? code;

  Condition({
    this.text,
    this.icon,
    this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"],
        icon: json["icon"],
        code: json["code"],
      );
}

class Forecast {
  final List<Forecastday>? forecastday;

  Forecast({
    this.forecastday,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        forecastday: json["forecastday"] == null
            ? []
            : List<Forecastday>.from(
                json["forecastday"]!.map((x) => Forecastday.fromJson(x))),
      );
}

class Forecastday {
  final DateTime? date;
  final int? dateEpoch;
  final Day? day;

  final List<Hour>? hour;

  Forecastday({
    this.date,
    this.dateEpoch,
    this.day,
    this.hour,
  });

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        dateEpoch: json["date_epoch"],
        day: json["day"] == null ? null : Day.fromJson(json["day"]),
        hour: json["hour"] == null
            ? []
            : List<Hour>.from(json["hour"]!.map((x) => Hour.fromJson(x))),
      );
}

class Day {
  final double? maxtempC;
  final double? maxtempF;
  final double? mintempC;
  final double? mintempF;
  final double? avgtempC;
  final double? avgtempF;

  Day({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        maxtempC: json["maxtemp_c"]?.toDouble(),
        maxtempF: json["maxtemp_f"]?.toDouble(),
        mintempC: json["mintemp_c"]?.toDouble(),
        mintempF: json["mintemp_f"]?.toDouble(),
        avgtempC: json["avgtemp_c"]?.toDouble(),
        avgtempF: json["avgtemp_f"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "maxtemp_c": maxtempC,
        "maxtemp_f": maxtempF,
        "mintemp_c": mintempC,
        "mintemp_f": mintempF,
        "avgtemp_c": avgtempC,
        "avgtemp_f": avgtempF,
      };
}

class Hour {
  final int? timeEpoch;
  final String? time;
  final double? tempC;
  final double? tempF;
  final int? isDay;
  final Condition? condition;

  Hour({
    this.timeEpoch,
    this.time,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
  });

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        timeEpoch: json["time_epoch"],
        time: json["time"],
        tempC: json["temp_c"]?.toDouble(),
        tempF: json["temp_f"]?.toDouble(),
        isDay: json["is_day"],
        condition: json["condition"] == null
            ? null
            : Condition.fromJson(json["condition"]),
      );
}

class Location {
  final String? name;
  final String? region;
  final String? country;
  final double? lat;
  final double? lon;
  final String? tzId;
  final int? localtimeEpoch;
  final String? localtime;

  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        tzId: json["tz_id"],
        localtimeEpoch: json["localtime_epoch"],
        localtime: json["localtime"],
      );
}
