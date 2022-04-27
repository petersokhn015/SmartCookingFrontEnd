import 'package:app/Utils/AppColors.dart';
import 'package:flutter/material.dart';

class ApplicationBar extends StatefulWidget {
  const ApplicationBar({Key? key}) : super(key: key);

  @override
  State<ApplicationBar> createState() => _ApplicationBarState();
}

class _ApplicationBarState extends State<ApplicationBar> {
  bool isDark = false;
  IconData _iconLight = Icons.wb_sunny;
  IconData _iconDark = Icons.nights_stay;

  ThemeData _LightTheme =
      ThemeData(primarySwatch: primaryColorTheme, brightness: Brightness.light);

  ThemeData _DarkTheme =
      ThemeData(primarySwatch: primaryColorTheme, brightness: Brightness.dark);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: primaryColor,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isDark = !isDark;
                });
              },
              icon: Icon(isDark ? _iconDark : _iconLight)),
        ],
        centerTitle: true,
        title: Text(
          "Whatever",
          style: TextStyle(
              color: secondaryColor, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ));
  }
}
