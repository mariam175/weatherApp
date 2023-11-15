import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search a City'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              onSubmitted: (value) {
                BlocProvider.of<GetWeatherCubit>(context)
                    .getWeather(cityName: value);
                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 30, horizontal: 12),
                border: OutlineInputBorder(),
                hintText: 'Enter City Name',
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
                suffixIconColor: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
