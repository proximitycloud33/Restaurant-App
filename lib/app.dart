import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/helper/preferences_helper.dart';
import 'package:restaurant_app/model/restaurant_detail_model.dart';
import 'package:restaurant_app/provider/preferences_provider.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/provider/scheduling_provider.dart';
import 'package:restaurant_app/screens/screen.dart';
import 'package:restaurant_app/services/api_service.dart';
import 'package:restaurant_app/shared/global_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PreferencesProvider(
            PreferencesHelper(
              SharedPreferences.getInstance(),
            ),
          ),
        ),
        ChangeNotifierProvider(create: (context) => SchedulingProvider()),
        ChangeNotifierProvider(
          create: (context) =>
              RestaurantProvider.fetchRestaurantListData(ApiService()),
        ),
      ],
      child: Consumer<PreferencesProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: value.themeData,
            initialRoute: RestaurantHomeScreen.routeName,
            navigatorKey: navigatorKey,
            routes: {
              RestaurantHomeScreen.routeName: (context) =>
                  const RestaurantHomeScreen(),
              RestaurantDetailHomeScreen.routeName: (context) =>
                  RestaurantDetailHomeScreen(
                    restaurantId:
                        ModalRoute.of(context)?.settings.arguments as String,
                  ),
              RestaurantDetailScreen.routeName: (context) =>
                  RestaurantDetailScreen(
                    detailData: ModalRoute.of(context)?.settings.arguments
                        as RestaurantDetail,
                  ),
              MenuSelectionScreen.routeName: (context) => MenuSelectionScreen(
                    restaurantId:
                        ModalRoute.of(context)?.settings.arguments as String,
                  ),
              MenuListScreen.routeName: (context) => const MenuListScreen(),
              RestaurantReviewScreen.routeName: (context) =>
                  RestaurantReviewScreen(
                    restaurantId:
                        ModalRoute.of(context)?.settings.arguments as String,
                  ),
              AddReviewScreen.routeName: (context) => AddReviewScreen(
                    restaurantId:
                        ModalRoute.of(context)?.settings.arguments as String,
                  ),
              RestaurantSearchScreen.routeName: (context) =>
                  const RestaurantSearchScreen(),
              RestaurantFavoriteScreen.routeName: (context) =>
                  const RestaurantFavoriteScreen(),
              RestaurantSettingScreen.routeName: (context) =>
                  const RestaurantSettingScreen(),
            },
          );
        },
      ),
    );
  }
}
