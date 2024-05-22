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
      elevation: 3,
      child: Container(
        width: 120,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              time,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 1,
            ),
            const SizedBox(
              height: 8,
            ),
            Icon(
              icon,
              size: 40,
            ),
            const SizedBox(
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
