import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  Dio dio;
  final baseUrl = 'https://api.weatherapi.com/v1';
  final apiKey = '89d077057bf64268bd8172916230311';
  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final messageError = e.response?.data['error']['message'] ??
          'OOPS there was an error try again';
      throw Exception(messageError);
    } catch (e) {
      throw Exception('Try again later');
    }
  }
}
