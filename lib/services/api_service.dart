import 'dart:developer';

import 'package:restaurant_app/model/restraurant_list_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  late RestaurantList restaurantListResult;
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/list';
  final Uri _parsedUri = Uri.parse(_baseUrl);

  Future<RestaurantList> getRestaurantListData() async {
    try {
      final response = await http.get(_parsedUri);
      if (response.statusCode == 200) {
        restaurantListResult = restaurantListFromJson(response.body);
      } else {
        throw Exception('failed to load data');
      }
    } catch (e) {
      log(e.toString());
    }

    return restaurantListResult;
  }
}
