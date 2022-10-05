import 'package:flutterclean1/core/request_state.dart';
import 'package:flutterclean1/domain/entities/Weather.dart';

class GlobalState {
  final Weather? getWeatherData;
  final RequestState requestState;
  final String message;

  GlobalState({
    this.getWeatherData,
    this.requestState = RequestState.isLoading,
    this.message = "",
  });
}
