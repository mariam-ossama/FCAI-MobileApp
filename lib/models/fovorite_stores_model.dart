import 'package:flutter/material.dart';
import 'store_model.dart';

class FavoriteStoresModel extends ChangeNotifier {
  final List<StoreModel> _favoriteStores = [];

  List<StoreModel> get favoriteStores => _favoriteStores;

  void toggleFavorite(StoreModel store) {
    final isFavorite = _favoriteStores.contains(store);
    if (isFavorite) {
      _favoriteStores.remove(store);
    } else {
      _favoriteStores.add(store);
    }
    store.is_favourite = !isFavorite; // Update favourite flag in store model
    notifyListeners();
  }
}
