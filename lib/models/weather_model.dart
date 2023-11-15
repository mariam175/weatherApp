class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? img;
  final double avgTemp;
  final double maxTemp;
  final double minTemp;
  final String weatherStatus;

  WeatherModel(
      {required this.cityName,
      required this.date,
      this.img,
      required this.avgTemp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStatus});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      img: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        cityName: json['location']['name'],
        date: DateTime.parse(json['current']['last_updated']),
        avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherStatus: json['forecast']['forecastday'][0]['day']['condition']['text']
        );
  }
}
