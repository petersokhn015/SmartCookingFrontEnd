import 'package:flutter/material.dart';

const font_Pacifico = "Pacifico";
const primaryColor = Color(0XFFDA1744);

const secondaryColor = Color(0xFFEEEEEE);
const tertiaryColor = Color(0xFF000000);

MaterialColor primaryColorTheme = MaterialColor(0XFFDA1744, <int, Color>{
  50: const Color(0XFFDA1744),
  100: const Color(0XFFDA1744),
  200: const Color(0XFFDA1744),
  300: const Color(0XFFDA1744),
  400: const Color(0XFFDA1744),
  500: const Color(0XFFDA1744),
  600: const Color(0XFFDA1744),
  700: const Color(0XFFDA1744),
  800: const Color(0XFFDA1744),
  900: const Color(0XFFDA1744),
});

MaterialColor secondaryColorTheme = MaterialColor(0xFFEEEEEE, <int, Color>{
  50: const Color(0xFFEEEEEE),
  100: const Color(0xFFEEEEEE),
  200: const Color(0xFFEEEEEE),
  300: const Color(0xFFEEEEEE),
  400: const Color(0xFFEEEEEE),
  500: const Color(0xFFEEEEEE),
  600: const Color(0xFFEEEEEE),
  700: const Color(0xFFEEEEEE),
  800: const Color(0xFFEEEEEE),
  900: const Color(0xFFEEEEEE),
});

MaterialColor tertiaryColorTheme = MaterialColor(0xFF000000, <int, Color>{
  50: const Color(0xFF000000),
  100: const Color(0xFF000000),
  200: const Color(0xFF000000),
  300: const Color(0xFF000000),
  400: const Color(0xFF000000),
  500: const Color(0xFF000000),
  600: const Color(0xFF000000),
  700: const Color(0xFF000000),
  800: const Color(0xFF000000),
  900: const Color(0xFF000000),
});

Color changeBackgroundColor(BuildContext context) {
  return (Theme.of(context).brightness == Brightness.dark
      ? Color(0xFF4F4F4F)
      : Color(0xFFF7F7F7));
}

Color changeTextColor(BuildContext context) {
  return (Theme.of(context).brightness == Brightness.dark
      ? secondaryColor
      : primaryColor);
}
