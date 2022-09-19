import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/views/restaurant_review_list_view.dart';

class RestaurantReviewScreen extends StatelessWidget {
  static const String routeName = '/restaurantReviewScreen';
  final String restaurantId;
  const RestaurantReviewScreen({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add',
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/addReviewScreen',
                arguments: restaurantId,
              ).then(
                (value) =>
                    Provider.of<RestaurantProvider>(context, listen: false)
                        .fetchRestaurantDetailData(restaurantId),
              );
            },
          ),
        ],
      ),
      body: const RestaurantReviewListView(),
    );
  }
}
