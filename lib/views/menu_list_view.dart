import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/shared/theme.dart';

class MenuListView extends StatelessWidget {
  final String menuType;
  const MenuListView({super.key, required this.menuType});

  @override
  Widget build(BuildContext context) {
    final menus = Provider.of<RestaurantProvider>(context)
        .restaurantDetail
        ?.restaurant
        .menus;

    List<String>? menuList = [];

    if (menuType == 'Foods') {
      menuList = menus?.foods.map((e) => e.name).toList();
    } else if (menuType == 'Drinks') {
      menuList = menus?.drinks.map((e) => e.name).toList();
    }
    return ListView.separated(
      itemCount: menuList?.length ?? 0,
      itemBuilder: (context, index) {
        final name = menuList?[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: MyTheme.colorsScheme(context).primary,
              foregroundColor: MyTheme.colorsScheme(context).onPrimary,
              child: Text('${index + 1}'),
            ),
            title: Text(
              name ?? '',
              style: MyTheme.titleMedium(
                MyTheme.colorsScheme(context).onBackground,
                context,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Divider(),
        );
      },
    );
  }
}
