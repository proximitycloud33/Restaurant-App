import 'package:flutter/foundation.dart';
import 'package:restaurant_app/model/restaurant_detail_model.dart';
import 'package:restaurant_app/model/restraurant_list_model.dart';
import 'package:restaurant_app/services/api_service.dart';

enum ResultState { loading, noData, hasData, error }

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;
  late String restaurantId;

  RestaurantProvider.fetchRestaurantListData({required this.apiService}) {
    _fetchRestaurantListData();
  }
  RestaurantProvider.fetchRestaurantDetailData(
      {required this.apiService, required this.restaurantId}) {
    fetchRestaurantDetailData(restaurantId);
  }

  late RestaurantList _restaurantList;
  RestaurantDetail? _restaurantDetail;
  late ResultState _state;
  String _message = '';

  RestaurantList get restaurantList => _restaurantList;
  RestaurantDetail? get restaurantDetail => _restaurantDetail;
  ResultState get state => _state;
  String get message => _message;

  Future<dynamic> _fetchRestaurantListData() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      _restaurantList = await apiService.getRestaurantListData();
      if (_restaurantList.restaurants.isNotEmpty) {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantList;
      } else {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'No Data';
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = '$e';
    }
  }

  Future<dynamic> fetchRestaurantDetailData(String restaurantId) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      _restaurantDetail =
          await apiService.getRestaurantDetailData(restaurantId);

      if (_restaurantDetail?.error == false) {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantDetail;
      } else {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'No Data';
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = '$e';
    }
  }
}
