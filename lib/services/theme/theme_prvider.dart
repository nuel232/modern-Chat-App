import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modern_chat_app/services/theme/dark_mode.dart';
import 'package:modern_chat_app/services/theme/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  //initially start with light
  ThemeData _themeData = darkMode;

  //getter to get the current theme
  ThemeData get themeData => _themeData;

  //to get if it is darkMode or not
  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void ToggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
