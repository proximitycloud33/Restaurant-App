import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/model/menu_list_screen_argument.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/services/api_service.dart';
import 'package:restaurant_app/views/menu_list_view.dart';

class MenuListScreen extends StatelessWidget {
  static const String routeName = '/menuListScreen';

  const MenuListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final restaurantArgs =
        ModalRoute.of(context)?.settings.arguments as MenuListScreenArgument;
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurantArgs.menuType),
      ),
      body: ChangeNotifierProvider<RestaurantProvider>(
        create: (context) => RestaurantProvider.fetchRestaurantDetailData(
          ApiService(),
          restaurantArgs.restaurantId,
        ),
        child: MenuListView(menuType: restaurantArgs.menuType),
      ),
    );
  }
}
