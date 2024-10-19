import 'dart:developer';

import 'package:dio/dio.dart';
import '../../Features/Home/data/models/weather_model.dart';

class WeatherService {
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '3024ceae237647a6b5724518243006';
  final Dio dio;
  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get("$baseUrl/current.json?key=$apiKey&q=$cityName");

      WeatherModel weatherModel = WeatherModel.formJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      String errMessage =
          'Opps, there was an error, try again later ${e.message}';
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Opps, there was an error, try again later');
    }
  }
}
