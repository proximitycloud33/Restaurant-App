import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:restaurant_app/model/restaurant_detail_model.dart';
import 'package:restaurant_app/model/restaurant_search_model.dart';
import 'package:restaurant_app/model/restaurant_list_model.dart';
import 'package:restaurant_app/services/api_service.dart';

enum ResultState { loading, noData, hasData, error }

class RestaurantProvider extends ChangeNotifier {
  final ApiService _apiService;
  late String _restaurantId;
  late String _query;
  RestaurantProvider(this._apiService);

  RestaurantProvider.fetchRestaurantListData(this._apiService) {
    _fetchRestaurantListData();
  }
  RestaurantProvider.fetchRestaurantDetailData(
      this._apiService, this._restaurantId) {
    fetchRestaurantDetailData(_restaurantId);
  }
  RestaurantProvider.fetchSearchRestaurantListData(
      this._apiService, this._query) {
    fetchSearchRestaurantSearchData(_query);
  }

  RestaurantList? _restaurantList;
  RestaurantDetail? _restaurantDetail;
  RestaurantSearch? _restaurantSearch;
  late ResultState _state;
  String _message = '';

  RestaurantList? get restaurantList => _restaurantList;
  RestaurantDetail? get restaurantDetail => _restaurantDetail;
  RestaurantSearch? get restaurantSearch => _restaurantSearch;
  ResultState get state => _state;
  String get message => _message;

  Future<dynamic> _fetchRestaurantListData() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      _restaurantList = await _apiService.getRestaurantListData();
      if (_restaurantList?.error == false) {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantList;
      } else {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'No Data';
      }
    } on SocketException catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = '$e';
    }
  }

  Future<dynamic> fetchRestaurantDetailData(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      _restaurantDetail = await _apiService.getRestaurantDetailData(id);
      if (_restaurantDetail?.error == false) {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantDetail;
      } else {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'No Data';
      }
    } on SocketException catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = '$e';
    }
  }

  Future<dynamic> fetchSearchRestaurantSearchData(String query) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      _restaurantSearch = await _apiService.getRestaurantWithSearch(query);
      if (_restaurantSearch?.error == false) {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantSearch;
      } else {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'No Data';
      }
    } on SocketException catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = '$e';
    }
  }
}
