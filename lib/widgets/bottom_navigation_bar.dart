import 'package:flutter/material.dart';

class RestaurantAppNavigationBar extends StatelessWidget {
  final int tabSelected;

  const RestaurantAppNavigationBar({
    Key? key,
    required this.tabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationBar(destinations: const [
      NavigationDestination(
          icon: Icon(Icons.storefront_outlined), label: 'Restaurant'),
      NavigationDestination(
          icon: Icon(Icons.menu_book_outlined), label: 'Menu'),
      NavigationDestination(
          icon: Icon(Icons.reviews_outlined), label: 'Review'),
    ]);
  }
}
