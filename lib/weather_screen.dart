import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app_flutter/additional_info_items.dart';
import 'package:weather_app_flutter/secrets.dart';
import 'hourly_forcast_items.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      String cityName = 'London';
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherApiKey',
        ),
      );
      final data = jsonDecode(res.body);

      if (int.parse(data['cod']) != 200) {
        throw 'An unexpexted error occured';
      }
      return data;
      //data['list'][0]['main']['temp'];
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                print('refresh');
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          final data = snapshot.data!;

          final currentTemp = data['list'][0]['main']['temp'];

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                '$currentTemp K',
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Icon(
                                Icons.cloud,
                                size: 100,
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'Rain',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 50),
                const Text(
                  "Weather Forcast",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      HourlyForcastItem(
                        time: "00:00",
                        temperature: "300K",
                        icon: Icons.cloud,
                      ),
                      HourlyForcastItem(
                        time: "03:00",
                        temperature: "320K",
                        icon: Icons.sunny,
                      ),
                      HourlyForcastItem(
                        time: "06:00",
                        temperature: "250K",
                        icon: Icons.thunderstorm,
                      ),
                      HourlyForcastItem(
                        time: "09:00",
                        temperature: "270K",
                        icon: Icons.thunderstorm,
                      ),
                      HourlyForcastItem(
                        time: "12:00",
                        temperature: "300K",
                        icon: Icons.sunny,
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 50,
                ),

                //additional info
                const Text(
                  "Additional Information",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AdditionalInfoItems(
                      icon: Icons.water_drop,
                      label: "Humidity",
                      value: "91",
                    ),
                    AdditionalInfoItems(
                      icon: Icons.air,
                      label: "Wind Speed",
                      value: "7.5",
                    ),
                    AdditionalInfoItems(
                      icon: Icons.beach_access,
                      label: "Pressure",
                      value: "100",
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
