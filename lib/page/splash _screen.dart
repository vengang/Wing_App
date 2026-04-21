import 'package:flutter/material.dart';
import 'package:wingbank/models/IconPicture.dart';
import 'package:wingbank/page/home_page.dart';
import 'package:wingbank/page/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset(AppImages.splashscreen, fit: BoxFit.cover),
      ),
    );
  }
}
