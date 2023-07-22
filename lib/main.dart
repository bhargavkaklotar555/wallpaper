import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scraper_wallpaper_app/views/screens/home_page.dart';
import 'controllers/wallpaper_api_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => APIControllers(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
