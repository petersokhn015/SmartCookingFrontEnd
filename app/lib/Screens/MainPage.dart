import 'package:app/Utils/AppColors.dart';
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

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final _pageOptions = [Home(), Camera(), Profile()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
    );
  }

  void _OnItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
