import 'package:flutter/material.dart';

ThemeData lightMode =ThemeData(
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade300,
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade100,
    tertiary: Colors.white,
    inversePrimary: Colors.black,
  ),
);

ThemeData darkMode =ThemeData(
  colorScheme: ColorScheme.dark(
      background: Colors.grey.shade900,
      primary: Colors.grey.shade600,
      secondary: Colors.grey.shade800,
      tertiary: Colors.black,
      inversePrimary: Colors.white
  ),
);

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
       themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}

//Theme.of(context).colorScheme.inversePrimary