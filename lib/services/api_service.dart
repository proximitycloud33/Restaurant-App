import 'dart:convert';

import 'package:restaurant_app/model/restaurant_detail_model.dart';
import 'package:restaurant_app/model/restaurant_list_model.dart';
import 'package:http/http.dart' as http;

import 'package:restaurant_app/model/restaurant_search_model.dart';

class ApiService {
  final String _baseUrl = 'https://restaurant-api.dicoding.dev';

  Future<RestaurantList> getRestaurantListData(http.Client client) async {
    final Uri parsedUri = Uri.parse('$_baseUrl/list');
    final response = await client.get(parsedUri);
    if (response.statusCode == 200) {
      return restaurantListFromJson(response.body);
    } else {
      throw Exception('failed to load restaurant data');
    }
  }

  Future<RestaurantDetail> getRestaurantDetailData(
      http.Client client, String id) async {
    final Uri parsedUri = Uri.parse('$_baseUrl/detail/$id');
    final response = await client.get(parsedUri);
    if (response.statusCode == 200) {
      return restaurantDetailFromJson(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<RestaurantSearch> getRestaurantWithSearch(
      http.Client client, String query) async {
    final Uri parsedUri = Uri.parse('$_baseUrl/search?q=$query');
    final response = await http.get(parsedUri);
    if (response.statusCode == 200) {
      return restaurantSearchFromJson(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  void addReview(http.Client client, Map<String, dynamic> review) async {
    final Uri parsedUrl = Uri.parse('$_baseUrl/review');
    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=utf-8',
    };
    final response =
        await http.post(parsedUrl, headers: headers, body: jsonEncode(review));
    if (response.statusCode != 201) {
      throw Exception('Failed to add reviews');
    }
  }
}
