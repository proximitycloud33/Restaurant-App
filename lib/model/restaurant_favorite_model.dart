import 'dart:convert';
import 'dart:typed_data';

RestaurantFavorite restaurantFavoriteFromJsonString(String jsonString) =>
    RestaurantFavorite.fromJson(json.decode(jsonString));

String restaurantFavoriteToJsonString(RestaurantFavorite restaurantFavorite) =>
    json.encode(restaurantFavorite.toJson());

class RestaurantFavorite {
  final String id;
  final String name;
  final String city;
  final Uint8List picture;

  RestaurantFavorite({
    required this.id,
    required this.name,
    required this.city,
    required this.picture,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'city': city,
      'picture': picture,
    };
  }

  factory RestaurantFavorite.fromJson(Map<String, dynamic> json) {
    return RestaurantFavorite(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      city: json['city'] ?? '',
      picture: json['picture'],
    );
  }
}
