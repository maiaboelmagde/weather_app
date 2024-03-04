import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/get_weather_api.dart';

class WeatherCubit extends Cubit<WeatherCubitStete> {
  WeatherCubit() : super(WeatherInitialState());

  WeatherModel? weatherModel;

  getWeatherCubit({required String cityName}) async {
    try {
      weatherModel =
          await GetApiWeather(dio: Dio()).getWeatherInfo(cityName: cityName);

      emit(WeatherLoadedState(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
