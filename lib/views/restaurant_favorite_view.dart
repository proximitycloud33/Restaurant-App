import 'package:flutter/material.dart';

class RestaurantFavoriteView extends StatelessWidget {
  const RestaurantFavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 1,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: ConstrainedBox(
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
                  children: const [],
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
  }
}
