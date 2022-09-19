import 'package:flutter/material.dart';

class RestaurantAppNavigationBar extends StatelessWidget {
  final int tabSelected;
  final void Function(int index) onDestinationSelected;

  const RestaurantAppNavigationBar({
    Key? key,
    required this.tabSelected,
    required this.onDestinationSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
      child: NavigationBar(
          onDestinationSelected: onDestinationSelected,
          selectedIndex: tabSelected,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.storefront_outlined),
              label: 'Restaurant',
            ),
            NavigationDestination(
              icon: Icon(Icons.menu_book_outlined),
              label: 'Menu',
            ),
            NavigationDestination(
              icon: Icon(Icons.reviews_outlined),
              label: 'Review',
            ),
          ]),
    );
  }
}
