import 'package:flutter/material.dart';
import 'package:movie_app/core/services/services_locator.dart';
import 'core/utils/app_string.dart';
import 'movies/presentation/screes/movies_screen.dart';

void main() {
  ServiceLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900
      ),
      home: const MainMoviesScreen(),
    );
  }
}

