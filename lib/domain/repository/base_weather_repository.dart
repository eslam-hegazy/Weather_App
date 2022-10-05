import 'package:dartz/dartz.dart';
import 'package:flutterclean1/domain/entities/Weather.dart';

import '../../core/error/failure.dart';

abstract class BaseWeatherRepository {
  Future<Either<Failure, Weather>> getWeatherByCityName(String url);
}
