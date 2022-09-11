import 'package:flutter/material.dart';
import 'package:restaurant_app/views/restaurant_detail_view.dart';

class RestaurantDetailScreen extends StatelessWidget {
  static const String routeName = '/restaurantDetailScreen';

  const RestaurantDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RestaurantDetailView(),
    );
  }
}
