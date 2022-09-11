import 'package:flutter/material.dart';
import 'package:restaurant_app/views/restaurant_review_list_view.dart';

class RestaurantReviewScreen extends StatelessWidget {
  final String restaurantId;
  const RestaurantReviewScreen({super.key, required this.restaurantId});
  static const String routeName = '/restaurantReviewScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: const RestaurantReviewListView(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/addReviewScreen');
        },
        label: Row(
          children: const [
            Icon(Icons.edit_outlined),
            SizedBox(width: 12),
            Text('Add Review'),
          ],
        ),
      ),
    );
  }
}
