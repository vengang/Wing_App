import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wingbank/page/myApp.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const Myapp());
}