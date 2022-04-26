import 'package:app/Screens/Browse.dart';
import 'package:app/Screens/Camera.dart';
import 'package:app/Utils/AppColors.dart';
import 'package:app/Utils/Strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Browse.dart';
import 'Home.dart';
import 'Profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

bool isDark = false;
bool isLoggedIn = true;
IconData _iconLight = Icons.light_mode;
IconData _iconDark = Icons.dark_mode;

ThemeData _LightTheme =
    ThemeData(primarySwatch: primaryColorTheme, brightness: Brightness.light);

ThemeData _DarkTheme =
    ThemeData(primarySwatch: primaryColorTheme, brightness: Brightness.dark);

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final _pageOptions = [Home(), Camera(), Profile()];

  SharedPreferences? prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePreference().whenComplete(() {
      setState(() {});
    });
  }

  Future<void> initializePreference() async {
    prefs = await SharedPreferences.getInstance();
    isDark = await prefs!.getBool(prefs_DarkMode)!;
    isLoggedIn = await prefs!.getBool(prefs_isLoggedIn)!;
  }


  @override
  Widget build(BuildContext context) {
    if (isLoggedIn == true) {
      return MaterialApp(
        theme: isDark ? _DarkTheme : _LightTheme,
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor,
              actions: [
                IconButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      setState(() {
                        isDark = !isDark;
                      });
                      prefs.setBool(prefs_DarkMode, isDark);
                    },
                    icon: Icon(isDark ? _iconDark : _iconLight)),
              ],
              centerTitle: true,
              title: Image(
                image: AssetImage(appLogoNoText),
                height: 80,
              ),
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
                    Icons.camera
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
    } else {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: primaryColor,
          centerTitle: true,
          title: Image(
            image: AssetImage(appLogoNoText),
            height: 80,
          ),
        ),
        body: Camera(),
      );
    }
  }

  void _OnItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
