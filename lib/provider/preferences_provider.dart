import 'package:flutter/material.dart';
import 'package:restaurant_app/helper/preferences_helper.dart';
import 'package:restaurant_app/shared/theme.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesHelper preferenceHelper;
  bool _isDarkTheme = false;
  bool _isRestaurantRecommendationSchedullingActive = false;

  PreferencesProvider(this.preferenceHelper) {
    _getTheme();
    _getRestaurantRecommendationSchedulling();
  }
  bool get isDarkTheme => _isDarkTheme;
  bool get isRestaurantRecommendationSchedullingActive =>
      _isRestaurantRecommendationSchedullingActive;
  ThemeData get themeData => _isDarkTheme ? darkTheme : lightTheme;

  void _getTheme() async {
    _isDarkTheme = await preferenceHelper.isDarkTheme;
    notifyListeners();
  }

  void _getRestaurantRecommendationSchedulling() async {
    _isRestaurantRecommendationSchedullingActive =
        await preferenceHelper.isRestaurantRecommendationSchedullingActive;
    notifyListeners();
  }

  void enableDarkTheme(bool value) {
    preferenceHelper.setDarkTheme(value);
    _getTheme();
  }

  void enableRestaurantRecommendationSchedulling(bool value) async {
    preferenceHelper.setRestaurantRecommendationSchedulling(value);
    _getRestaurantRecommendationSchedulling();
  }
}
