import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/model/restaurant_list_model.dart';
import 'package:restaurant_app/model/restaurant_search_model.dart'
    as search_model;
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/shared/theme.dart';
import 'package:restaurant_app/shared/result_state.dart';

class RestaurantGridView extends StatelessWidget {
  final bool searchMode;
  const RestaurantGridView({super.key, required this.searchMode});

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantProvider>(
      builder: (context, value, _) {
        final int itemCountList = value.restaurantList?.restaurants.length ?? 0;
        final int itemCountSearchedList =
            value.restaurantSearch?.restaurants.length ?? 0;

        final List<Restaurant>? restaurantList =
            value.restaurantList?.restaurants;
        final List<search_model.Restaurant>? restaurantSearchedList =
            value.restaurantSearch?.restaurants;

        if (value.state == ResultState.hasData) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                mainAxisExtent: 205,
              ),
              itemCount: searchMode ? itemCountSearchedList : itemCountList,
              itemBuilder: (context, index) {
                List<dynamic> restaurant = [];
                if (searchMode) {
                  restaurant = [...?restaurantSearchedList];
                } else {
                  restaurant = [...?restaurantList];
                }
                final restaurantData = restaurant[index];

                final String restaurantPicture =
                    'https://restaurant-api.dicoding.dev/images/medium/${restaurantData.pictureId}';
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/restaurantDetailHomeScreen',
                      arguments: restaurantData.id,
                    );
                  },
                  child: Hero(
                    tag: restaurantData.id,
                    child: Card(
                      color: MyTheme.colorsScheme(context).surface,
                      clipBehavior: Clip.antiAlias,
                      elevation: 2,
                      child: Column(
                        children: [
                          Image.network(
                            restaurantPicture,
                            fit: BoxFit.cover,
                            height: 100,
                            width: double.maxFinite,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  restaurantData.name,
                                  maxLines: 1,
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
                                    const SizedBox(width: 5),
                                    Text(
                                      restaurantData.city,
                                      style: MyTheme.bodyMedium(
                                        MyTheme.colorsScheme(context)
                                            .onSurfaceVariant,
                                        context,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star_outline_outlined,
                                      size: 15,
                                      color: MyTheme.colorsScheme(context)
                                          .onSurfaceVariant,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      restaurantData.rating.toString(),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (value.state == ResultState.loading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wifi_off_outlined,
                  color: MyTheme.colorsScheme(context).onSurface,
                ),
                Text(
                  'No Internet Connection',
                  style: MyTheme.headlineSmall(
                    MyTheme.colorsScheme(context).onSurface,
                    context,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
