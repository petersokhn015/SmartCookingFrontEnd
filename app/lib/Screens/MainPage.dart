import 'package:app/Utils/AppColors.dart';
import 'package:app/Utils/Strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'Camera.dart';
import 'Home.dart';
import 'Profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

bool isDark = false;
IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;

ThemeData _LightTheme =
    ThemeData(primarySwatch: primaryColorTheme, brightness: Brightness.light);

ThemeData _DarkTheme =
    ThemeData(primarySwatch: primaryColorTheme, brightness: Brightness.dark);

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final _pageOptions = [Home(), Camera(), Profile()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDark ? _DarkTheme : _LightTheme,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
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
            title: Image(image: AssetImage(appLogoNoText),height: 80,),
          ),
          body: _pageOptions[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            elevation: 0,
            selectedFontSize: 10,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedItemColor: tertiaryColor,
            selectedIconTheme: IconThemeData(color: secondaryColor, size: 35),
            onTap: _OnItemTapped,
            backgroundColor: primaryColor,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  FeatherIcons.plusCircle,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  FeatherIcons.user,
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _OnItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
