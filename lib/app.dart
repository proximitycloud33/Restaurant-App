import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restraurant_model.dart';
import 'package:restaurant_app/screens/menu_list_screen.dart';
import 'package:restaurant_app/screens/menu_selection_screen.dart';
import 'package:restaurant_app/screens/restaurant_detail_screen.dart';
import 'package:restaurant_app/screens/restaurant_home_screen.dart';

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
      routes: {
        RestaurantHomeScreen.routeName: (context) =>
            const RestaurantHomeScreen(),
        RestaurantDetailScreen.routeName: (context) => RestaurantDetailScreen(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            ),
        MenuSelectionScreen.routeName: (context) => MenuSelectionScreen(
            restaurant:
                ModalRoute.of(context)?.settings.arguments as Restaurant),
        MenuListScreen.routeName: (context) => const MenuListScreen(),
      },
    );
  }
}
