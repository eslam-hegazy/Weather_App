import 'package:dartz/dartz.dart';
import 'package:flutterclean1/domain/entities/Weather.dart';
import 'package:flutterclean1/domain/repository/base_weather_repository.dart';

import '../../core/error/failure.dart';

class GetWeatherByCountryName {
  final BaseWeatherRepository repository;
  GetWeatherByCountryName({
    required this.repository,
  });
  Future<Either<Failure, Weather>> execute(String url) async {
    return await repository.getWeatherByCityName(url);
  }
}
