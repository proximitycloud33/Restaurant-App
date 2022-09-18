import 'package:flutter/material.dart';
import 'package:restaurant_app/helper/preferences_helper.dart';
import 'package:restaurant_app/shared/theme.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesHelper preferenceHelper;
  bool _isDarkTheme = false;

  PreferencesProvider(this.preferenceHelper) {
    _getTheme();
  }
  bool get isDarkTheme => _isDarkTheme;
  ThemeData get themeData => _isDarkTheme ? darkTheme : lightTheme;

  void _getTheme() async {
    _isDarkTheme = await preferenceHelper.isDarkTheme;
    notifyListeners();
  }

  void enableDarkTheme(bool value) {
    preferenceHelper.setDarkTheme(value);
    _getTheme();
  }
}
