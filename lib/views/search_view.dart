import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/get_weather_api.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
        backgroundColor: const Color(0xff2A9CEE),
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onSubmitted: (value) async {
                var getWeatherCubit = BlocProvider.of<WeatherCubit>(context);
                getWeatherCubit.getWeatherCubit(cityName: value);
                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'type the city',
                suffixIcon: Icon(Icons.search),
                labelText: 'Search',
              ),
            )),
      ),
    );
  }
}
