import 'package:flutter/material.dart';
import 'package:weather_app/weatherapp/screens/weatherscreen.dart';
import '../comp.dart';


class WeatherSearch extends StatefulWidget {
  const WeatherSearch({super.key});

  @override
  State<WeatherSearch> createState() => _WeatherSearchState();
}

class _WeatherSearchState extends State<WeatherSearch> {
  var cityController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Weather',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Form(
                key: formKey,
                child: TextFormField(
                  validator: (value) {
                    setState(() {});

                    if (value!.isEmpty) {
                      return 'Please Enter the name of the city';
                    }
                    return null;
                  },
                  controller: cityController,
                  onFieldSubmitted: (value){
                    cityName=value;
                  },
                  onChanged: (value){
                    cityName=value;

                  },
                  decoration: InputDecoration(
                    hintText: 'Search for a city',
                    label: const Text('Search'),
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              Center(
                child: MaterialButton(
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForecastScreen()));
                    }
                  },
                  color: Colors.blue,
                  child: const Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
