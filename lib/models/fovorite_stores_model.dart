

import 'package:flutter/material.dart';
import 'store_model.dart';

class FavoriteStoresModel extends ChangeNotifier {
  List <StoreModel> _favoriteStores = [
    /*StoreModel(
      id: 1,
      storeName: 'vvvvvvv',
      storeType: 'Clothing',
      location: 'Cairo'
    ),
    StoreModel(
      id: 2,
      storeName: 'vvvvvvv',
      storeType: 'Clothing',
      location: 'Cairo'
    ),
    StoreModel(
      id: 3,
      storeName: 'vvvvvvv',
      storeType: 'Clothing',
      location: 'Cairo'
    ),*/
  ];

  List<StoreModel> get favoriteStores => _favoriteStores;

  void toggleFavorite(StoreModel store) {
    if (_favoriteStores.contains(store)) {
      _favoriteStores.remove(store);
    } else {
      _favoriteStores.add(store);
    }
    notifyListeners();
  }
}