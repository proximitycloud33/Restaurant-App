import 'package:sqflite/sqflite.dart';

import 'package:restaurant_app/model/restaurant_favorite_model.dart';

class DatabaseHelper {
  //Singleton
  static DatabaseHelper databaseHelper = DatabaseHelper._internal();
  DatabaseHelper._internal();
  factory DatabaseHelper() => databaseHelper;

  static Database? _database;
  static const String _tableFavoriteName = 'favorites';

  Future<Database> _initializeDb() async {
    var databasePath = await getDatabasesPath();
    const String query = '''CREATE TABLE $_tableFavoriteName (
           id TEXT PRIMARY KEY,
           name TEXT,
           city TEXT,
           picture BLOB )
        ''';
    var db = openDatabase(
      '$databasePath/restaurantapp.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute(query);
      },
    );
    return db;
  }

  Future<Database?> get database async {
    _database ??= await _initializeDb();
    return _database;
  }

  Future<void> insertFavorite(RestaurantFavorite restaurantFavorite) async {
    final dbClient = await database;
    dbClient!.insert(
      _tableFavoriteName,
      restaurantFavorite.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<RestaurantFavorite>> getFavoriteRestaurant() async {
    final dbClient = await database;
    List<Map<String, dynamic>> results =
        await dbClient!.query(_tableFavoriteName);
    return results
        .map((result) => RestaurantFavorite.fromJson(result))
        .toList();
  }

  Future<Map> getFavoriteByRestaurantId(String restaurantId) async {
    final dbClient = await database;
    List<Map<String, dynamic>> results = await dbClient!.query(
      _tableFavoriteName,
      where: 'id = ?',
      whereArgs: [restaurantId],
    );
    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  Future<void> removeFavorite(String restaurantId) async {
    final dbClient = await database;
    await dbClient!.delete(
      _tableFavoriteName,
      where: 'id = ?',
      whereArgs: [restaurantId],
    );
  }
}
