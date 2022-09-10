import 'package:flutter/material.dart';
import 'package:restaurant_app/model/menu_list_screen_argument.dart';
import 'package:restaurant_app/shared/theme.dart';

class MenuSelectionView extends StatelessWidget {
  final String restaurantId;
  const MenuSelectionView({super.key, required this.restaurantId});

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
                Navigator.pushNamed(
                  context,
                  '/menuListScreen',
                  arguments: MenuListScreenArgument(
                    menuType: 'Foods',
                    restaurantId: restaurantId,
                  ),
                );
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
                Navigator.pushNamed(
                  context,
                  '/menuListScreen',
                  arguments: MenuListScreenArgument(
                    menuType: 'Drinks',
                    restaurantId: restaurantId,
                  ),
                );
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
