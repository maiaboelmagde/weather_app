import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class GetApiWeather {
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '9138df662f2d4590a0864329242702';
  final Dio dio;
  const GetApiWeather({required this.dio});

  Future<WeatherModel> getWeatherInfo({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel myWeatherInfo = WeatherModel.fromJson(response.data);
      return myWeatherInfo;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'Oops! there is an error , Try again later';
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Oops! there is an error , Try again later');
    }
  }
}
