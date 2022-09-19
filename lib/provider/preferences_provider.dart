import 'package:flutter/material.dart';
import 'package:restaurant_app/helper/preferences_helper.dart';
import 'package:restaurant_app/shared/theme.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesHelper preferenceHelper;
  bool _isDarkTheme = false;
  bool _isRestaurantRecommendationSchedulingActive = false;

  PreferencesProvider(this.preferenceHelper) {
    _getTheme();
    _getRestaurantRecommendationScheduling();
  }
  bool get isDarkTheme => _isDarkTheme;
  bool get isRestaurantRecommendationSchedulingActive =>
      _isRestaurantRecommendationSchedulingActive;
  ThemeData get themeData => _isDarkTheme ? darkTheme : lightTheme;

  void _getTheme() async {
    _isDarkTheme = await preferenceHelper.isDarkTheme;
    notifyListeners();
  }

  void _getRestaurantRecommendationScheduling() async {
    _isRestaurantRecommendationSchedulingActive =
        await preferenceHelper.isRestaurantRecommendationSchedulingActive;
    notifyListeners();
  }

  void enableDarkTheme(bool value) {
    preferenceHelper.setDarkTheme(value);
    _getTheme();
  }

  void enableRestaurantRecommendationScheduling(bool value) async {
    preferenceHelper.setRestaurantRecommendationScheduling(value);
    _getRestaurantRecommendationScheduling();
  }
}
