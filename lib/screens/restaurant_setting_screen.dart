import 'package:flutter/material.dart';
import 'package:restaurant_app/views/restaurant_setting_view.dart';

class RestaurantSettingScreen extends StatelessWidget {
  const RestaurantSettingScreen({super.key});
  static const String routeName = '/restaurantSettingScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const RestaurantSettingView(),
    );
  }
}
