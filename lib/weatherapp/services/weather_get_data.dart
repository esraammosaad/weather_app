import 'package:dio/dio.dart';

import '../comp.dart';
import '../model/weather_model.dart';
class WeatherApi{
  String baseUrl='http://api.weatherapi.com/v1';
  Weather ? weatherData;


  getDate()async{

    final Response response= await Dio().get('$baseUrl/forecast.json?key=98d56c7ec26d463895191103232302&q=$cityName&days=1&aqi=no&alerts=no');
    print(response.data);
    final weatherData=Weather.fromJson(response.data);
    print(weatherData.location!.name);

    return weatherData;





  }





}