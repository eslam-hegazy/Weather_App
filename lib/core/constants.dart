import 'package:intl/intl.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class AppConstants {
  static const baseUrl = "https://api.openweathermap.org/data/2.5";
  static const apiKey = "f4fc55cf16a35355eb862798217c24fd";
}

String getUrl(String cityName) {
  return '${AppConstants.baseUrl}/weather?q=${cityName}&appid=${AppConstants.apiKey}&lang=${translator.currentLanguage}';
}

String getDateTime() {
  var outputFormat = DateFormat(
      '${DateFormat.jm(translator.currentLanguage).format(DateTime.now())} - ${DateFormat.yMMMMd(translator.currentLanguage).format(DateTime.now())}');
  var outputDate = outputFormat.format(DateTime.now());
  return outputDate;
}

var da = int.parse(DateFormat.Hm().format(DateTime.now()).split(':')[0]);

String getDateOfDay() {
  if (da >= 0 && da <= 4) {
    return 'da1';
  } else if (da > 4 && da <= 11) {
    return 'da2';
  } else if (da > 11 && da <= 14) {
    return 'da3';
  } else if (da > 14 && da <= 17) {
    return 'da4';
  } else if (da > 17 && da <= 20) {
    return 'da5';
  } else {
    return 'da6';
  }
}

String getIconWeather() {
  if (da >= 0 && da <= 4) {
    return 'assets/icons/Dawn.png';
  } else if (da > 4 && da <= 11) {
    return 'assets/icons/sun.png';
  } else if (da > 11 && da <= 14) {
    return 'assets/icons/afternoon.png';
  } else if (da > 14 && da <= 17) {
    return 'assets/icons/night.png';
  } else if (da > 17 && da <= 20) {
    return 'assets/icons/night.png';
  } else {
    return 'assets/icons/night.png';
  }
}

List getImage = [
  'assets/images/cloudy.jpeg',
  'assets/images/night.jpg',
  'assets/images/rainy.jpg',
  'assets/images/sunny.jpg',
  'assets/images/cloudy.jpeg',
  'assets/images/night.jpg',
  'assets/images/rainy.jpg',
];
