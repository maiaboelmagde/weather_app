import 'package:weather_app/models/weather_model.dart';

class WeatherCubitStete {}

class WeatherInitialState extends WeatherCubitStete {}

class WeatherLoadedState extends WeatherCubitStete {
  WeatherModel weatherModel;
  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherCubitStete {}
