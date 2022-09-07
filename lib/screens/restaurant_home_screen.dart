import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/restaurant_list_provider.dart';
import 'package:restaurant_app/services/api_service.dart';
import 'package:restaurant_app/views/restaurant_grid_view.dart';

class RestaurantHomeScreen extends StatelessWidget {
  const RestaurantHomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/restaurantHomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant App'),
      ),
      body: ChangeNotifierProvider<RestaurantListProvider>(
        create: (BuildContext context) =>
            RestaurantListProvider(apiService: ApiService()),
        child: const RestaurantGrid(),
      ),
    );
  }
}
