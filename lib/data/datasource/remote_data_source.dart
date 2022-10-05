import 'package:dio/dio.dart';
import 'package:flutterclean1/core/constants.dart';
import 'package:flutterclean1/core/error/error.dart';
import 'package:flutterclean1/core/error/error_message_model.dart';
import 'package:flutterclean1/data/models/weather_model.dart';

abstract class BaseRemoteDataSource {
  Future<WeatherModel?> getWeatherCountryByName(String cityName);
}

class RemoteDataSource extends BaseRemoteDataSource {
  @override
  Future<WeatherModel?> getWeatherCountryByName(String url) async {
    var response = await Dio().get(url);
    if (response.statusCode == 200) {
      print(response);
      return WeatherModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
