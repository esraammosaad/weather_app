import 'package:flutter/material.dart';
import '../services/weather_get_data.dart';
import '../model/weather_model.dart';

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({super.key});

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  bool isLoading = true;
  Weather? weatherData;

  getWeatherData() async {
    weatherData = await WeatherApi().getDate();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getWeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        backgroundColor: Colors.blue[800],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.only(top: 64.0),
              child: Column(
                children: [
                  Text(
                    weatherData!.location!.name!,
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(weatherData!.location!.localtime!),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //http://cdn.weatherapi.com/weather/64x64/day/122.png
                      Image.network(
                        'http:${weatherData!.current!.condition!.icon}',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          ' ${weatherData!.current!.tempC!.toInt()}',
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Column(
                          children: [
                            Text(
                                'max: ${weatherData!.forecast!.forecastday![0].day!.maxtempC!.toInt()}'),
                            Text(
                                'min: ${weatherData!.forecast!.forecastday![0].day!.mintempC!.toInt()}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    weatherData!.current!.condition!.text!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
