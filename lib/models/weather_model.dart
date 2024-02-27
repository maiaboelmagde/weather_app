class WeatherModel {
  final String cityName;
  final String date;
  final String condition;
  final String? image;
  final num tempreture;
  final num mintemp;
  final num maxtemp;

  const WeatherModel(
      {required this.cityName,
      required this.date,
      required this.condition,
      required this.tempreture,
      required this.mintemp,
      required this.maxtemp,
      this.image});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        cityName: json['location']['name'],
        date: json['current']['last_updated'],
        condition: json['forecast']['forecastday'][0]['day']['condition']
            ['text'],
        image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        tempreture: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c']);
  }
}
