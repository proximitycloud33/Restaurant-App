import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:restaurant_app/model/restaurant_detail_model.dart';
import 'package:restaurant_app/model/restaurant_list_model.dart';
import 'package:restaurant_app/model/restaurant_search_model.dart';
import 'package:restaurant_app/services/api_service.dart';

import 'fetch_restaurant_data_test.mocks.dart';
import 'mock_data.dart';

@GenerateMocks([http.Client])
void main() {
  group('Fetch Restaurant data from API', () {
    test('Return a Restaurant List Data if http call completes successfully',
        () async {
      final client = MockClient();
      final parsedUri = Uri.parse('https://restaurant-api.dicoding.dev/list');

      when(client.get(parsedUri)).thenAnswer((realInvocation) async =>
          http.Response(restaurantListDataJsonString, 200));

      expect(
        await ApiService().getRestaurantListData(client),
        isA<RestaurantList>(),
      );
    });
    test('Return a Restaurant Detail Data if http call completes successfully',
        () async {
      final client = MockClient();
      String restaurantId = 'rqdv5juczeskfw1e867';
      final parsedUri =
          Uri.parse('https://restaurant-api.dicoding.dev/detail/$restaurantId');

      when(client.get(parsedUri)).thenAnswer((realInvocation) async =>
          http.Response(restaurantDetailDataJsonString, 200));

      expect(
        await ApiService().getRestaurantDetailData(client, restaurantId),
        isA<RestaurantDetail>(),
      );
    });
    test('Return a Restaurant List Data if http call completes successfully',
        () async {
      final client = MockClient();
      String query = 'makan';
      final parsedUri =
          Uri.parse('https://restaurant-api.dicoding.dev/search?q=$query');

      when(client.get(parsedUri)).thenAnswer((realInvocation) async =>
          http.Response(restaurantSearchDataJsonString, 200));

      expect(
        await ApiService().getRestaurantWithSearch(client, query),
        isA<RestaurantSearch>(),
      );
    });
  });

  group('Parsing JSON from MockData', () {
    test('Parsing Restaurant List Data', () {
      expect(
        RestaurantList.fromJson(mockRestaurantList),
        isA<RestaurantList>(),
      );
    });
    test('Parsing Restaurant Detail Data', () {
      expect(
        RestaurantDetail.fromJson(mockRestaurantDetailData),
        isA<RestaurantDetail>(),
      );
    });
    test('Parsing Restaurant Search Data', () {
      expect(
        RestaurantSearch.fromJson(mockRestaurantSearchData),
        isA<RestaurantSearch>(),
      );
    });
  });
}
