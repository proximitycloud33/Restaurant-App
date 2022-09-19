import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/helper/image_converter_helper.dart';

import 'package:restaurant_app/model/restaurant_favorite_model.dart';
import 'package:restaurant_app/provider/database_provider.dart';
import 'package:restaurant_app/shared/theme.dart';

class FavoriteButton extends StatefulWidget {
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
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, value, child) {
        return FutureBuilder(
          future: value.isFavorited(widget.id),
          builder: (context, AsyncSnapshot<bool> snapshot) {
            bool isFavorited = snapshot.data ?? false;
            return Positioned(
              top: 26,
              right: 16,
              child: Builder(
                builder: (context) {
                  if (isFavorited) {
                    return IconButton(
                      splashColor: Colors.transparent,
                      icon: const Icon(Icons.favorite),
                      color: MyTheme.colorsScheme(context).primary,
                      onPressed: () {
                        value.removeFavorite(widget.id);
                        setState(() {});
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
                          widget.picture,
                        );
                        value.addFavorite(
                          RestaurantFavorite(
                            id: widget.id,
                            name: widget.name,
                            city: widget.city,
                            picture: imageBytes,
                          ),
                        );
                        setState(() {});
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
