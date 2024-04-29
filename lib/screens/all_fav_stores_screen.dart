import 'package:flutter/material.dart';
import 'package:mobile_local_db/database_Store.dart'; // Import DatabaseHelper
import 'package:mobile_local_db/models/fovorite_stores_model.dart';
import 'package:mobile_local_db/models/store_model.dart';
import 'package:mobile_local_db/widgets/buttomNavigationBar.dart';
import 'package:mobile_local_db/widgets/custom_store_card.dart';
import 'package:provider/provider.dart';

import 'package:mobile_local_db/providers/Favorite_store.dart';

class MyFavStoresPage extends StatelessWidget {
  const MyFavStoresPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteStoreProvider(),
      child: _MyFavStoresPage(),
    );
  }
}

class _MyFavStoresPage extends StatefulWidget {
  @override
  __MyFavStoresPageState createState() => __MyFavStoresPageState();
}

class __MyFavStoresPageState extends State<_MyFavStoresPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<FavoriteStoreProvider>(context, listen: false)
        .fetchFavoriteStores(); // Call fetch method on initialization
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Favorite Stores',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 1, 31, 56),
      ),
      body: Consumer<FavoriteStoreProvider>(
        builder: (context, provider, child) {
          List<StoreModel> favoriteStores = provider.favoriteStores;
          return ListView.builder(
            itemCount: favoriteStores.length,
            itemBuilder: (context, index) {
              return CustomStoreCard(
                store: favoriteStores[index],
                onTap: () {
                  Navigator.pop(context, favoriteStores[index]);
                },
              );
            },
          );
        },
      ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }
}
