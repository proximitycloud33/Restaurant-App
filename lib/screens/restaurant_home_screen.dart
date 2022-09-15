import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
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
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            tooltip: 'Search',
            onPressed: () {
              Navigator.pushNamed(context, '/searchScreen');
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            tooltip: 'Favorite',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: 'Settings',
            onPressed: () {},
          ),
        ],
      ),
      body: ChangeNotifierProvider<RestaurantProvider>(
        create: (BuildContext context) =>
            RestaurantProvider.fetchRestaurantListData(ApiService()),
        child: const RestaurantGridView(searchMode: false),
      ),
    );
  }
}
