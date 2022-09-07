import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restraurant_model.dart';
import 'package:restaurant_app/views/restaurant_detail_view.dart';

class RestaurantDetailScreen extends StatelessWidget {
  static const String routeName = '/restaurantDetailScreen';
  final Restaurant restaurant;
  const RestaurantDetailScreen({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RestaurantDetail(restaurant: restaurant),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/menuSelectionScreen',
            arguments: restaurant,
          );
        },
        label: const Text('Menu'),
        icon: const Icon(Icons.menu_book_outlined),
      ),
    );
  }
}
