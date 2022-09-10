import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/add_review_screen.dart';
import 'package:restaurant_app/screens/menu_list_screen.dart';
import 'package:restaurant_app/screens/menu_selection_screen.dart';
import 'package:restaurant_app/screens/restaurant_detail_screen.dart';
import 'package:restaurant_app/screens/restaurant_home_screen.dart';
import 'package:restaurant_app/screens/restaurant_review_screen.dart';
import 'package:restaurant_app/screens/search_screen.dart';

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
        RestaurantDetailScreen.routeName: (context) => RestaurantDetailScreen(
              restaurantId:
                  ModalRoute.of(context)?.settings.arguments as String,
            ),
        MenuSelectionScreen.routeName: (context) => MenuSelectionScreen(
              restaurantId:
                  ModalRoute.of(context)?.settings.arguments as String,
            ),
        MenuListScreen.routeName: (context) => const MenuListScreen(),
        RestaurantReviewScreen.routeName: (context) =>
            const RestaurantReviewScreen(),
        AddReviewScreen.routeName: (context) => const AddReviewScreen(),
        SearchScreen.routeName: (context) => const SearchScreen(),
      },
    );
  }
}
