import 'package:flutter/material.dart';
import 'package:restaurant_app/shared/theme.dart';

class RestaurantReviewListView extends StatelessWidget {
  const RestaurantReviewListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.separated(
        itemCount: 20,
        itemBuilder: (context, index) {
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
                      'Ahmad',
                      style: MyTheme.titleMedium(
                        MyTheme.colorsScheme(context).onSurface,
                        context,
                      ),
                    ),
                    Text(
                      'Tidak Ramah untuk Pelajar',
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
  }
}
