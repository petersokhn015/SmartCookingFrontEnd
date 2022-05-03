import 'dart:io';

import 'package:app/Providers/BrowseProvider.dart';
import 'package:app/Providers/FavoritesProvider.dart';
import 'package:app/Providers/HomeProvider.dart';
import 'package:app/Providers/PreferencesProvider.dart';
import 'package:app/Providers/UserProvider.dart';
import 'package:app/Screens/SplashScreen.dart';
import 'package:app/Services/MyHttpOverrides.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeProvider()),
          ChangeNotifierProvider(create: (context) => UserProvider()),
          ChangeNotifierProvider(create: (context) => FavoriteProvider()),
          ChangeNotifierProvider(create: (context) => BrowseProvider()),
          ChangeNotifierProvider(create: (context) => PreferenceProvider())
        ],
        child: MaterialApp(
          title: 'Cooking Panda',
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
