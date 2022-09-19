import 'package:flutter/foundation.dart';
import 'package:restaurant_app/helper/database_helper.dart';
import 'package:restaurant_app/model/restaurant_favorite_model.dart';
import 'package:restaurant_app/shared/result_state.dart';

class DatabaseProvider extends ChangeNotifier {
  final DatabaseHelper databaseHelper;

  DatabaseProvider({required this.databaseHelper}) {
    _getFavorites();
  }

  ResultState? _state;
  String _message = '';
  List<RestaurantFavorite> _favorites = [];

  ResultState? get state => _state;
  String get message => _message;
  List<RestaurantFavorite> get favorites => _favorites;

  void _getFavorites() async {
    _favorites = await databaseHelper.getFavoriteRestaurant();
    if (_favorites.isNotEmpty) {
      _state = ResultState.hasData;
    } else {
      _state = ResultState.noData;
      _message = 'Empty Data';
    }
    notifyListeners();
  }

  void addFavorite(RestaurantFavorite restaurantFavorite) async {
    try {
      await databaseHelper.insertFavorite(restaurantFavorite);
      _getFavorites();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  Future<bool> isFavorited(String restaurantId) async {
    final bookmarkedRestaurantFavorite =
        await databaseHelper.getFavoriteByRestaurantId(restaurantId);
    return bookmarkedRestaurantFavorite.isNotEmpty;
  }

  void removeFavorite(String restaurantId) async {
    try {
      await databaseHelper.removeFavorite(restaurantId);
      _getFavorites();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }
}
