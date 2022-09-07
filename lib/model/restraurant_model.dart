import 'dart:convert';

class RestaurantList {
  final List<Restaurant> restaurants;

  RestaurantList({required this.restaurants});
  factory RestaurantList.fromJson(Map<String, dynamic> json) {
    return RestaurantList(
      restaurants: List<Restaurant>.from(
        json['restaurants'].map(
          (restaurant) => Restaurant.fromJson(restaurant),
        ),
      ),
    );
  }
}

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final Menus menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      pictureId: json['pictureId'] ?? '',
      city: json['city'] ?? '',
      rating: json['rating']?.toDouble() ?? 0.0,
      menus: Menus.fromJson(json['menus']),
    );
  }
}

class Menus {
  final List<Food> foods;
  final List<Drink> drinks;
  Menus({required this.foods, required this.drinks});
  factory Menus.fromJson(Map<String, dynamic> json) {
    return Menus(
      foods: List<Food>.from(
        json['foods'].map(
          (food) => Food.fromJson(food),
        ),
      ),
      drinks: List<Drink>.from(
        json['drinks'].map(
          (drink) => Drink.fromJson(drink),
        ),
      ),
    );
  }
}

class Food {
  final String name;

  Food({required this.name});
  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(name: json['name'] ?? '');
  }
}

class Drink {
  final String name;
  Drink({required this.name});

  factory Drink.fromJson(Map<String, dynamic> json) {
    return Drink(name: json['name'] ?? '');
  }
}

RestaurantList parseRestaurantList(String? json) {
  if (json == null) {
    return RestaurantList(restaurants: []);
  } else {
    final Map<String, dynamic> decodedJson = jsonDecode(json);
    RestaurantList restaurant = RestaurantList.fromJson(decodedJson);
    return restaurant;
  }
}
