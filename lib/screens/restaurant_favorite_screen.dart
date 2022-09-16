import 'package:flutter/material.dart';
import 'package:restaurant_app/views/restaurant_favorite_view.dart';

class RestaurantFavoriteScreen extends StatelessWidget {
  const RestaurantFavoriteScreen({super.key});
  static const String routeName = '/restaurantFavoriteScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
      ),
      body: const RestaurantFavoriteView(),
    );
  }
}
