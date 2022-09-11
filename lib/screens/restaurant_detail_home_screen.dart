import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/screens/menu_selection_screen.dart';
import 'package:restaurant_app/screens/restaurant_detail_screen.dart';
import 'package:restaurant_app/screens/restaurant_review_screen.dart';
import 'package:restaurant_app/services/api_service.dart';
import 'package:restaurant_app/widgets/bottom_navigation_bar.dart';

class RestaurantDetailHomeScreen extends StatefulWidget {
  static const String routeName = '/restaurantDetailHomeScreen';
  final String restaurantId;
  const RestaurantDetailHomeScreen({Key? key, required this.restaurantId})
      : super(key: key);

  @override
  State<RestaurantDetailHomeScreen> createState() =>
      _RestaurantDetailHomeScreenState();
}

class _RestaurantDetailHomeScreenState
    extends State<RestaurantDetailHomeScreen> {
  int _tabSelected = 0;

  void _onDestinationSelected(int index) {
    setState(() {
      _tabSelected = index;
    });
  }

  late final List<Widget> _listWidget = [
    ChangeNotifierProvider<RestaurantProvider>(
      create: (context) => RestaurantProvider.fetchRestaurantDetailData(
          ApiService(), widget.restaurantId),
      child: const RestaurantDetailScreen(),
    ),
    ChangeNotifierProvider<RestaurantProvider>(
      create: (context) => RestaurantProvider.fetchRestaurantDetailData(
          ApiService(), widget.restaurantId),
      child: MenuSelectionScreen(restaurantId: widget.restaurantId),
    ),
    ChangeNotifierProvider<RestaurantProvider>(
      create: (context) => RestaurantProvider.fetchRestaurantDetailData(
          ApiService(), widget.restaurantId),
      child: RestaurantReviewScreen(restaurantId: widget.restaurantId),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_tabSelected],
      bottomNavigationBar: RestaurantAppNavigationBar(
        tabSelected: _tabSelected,
        onDestinationSelected: _onDestinationSelected,
      ),
    );
  }
}
