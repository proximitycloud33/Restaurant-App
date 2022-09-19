import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static const String darkThemeKey = 'DARK_THEME';
  static const String restaurantRecommendationSchedulingKey =
      'RESTAURANT_RECOMMENDATION';
  final Future<SharedPreferences> sharedPreferences;
  PreferencesHelper(this.sharedPreferences);

  void setDarkTheme(bool value) async {
    final preferences = await sharedPreferences;
    preferences.setBool(darkThemeKey, value);
  }

  Future<bool> get isDarkTheme async {
    final preferences = await sharedPreferences;
    return preferences.getBool(darkThemeKey) ?? false;
  }

  void setRestaurantRecommendationScheduling(bool value) async {
    final preferences = await sharedPreferences;
    preferences.setBool(restaurantRecommendationSchedulingKey, value);
  }

  Future<bool> get isRestaurantRecommendationSchedulingActive async {
    final preferences = await sharedPreferences;
    return preferences.getBool(restaurantRecommendationSchedulingKey) ?? false;
  }
}
