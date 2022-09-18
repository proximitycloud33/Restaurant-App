import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant_detail_model.dart';
import 'package:restaurant_app/views/restaurant_detail_view.dart';

class RestaurantDetailScreen extends StatelessWidget {
  static const String routeName = '/restaurantDetailScreen';
  final RestaurantDetail? detailData;

  const RestaurantDetailScreen({super.key, this.detailData});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RestaurantDetailView(),
    );
  }
}
