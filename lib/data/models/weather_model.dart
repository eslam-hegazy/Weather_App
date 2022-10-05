import 'package:flutterclean1/domain/entities/Weather.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required super.id,
    required super.main,
    required super.description,
    required super.temp,
    required super.temp_min,
    required super.temp_max,
    required super.pressure,
    required super.cityName,
    required super.speed,
  });
  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        id: json['id'],
        main: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        temp: json['main']['temp'],
        temp_min: json['main']['temp_min'],
        temp_max: json['main']['temp_max'],
        pressure: json['main']['pressure'],
        cityName: json['name'],
        speed: json['wind']['speed'],
      );
}
