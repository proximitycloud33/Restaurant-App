import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/services/api_service.dart';
import 'package:restaurant_app/views/restaurant_detail_view.dart';

class RestaurantDetailScreen extends StatelessWidget {
  static const String routeName = '/restaurantDetailScreen';
  final String restaurantId;
  const RestaurantDetailScreen({Key? key, required this.restaurantId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<RestaurantProvider>(
        create: (BuildContext context) =>
            RestaurantProvider.fetchRestaurantDetailData(
                apiService: ApiService(), restaurantId: restaurantId),
        child: const RestaurantDetailView(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/menuSelectionScreen');
        },
        label: const Text('Menu'),
        icon: const Icon(Icons.menu_book_outlined),
      ),
    );
  }
}
