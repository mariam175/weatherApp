import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit(super.initialState);
  WeatherModel? weatherModel;
  getWeather({required cityName}) async {
    try {
      // ignore: unused_local_variable
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(GetWeatherSuccess());
    } catch (e) {
      emit(FailuareWeather());
    }
  }
}
