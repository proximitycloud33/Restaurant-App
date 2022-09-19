import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/shared/theme.dart';

class RestaurantReviewListView extends StatelessWidget {
  const RestaurantReviewListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantProvider>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ListView.separated(
            itemCount:
                value.restaurantDetail?.restaurant.customerReviews.length ?? 0,
            itemBuilder: (context, index) {
              final customerReviews =
                  value.restaurantDetail?.restaurant.customerReviews[index];
              return ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 100,
                ),
                child: Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          customerReviews?.name ?? '',
                          style: MyTheme.titleMedium(
                            MyTheme.colorsScheme(context).onSurface,
                            context,
                          ),
                        ),
                        Text(
                          customerReviews?.review ?? '',
                          style: MyTheme.bodyMedium(
                            MyTheme.colorsScheme(context).onSurfaceVariant,
                            context,
                          ),
                        ),
                        Text(
                          'Reviewed on ${customerReviews?.date}',
                          style: MyTheme.bodyMedium(
                            MyTheme.colorsScheme(context).onSurfaceVariant,
                            context,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 20);
            },
          ),
        );
      },
    );
  }
}
