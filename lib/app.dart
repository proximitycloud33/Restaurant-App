import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/add_review_screen.dart';
import 'package:restaurant_app/screens/menu_list_screen.dart';
import 'package:restaurant_app/screens/menu_selection_screen.dart';
import 'package:restaurant_app/screens/restaurant_detail_home_screen.dart';
import 'package:restaurant_app/screens/restaurant_detail_screen.dart';
import 'package:restaurant_app/screens/restaurant_home_screen.dart';
import 'package:restaurant_app/screens/restaurant_review_screen.dart';
import 'package:restaurant_app/screens/restaurant_search_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: const Color(0xFF1BB8B8),
      ),
      initialRoute: RestaurantHomeScreen.routeName,
      // initialRoute: RestaurantDetailScreen.routeName,
      routes: {
        RestaurantHomeScreen.routeName: (context) =>
            const RestaurantHomeScreen(),
        RestaurantDetailHomeScreen.routeName: (context) =>
            RestaurantDetailHomeScreen(
              restaurantId:
                  ModalRoute.of(context)?.settings.arguments as String,
            ),
        RestaurantDetailScreen.routeName: (context) =>
            const RestaurantDetailScreen(),
        MenuSelectionScreen.routeName: (context) => MenuSelectionScreen(
              restaurantId:
                  ModalRoute.of(context)?.settings.arguments as String,
            ),
        MenuListScreen.routeName: (context) => const MenuListScreen(),
        RestaurantReviewScreen.routeName: (context) => RestaurantReviewScreen(
              restaurantId:
                  ModalRoute.of(context)?.settings.arguments as String,
            ),
        AddReviewScreen.routeName: (context) => const AddReviewScreen(),
        RestaurantSearchScreen.routeName: (context) =>
            const RestaurantSearchScreen(),
      },
    );
  }
}
