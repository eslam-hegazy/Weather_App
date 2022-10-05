class Weather {
  final int id;
  final String main;
  final String description;
  final double temp;
  final double temp_min;
  final double temp_max;
  final int pressure;
  final String cityName;
  final double speed;
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.temp,
    required this.temp_min,
    required this.temp_max,
    required this.pressure,
    required this.cityName,
    required this.speed,
  });
}
