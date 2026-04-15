import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wingbank/page/home_page.dart';
import 'package:wingbank/page/splash%20_screen.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    

  //  return GetMaterialApp(   debugShowCheckedModeBanner: false, home: SplashScreen());
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
