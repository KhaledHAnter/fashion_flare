class WeatherModel {
  final String cityName;
  final DateTime date;
  final double temp;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.temp,
  });

  factory WeatherModel.formJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['current']['temp_c'],
    );
  }
}
