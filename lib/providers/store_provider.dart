import 'package:flutter/material.dart';
import 'package:mobile_local_db/models/store_model.dart';
import 'package:mobile_local_db/database_Store.dart';

class StoreProvider extends ChangeNotifier {
  final StoreDatabaseHelper _storeDatabaseHelper = StoreDatabaseHelper();

  Future<int> addStore(StoreModel store) async {
    int storeId = await _storeDatabaseHelper.insertStore(store);
    notifyListeners();
    return storeId;
  }
}
