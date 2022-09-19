import 'package:flutter/material.dart';
import 'package:restaurant_app/views/restaurant_favorite_view.dart';

class RestaurantFavoriteScreen extends StatelessWidget {
  static const String routeName = '/restaurantFavoriteScreen';
  const RestaurantFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: const RestaurantFavoriteView(),
    );
  }
}
