import 'package:restaurant_app/model/restaurant_detail_model.dart';
import 'package:restaurant_app/model/restaurant_list_model.dart';
import 'package:http/http.dart' as http;

import '../model/restaurant_search_model.dart';

class ApiService {
  final String _baseUrl = 'https://restaurant-api.dicoding.dev';

  Future<RestaurantList> getRestaurantListData() async {
    final Uri parsedUri = Uri.parse('$_baseUrl/list');
    final response = await http.get(parsedUri);
    if (response.statusCode == 200) {
      return restaurantListFromJson(response.body);
    } else {
      throw Exception('failed to load restaurant data');
    }
  }

  Future<RestaurantDetail> getRestaurantDetailData(String id) async {
    final Uri parsedUri = Uri.parse('$_baseUrl/detail/$id');
    final response = await http.get(parsedUri);
    if (response.statusCode == 200) {
      return restaurantDetailFromJson(response.body);
    } else {
      throw Exception('failed to load data');
    }
  }

  Future<RestaurantSearch> getRestaurantWithSearch(String query) async {
    final Uri parsedUri = Uri.parse('$_baseUrl/search?q=$query');
    final response = await http.get(parsedUri);
    if (response.statusCode == 200) {
      return restaurantSearchFromJson(response.body);
    } else {
      throw Exception('failed to load data');
    }
  }
}
