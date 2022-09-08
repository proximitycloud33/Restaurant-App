import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/views/menu_selection_view.dart';

class MenuSelectionScreen extends StatelessWidget {
  static const String routeName = '/menuSelectionScreen';

  const MenuSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurant = Provider.of<RestaurantProvider>(context, listen: false)
        .restaurantDetail
        ?.restaurant;

    return Scaffold(
      appBar: AppBar(
        title: Text('${restaurant?.name} Menu'),
      ),
      body: const MenuSelectionView(),
    );
  }
}
