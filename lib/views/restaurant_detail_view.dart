import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/model/restaurant_detail_model.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/shared/result_state.dart';
import 'package:restaurant_app/widgets/favorite_button.dart';

import '../shared/theme.dart';

class RestaurantDetailView extends StatelessWidget {
  const RestaurantDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantProvider>(
      builder: (context, value, child) {
        final Restaurant? restaurantDetail = value.restaurantDetail?.restaurant;
        final String id = restaurantDetail?.id ?? '';
        final String name = restaurantDetail?.name ?? '';
        List<Category> categories = restaurantDetail?.categories ?? [];
        final String city = restaurantDetail?.city ?? '';
        final String description = restaurantDetail?.description ?? '';
        final String address = restaurantDetail?.address ?? '';
        final String rating = restaurantDetail?.rating.toString() ?? '';
        final String pictureId = restaurantDetail?.pictureId ?? '';
        final String picture =
            'https://restaurant-api.dicoding.dev/images/medium/$pictureId';
        if (value.state == ResultState.hasData) {
          return Hero(
            tag: id,
            child: Material(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          picture,
                          height: 250,
                          width: double.maxFinite,
                          fit: BoxFit.fitWidth,
                        ),
                        Positioned(
                          left: 16,
                          top: 26,
                          child: CircleAvatar(
                            backgroundColor:
                                MyTheme.colorsScheme(context).primaryContainer,
                            child: IconButton(
                              splashColor: Colors.transparent,
                              color: MyTheme.colorsScheme(context).onSurface,
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(Icons.arrow_back),
                            ),
                          ),
                        ),
                        FavoriteButton(
                          id: id,
                          name: name,
                          city: city,
                          picture: picture,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 20),
                      child: Text(
                        name,
                        style: MyTheme.headlineLarge(
                          MyTheme.colorsScheme(context).onBackground,
                          context,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        ...categories.map((category) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              category.name,
                              style: MyTheme.labelSmall(
                                MyTheme.colorsScheme(context).onSurface,
                                context,
                              ),
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 10),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '$address, $city',
                            style: MyTheme.bodyMedium(
                              MyTheme.colorsScheme(context).onSurface,
                              context,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star_outline_outlined,
                            color: MyTheme.colorsScheme(context).onSurface,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            rating,
                            style: MyTheme.bodyMedium(
                              MyTheme.colorsScheme(context).onSurface,
                              context,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, top: 10, right: 8),
                      child: Text(
                        description,
                        style: MyTheme.bodyMedium(
                          MyTheme.colorsScheme(context).onBackground,
                          context,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (value.state == ResultState.loading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
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
