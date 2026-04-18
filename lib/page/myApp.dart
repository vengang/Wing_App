import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wingbank/page/home_page.dart';
import 'package:wingbank/page/splash%20_screen.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    //  return GetMaterialApp(   debugShowCheckedModeBanner: false, home: SplashScreen());
    return MaterialApp(
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: _RightToLeftPageTransition(),
            TargetPlatform.iOS: _RightToLeftPageTransition(),
          },
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFa9cb39),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

//custom transition
class _RightToLeftPageTransition extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;

    final tween = Tween<Offset>(
      begin: begin,
      end: end,
    ).chain(CurveTween(curve: Curves.easeInOut));

    return SlideTransition(position: animation.drive(tween), child: child);
  }
}
