import 'package:flutter/material.dart';
import 'package:mobile_local_db/models/store_model.dart';
import 'package:mobile_local_db/database_Store.dart';

class GetStoreProvider extends ChangeNotifier {
  final StoreDatabaseHelper _databaseHelper = StoreDatabaseHelper();

  List<StoreModel> _stores = [];

  List<StoreModel> get stores => _stores;

  Future<void> fetchStores() async {
    _stores = await _databaseHelper.getStores();
    notifyListeners();
  }
}
