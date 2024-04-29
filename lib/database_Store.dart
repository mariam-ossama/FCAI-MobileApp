import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:mobile_local_db/models/store_model.dart';

class StoreDatabaseHelper {
  static final StoreDatabaseHelper _instance = StoreDatabaseHelper.internal();
  factory StoreDatabaseHelper() => _instance;

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDatabase();
    return _database;
  }

  StoreDatabaseHelper.internal();

  Future<Database> initDatabase() async {
  String path = await getDatabasesPath();
  path = join(path, 'store.db');

  return await openDatabase(
    path,
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(
        'CREATE TABLE stores(id INTEGER PRIMARY KEY AUTOINCREMENT, storeName TEXT, storeType TEXT, location TEXT, latitude REAL, longitude REAL, isFavourite INTEGER)',
      );
    },
  );
}


  Future<int> insertStore(StoreModel store) async {
  Database? db = await database;
  Map<String, dynamic> storeMap = store.toMap();
  storeMap.remove('id'); // Remove the id field
  return await db!.insert('stores', storeMap);
}

  Future<List<StoreModel>> getStores() async {
    Database? db = await database;
    List<Map<String, dynamic>> maps = await db!.query('stores');
    return List.generate(maps.length, (index) {
      return StoreModel.fromMap(maps[index]);
    });
  }

  Future<List<StoreModel>> getFavoriteStores() async {
    final db = await database;
    final List<Map<String, dynamic>> results =
        await db?.rawQuery('SELECT * FROM stores WHERE isFavourite = 1')
            as List<Map<String, dynamic>>; // Cast the result
    return results?.map((result) => StoreModel.fromMap(result)).toList() ?? [];
  }

  Future<void> updateStore(StoreModel store) async {
    Database? db = await database;
    await db!.update(
      'stores',
      store.toMap(),
      where: 'id = ?',
      whereArgs: [store.id],
    );
  }

  Future<void> updateFavorite(int storeId, bool isFavorite) async {
    final db = await database;
    await db!.update(
      'stores',
      {'isFavourite': isFavorite ? 1 : 0},
      where: 'id = ?',
      whereArgs: [storeId],
    );
  }
}
