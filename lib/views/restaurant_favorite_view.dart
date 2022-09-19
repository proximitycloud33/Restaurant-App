import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:restaurant_app/provider/database_provider.dart';
import 'package:restaurant_app/shared/result_state.dart';
import 'package:restaurant_app/shared/theme.dart';

class RestaurantFavoriteView extends StatelessWidget {
  const RestaurantFavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, value, child) {
        if (value.state == ResultState.hasData) {
          return ListView.separated(
            itemCount: value.favorites.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/restaurantDetailHomeScreen',
                    arguments: value.favorites[index].id,
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minHeight: 100,
                    ),
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            child: Image.memory(
                              value.favorites[index].picture,
                              fit: BoxFit.cover,
                              height: 100,
                              width: 100,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  value.favorites[index].name,
                                  style: MyTheme.bodyLarge(
                                    MyTheme.colorsScheme(context).onSurface,
                                    context,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 15,
                                      color: MyTheme.colorsScheme(context)
                                          .onSurfaceVariant,
                                    ),
                                    Text(
                                      value.favorites[index].city,
                                      style: MyTheme.bodyMedium(
                                        MyTheme.colorsScheme(context)
                                            .onSurfaceVariant,
                                        context,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 20);
            },
          );
        } else {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('All your favorite restaurant, in one place.'),
                  Text(
                      'Simply tap the heart icon in restaurant page you would like'),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
