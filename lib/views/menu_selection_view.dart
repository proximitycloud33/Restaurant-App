import 'package:flutter/material.dart';
import 'package:restaurant_app/model/menu_list_screen_argument.dart';
import 'package:restaurant_app/model/restraurant_model.dart';
import 'package:restaurant_app/shared/theme.dart';

class MenuSelection extends StatelessWidget {
  final Restaurant restaurant;
  const MenuSelection({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: double.maxFinite,
              minHeight: 100,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/menuListScreen',
                    arguments: MenuListScreenArgument(
                      menuType: 'foods',
                      restaurant: restaurant,
                    ));
              },
              child: Card(
                elevation: 2,
                child: Container(
                  margin: const EdgeInsets.only(left: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: MyTheme.colorsScheme(context).primary,
                        foregroundColor:
                            MyTheme.colorsScheme(context).onPrimary,
                        child: const Icon(Icons.dinner_dining_outlined),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        'Foods',
                        style: MyTheme.titleMedium(
                          MyTheme.colorsScheme(context).onSurface,
                          context,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: double.maxFinite,
              minHeight: 100,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/menuListScreen',
                    arguments: MenuListScreenArgument(
                      menuType: 'drinks',
                      restaurant: restaurant,
                    ));
              },
              child: Card(
                elevation: 2,
                child: Container(
                  margin: const EdgeInsets.only(left: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: MyTheme.colorsScheme(context).primary,
                        foregroundColor:
                            MyTheme.colorsScheme(context).onPrimary,
                        child: const Icon(Icons.wine_bar_outlined),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        'Drinks',
                        style: MyTheme.titleMedium(
                          MyTheme.colorsScheme(context).onSurface,
                          context,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
