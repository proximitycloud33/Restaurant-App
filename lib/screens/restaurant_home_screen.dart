import 'package:flutter/material.dart';
import 'package:restaurant_app/views/restaurant_grid_view.dart';

class RestaurantHomeScreen extends StatefulWidget {
  const RestaurantHomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/restaurantHomeScreen';

  @override
  State<RestaurantHomeScreen> createState() => _RestaurantHomeScreenState();
}

class _RestaurantHomeScreenState extends State<RestaurantHomeScreen> {
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
              Navigator.pushNamed(context, '/restaurantSearchScreen');
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            tooltip: 'Favorites',
            onPressed: () {
              Navigator.pushNamed(context, '/restaurantFavoriteScreen');
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: 'Settings',
            onPressed: () {
              Navigator.pushNamed(context, '/restaurantSettingScreen')
                  .then((value) => setState(() {
                        print('update');
                      }));
            },
          ),
        ],
      ),
      body: const RestaurantGridView(searchMode: false),
    );
  }
}
