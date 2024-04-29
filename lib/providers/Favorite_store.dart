import 'package:flutter/material.dart';
import 'package:mobile_local_db/database_Store.dart';
import 'package:mobile_local_db/models/store_model.dart';

class FavoriteStoreProvider extends ChangeNotifier {
  final StoreDatabaseHelper _databaseHelper = StoreDatabaseHelper();

  List<StoreModel> _favoriteStores = [];

  List<StoreModel> get favoriteStores => _favoriteStores;

  Future<void> fetchFavoriteStores() async {
    _favoriteStores = await _databaseHelper.getFavoriteStores();
    notifyListeners();
  }
}
