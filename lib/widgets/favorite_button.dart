import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/helper/image_converter_helper.dart';

import 'package:restaurant_app/model/restaurant_favorite_model.dart';
import 'package:restaurant_app/provider/database_provider.dart';
import 'package:restaurant_app/shared/theme.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.id,
    required this.name,
    required this.city,
    required this.picture,
  });

  final String id;
  final String name;
  final String city;
  final String picture;

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, value, child) {
        return FutureBuilder(
          future: value.isFavorite(id),
          builder: (context, AsyncSnapshot<bool> snapshot) {
            bool isFavorite = snapshot.data ?? false;
            return Positioned(
              top: 26,
              right: 16,
              child: Builder(
                builder: (context) {
                  if (isFavorite) {
                    return IconButton(
                      splashColor: Colors.transparent,
                      icon: const Icon(Icons.favorite),
                      color: MyTheme.colorsScheme(context).primary,
                      onPressed: () {
                        value.removeFavorite(id);
                      },
                    );
                  } else {
                    return IconButton(
                      splashColor: Colors.transparent,
                      icon: const Icon(
                        Icons.favorite_border_outlined,
                      ),
                      color: MyTheme.colorsScheme(context).primary,
                      onPressed: () async {
                        var imageBytes =
                            await ImageConverterHelper.convertImageToBytes(
                          picture,
                        );
                        value.addFavorite(
                          RestaurantFavorite(
                            id: id,
                            name: name,
                            city: city,
                            picture: imageBytes,
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            );
          },
        );
      },
    );
  }
}
