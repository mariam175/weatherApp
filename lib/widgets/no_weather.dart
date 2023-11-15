import 'package:flutter/material.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'There is no weather 😔 start',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            'Searching now 🔍',
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
