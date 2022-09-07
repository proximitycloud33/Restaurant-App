import 'package:flutter/foundation.dart';
import 'package:restaurant_app/model/restraurant_list_model.dart';
import 'package:restaurant_app/services/api_service.dart';

enum ResultState { loading, noData, hasData, error }

class RestaurantListProvider extends ChangeNotifier {
  final ApiService apiService;
  RestaurantListProvider({required this.apiService}) {
    _fetchRestaurantData();
  }

  late RestaurantList _restaurantList;
  late ResultState _state;
  String _message = '';

  RestaurantList get restaurantList => _restaurantList;
  ResultState get state => _state;
  String get message => _message;

  Future<dynamic> _fetchRestaurantData() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      _restaurantList = await apiService.getRestaurantListData();
      if (_restaurantList.restaurants.isNotEmpty) {
        _state = ResultState.hasData;
        notifyListeners();
        return _message = 'Has Data';
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
