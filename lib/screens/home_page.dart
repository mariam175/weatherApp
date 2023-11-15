import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/screens/search.dart';
// ignore: unused_import
import 'package:weather_app/widgets/no_weather.dart';
import 'package:weather_app/widgets/weather_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SearchPage(),
                ));
              },
              icon: const Icon(Icons.search)),
        ],
        title: const Text('WeatherApp'),
        centerTitle: true,
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is WeatherIntialState) {
            return const NoWeather();
          }
          if (state is GetWeatherSuccess) {
            // ignore: prefer_const_constructors
            return WeatherInfo();
          } else {
            return const Center(
              child: Text('OOPS There was an error...Try again',
              ),
            );
          }
        },
      ),
    );
  }
}
