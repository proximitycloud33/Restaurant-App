import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restraurant_list_model.dart';
import 'package:restaurant_app/shared/theme.dart';

class RestaurantDetail extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantDetail({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: restaurant.id,
      child: Material(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Image.network(
                    restaurant.pictureId,
                    height: 250,
                    width: double.maxFinite,
                    fit: BoxFit.fitWidth,
                  ),
                  Positioned(
                    left: 16,
                    top: 36,
                    child: CircleAvatar(
                      backgroundColor:
                          MyTheme.colorsScheme(context).secondaryContainer,
                      foregroundColor:
                          MyTheme.colorsScheme(context).onSecondaryContainer,
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
                  restaurant.name,
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
                      color: MyTheme.colorsScheme(context).onSurfaceVariant,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      restaurant.city,
                      style: MyTheme.bodyMedium(
                        MyTheme.colorsScheme(context).onSurfaceVariant,
                        context,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Icon(
                      Icons.star_outline_outlined,
                      color: MyTheme.colorsScheme(context).onSurfaceVariant,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      restaurant.rating.toString(),
                      style: MyTheme.bodyMedium(
                        MyTheme.colorsScheme(context).onSurfaceVariant,
                        context,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 20, right: 8),
                child: Text(
                  restaurant.description,
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
  }
}
