import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static const String darkThemeKey = 'DARK_THEME';
  static const String restaurantRecommendationSchedullingKey =
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

  void setRestaurantRecommendationSchedulling(bool value) async {
    final preferences = await sharedPreferences;
    preferences.setBool(restaurantRecommendationSchedullingKey, value);
  }

  Future<bool> get isRestaurantRecommendationSchedullingActive async {
    final preferences = await sharedPreferences;
    return preferences.getBool(restaurantRecommendationSchedullingKey) ?? false;
  }
}
