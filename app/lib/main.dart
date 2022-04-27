import 'dart:io';

import 'package:app/Screens/SplashScreen.dart';
import 'package:app/Services/MyHttpOverrides.dart';
import 'package:flutter/material.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cooking Panda',
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
