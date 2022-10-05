import 'package:dartz/dartz.dart';
import 'package:flutterclean1/core/error/error.dart';
import 'package:flutterclean1/core/error/failure.dart';
import 'package:flutterclean1/data/datasource/remote_data_source.dart';
import 'package:flutterclean1/domain/entities/Weather.dart';
import 'package:flutterclean1/domain/repository/base_weather_repository.dart';

class WeatherRepository extends BaseWeatherRepository {
  final BaseRemoteDataSource baseRemoteDataSource;
  WeatherRepository({
    required this.baseRemoteDataSource,
  });
  @override
  Future<Either<Failure, Weather>> getWeatherByCityName(String url) async {
    final result = await baseRemoteDataSource.getWeatherCountryByName(url);
    try {
      return Right(result!);
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.errorMessageModel.message));
    }
  }
}
