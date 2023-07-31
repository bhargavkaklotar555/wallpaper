import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sky_scraper_wallpaper_app/views/screens/check_network_page.dart';
import 'package:sky_scraper_wallpaper_app/views/screens/favrite.dart';
import 'package:sky_scraper_wallpaper_app/views/screens/home_page.dart';
import 'package:sky_scraper_wallpaper_app/views/screens/splash_screen.dart';
import 'package:sky_scraper_wallpaper_app/views/screens/wallpaper_detail_page.dart';
import 'controllers/wallpaper_api_provider.dart';
import 'modals/myRoutes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
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
      initialRoute: MyRoutes.Splash_Screen_Page,
      routes: {
        MyRoutes.Check_Network_Page: (context) => Check_Network_Page(),
        MyRoutes.HomePage: (context) => HomePage(),
        MyRoutes.Splash_Screen_Page: (context) => Splash_Screen_Page(),
        MyRoutes.wallpaper_detail_page: (context) => wallpaper_detail_page(),
        MyRoutes.FavritePage: (context) => FavritePage(),
      },
    );
  }
}
