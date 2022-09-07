import 'package:flutter/material.dart';
import 'package:restaurant_app/model/menu_list_screen_argument.dart';

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
      // body: MenuList(
      //   restaurant: restaurantArgs.restaurant,
      //   menuType: restaurantArgs.menuType,
      // ),
    );
  }
}
