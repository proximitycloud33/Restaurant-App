import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/model/restaurant_detail_model.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';

import '../shared/theme.dart';

class RestaurantDetailView extends StatelessWidget {
  const RestaurantDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantProvider>(
      builder: (context, value, child) {
        final RestaurantDetail? restaurantDetail = value.restaurantDetail;
        final String restaurantPicture =
            'https://restaurant-api.dicoding.dev/images/medium/${restaurantDetail?.restaurant.pictureId}';
        if (value.state == ResultState.hasData) {
          return Hero(
            tag: restaurantDetail!.restaurant.id,
            child: Material(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          restaurantPicture,
                          height: 250,
                          width: double.maxFinite,
                          fit: BoxFit.fitWidth,
                        ),
                        Positioned(
                          left: 16,
                          top: 36,
                          child: CircleAvatar(
                            backgroundColor: MyTheme.colorsScheme(context)
                                .secondaryContainer,
                            foregroundColor: MyTheme.colorsScheme(context)
                                .onSecondaryContainer,
                            child: IconButton(
                              splashColor: Colors.transparent,
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(Icons.arrow_back),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 20),
                      child: Text(
                        restaurantDetail.restaurant.name,
                        style: MyTheme.headlineLarge(
                          MyTheme.colorsScheme(context).onBackground,
                          context,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color:
                                MyTheme.colorsScheme(context).onSurfaceVariant,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            restaurantDetail.restaurant.city,
                            style: MyTheme.bodyMedium(
                              MyTheme.colorsScheme(context).onSurfaceVariant,
                              context,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Icon(
                            Icons.star_outline_outlined,
                            color:
                                MyTheme.colorsScheme(context).onSurfaceVariant,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            restaurantDetail.restaurant.rating.toString(),
                            style: MyTheme.bodyMedium(
                              MyTheme.colorsScheme(context).onSurfaceVariant,
                              context,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, top: 20, right: 8),
                      child: Text(
                        restaurantDetail.restaurant.description,
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
            child: Text(value.message),
          );
        }
      },
    );
  }
}
