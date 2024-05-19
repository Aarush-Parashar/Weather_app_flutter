import 'package:flutter/material.dart';

class HourlyForcastItem extends StatelessWidget {
  final temperature;
  final time;
  final IconData icon;
  const HourlyForcastItem(
      {super.key, this.temperature, this.time, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 120,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              time,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            Icon(
              icon,
              size: 40,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              temperature,
            ),
          ],
        ),
      ),
    );
  }
}
