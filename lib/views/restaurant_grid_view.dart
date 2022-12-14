import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restraurant_model.dart';
import 'package:restaurant_app/shared/theme.dart';

class RestaurantGrid extends StatelessWidget {
  const RestaurantGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context)
          .loadString('assets/local_restaurant.json'),
      builder: (context, snapshot) {
        final RestaurantList restaurantList =
            parseRestaurantList(snapshot.data);
        List<Restaurant> restaurants = restaurantList.restaurants;
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                mainAxisExtent: 205,
              ),
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                final Restaurant restaurant = restaurants[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/restaurantDetailScreen',
                      arguments: restaurant,
                    );
                  },
                  child: Hero(
                    tag: restaurant.id,
                    child: Card(
                      color: MyTheme.colorsScheme(context).surface,
                      clipBehavior: Clip.antiAlias,
                      elevation: 2,
                      child: Column(
                        children: [
                          Image.network(
                            restaurant.pictureId,
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
                                  restaurant.name,
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
                                      restaurant.city,
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
                                      restaurant.rating.toString(),
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
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else {
          return const Center(
            child: Text('Restaurant not availible at the moment'),
          );
        }
      },
    );
  }
}
