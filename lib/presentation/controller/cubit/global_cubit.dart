import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterclean1/core/error/failure.dart';
import 'package:flutterclean1/core/request_state.dart';
import 'package:flutterclean1/data/local_data/cache_helper.dart';
import 'package:flutterclean1/data/models/page_screen_model.dart';
import 'package:flutterclean1/presentation/controller/cubit/global_event.dart';
import 'package:flutterclean1/presentation/controller/cubit/global_state.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../../core/constants.dart';
import '../../../data/datasource/remote_data_source.dart';
import '../../../data/repository/weather_repository.dart';
import '../../../domain/entities/Weather.dart';
import '../../../domain/repository/base_weather_repository.dart';
import '../../../domain/usecases/get_weather_by_country.dart';

class GlobalCubit extends Bloc<GlobalEvent, GlobalState> {
  GlobalCubit() : super(GlobalState()) {
    BaseRemoteDataSource baseRemoteDataSource = RemoteDataSource();
    BaseWeatherRepository baseWeatherRepository =
        WeatherRepository(baseRemoteDataSource: baseRemoteDataSource);
    on<GetWeatherCairoEvent>((event, emit) async {
      final result =
          await GetWeatherByCountryName(repository: baseWeatherRepository)
              .execute(getUrl("Cairo"));
      print(result);
      result.fold(
        (l) => emit(
          GlobalState(requestState: RequestState.error, message: l.message),
        ),
        (r) => emit(
          GlobalState(
              requestState: RequestState.isLoaded,
              getWeatherData: cairoWeather = r),
        ),
      );
    });
    on<GetWeatherAlexandriaEvent>((event, emit) async {
      final result =
          await GetWeatherByCountryName(repository: baseWeatherRepository)
              .execute(getUrl("Alexandria"));
      print(result);
      result.fold(
        (l) => emit(
          GlobalState(requestState: RequestState.error, message: l.message),
        ),
        (r) => emit(
          GlobalState(
              requestState: RequestState.isLoaded,
              getWeatherData: alexWeather = r),
        ),
      );
    });
    on<GetWeatherPortSaidEvent>((event, emit) async {
      final result =
          await GetWeatherByCountryName(repository: baseWeatherRepository)
              .execute(getUrl("Port Said"));
      print(result);
      result.fold(
        (l) => emit(
          GlobalState(requestState: RequestState.error, message: l.message),
        ),
        (r) => emit(
          GlobalState(
              requestState: RequestState.isLoaded,
              getWeatherData: portSaidWeather = r),
        ),
      );
    });
    on<GetWeatherSuezEvent>((event, emit) async {
      final result =
          await GetWeatherByCountryName(repository: baseWeatherRepository)
              .execute(getUrl("Suez"));
      print(result);
      result.fold(
        (l) => emit(
          GlobalState(requestState: RequestState.error, message: l.message),
        ),
        (r) => emit(
          GlobalState(
              requestState: RequestState.isLoaded,
              getWeatherData: suezWeather = r),
        ),
      );
    });
    on<GetWeatherLuxorEvent>((event, emit) async {
      final result =
          await GetWeatherByCountryName(repository: baseWeatherRepository)
              .execute(getUrl("Luxor"));
      print(result);
      result.fold(
        (l) => emit(
          GlobalState(requestState: RequestState.error, message: l.message),
        ),
        (r) => emit(
          GlobalState(
              requestState: RequestState.isLoaded,
              getWeatherData: luxorWeather = r),
        ),
      );
    });
    on<GetWeatherTantaEvent>((event, emit) async {
      final result =
          await GetWeatherByCountryName(repository: baseWeatherRepository)
              .execute(getUrl("Tanta"));
      print(result);
      result.fold(
        (l) => emit(
          GlobalState(requestState: RequestState.error, message: l.message),
        ),
        (r) => emit(
          GlobalState(
              requestState: RequestState.isLoaded,
              getWeatherData: tantaWeather = r),
        ),
      );
    });
    on<GetWeatherAsyutEvent>((event, emit) async {
      final result =
          await GetWeatherByCountryName(repository: baseWeatherRepository)
              .execute(getUrl("Asyut"));
      print(result);
      result.fold(
        (l) => emit(
          GlobalState(requestState: RequestState.error, message: l.message),
        ),
        (r) => emit(
          GlobalState(
              requestState: RequestState.isLoaded,
              getWeatherData: asyutWeather = r),
        ),
      );
    });
  }

  static GlobalCubit get(context) => BlocProvider.of(context);

  Weather? cairoWeather;
  Weather? alexWeather;
  Weather? portSaidWeather;
  Weather? suezWeather;
  Weather? luxorWeather;
  Weather? tantaWeather;
  Weather? asyutWeather;
  Future<AdaptiveThemeMode?> getMode() async {
    return await AdaptiveTheme.getThemeMode();
  }

  Future navigate({VoidCallback? afterSuccess}) async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    afterSuccess!();
  }
}
