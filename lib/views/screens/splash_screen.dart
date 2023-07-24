import 'dart:async';

import 'package:flutter/material.dart';

import '../../modals/myRoutes.dart';
import 'check_network_page.dart';

class Splash_Screen_Page extends StatefulWidget {
  const Splash_Screen_Page({Key? key}) : super(key: key);

  @override
  State<Splash_Screen_Page> createState() => _Splash_Screen_PageState();
}

class _Splash_Screen_PageState extends State<Splash_Screen_Page> {
  void MySplash() {
    Timer.periodic(
      const Duration(seconds: 3),
      (tick) {
        Navigator.of(context).pushReplacementNamed(MyRoutes.Check_Network_Page);
        tick.cancel();
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    MySplash();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 400,
          child: Image.asset(
            "assets/images/logo.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
      backgroundColor: Color(0xff0F0E1C),
    );
  }
}
