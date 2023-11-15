import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});
  
  @override
  Widget build(BuildContext context) {
    var weather = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(weather!.weatherStatus),
            getThemeColor(weather.weatherStatus)[300]!,
            getThemeColor(weather.weatherStatus)[50]!
          ],
          begin:Alignment.topCenter,
          end:Alignment.bottomCenter
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weather.cityName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Text('Updated at ${weather.date.hour}:${weather.date.minute}'),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network("https:${weather.img}"),
              Text(
                weather.avgTemp.round().toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Column(
                children: [
                  Text(
                    'MaxTemp:${weather.maxTemp.round()}',
                    style: const TextStyle(fontSize: 10),
                  ),
                  Text(
                    'MinTemp:${weather.minTemp.round()}',
                    style: const TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            weather.weatherStatus,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          )
        ],
      ),
    );
  }
}
