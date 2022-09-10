import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/services/api_service.dart';
import 'package:restaurant_app/views/restaurant_detail_view.dart';

class RestaurantDetailScreen extends StatefulWidget {
  static const String routeName = '/restaurantDetailScreen';
  final String restaurantId;
  const RestaurantDetailScreen({Key? key, required this.restaurantId})
      : super(key: key);

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  // final List<Widget> _listWidget = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<RestaurantProvider>(
        create: (BuildContext context) =>
            RestaurantProvider.fetchRestaurantDetailData(
                apiService: ApiService(), restaurantId: widget.restaurantId),
        child: const RestaurantDetailView(),
      ),
      floatingActionButton: FloatingActionButton.large(
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/menuSelectionScreen',
              arguments: widget.restaurantId,
            );
          },
          child: const Text('Menu')),
    );
  }
}
