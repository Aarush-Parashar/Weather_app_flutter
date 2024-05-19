import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app_flutter/additional_info_items.dart';
import 'hourly_forcast_items.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

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
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Padding(
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
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            'temperature kelvin',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Icon(
                            Icons.cloud,
                            size: 100,
                          ),
                          SizedBox(height: 20),
                          Text(
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
      ),
    );
  }
}
