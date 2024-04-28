

import 'package:flutter/material.dart';
import 'package:mobile_local_db/models/fovorite_stores_model.dart';
import 'package:mobile_local_db/widgets/buttomNavigationBar.dart';
import 'package:mobile_local_db/widgets/custom_store_card.dart';
import 'package:provider/provider.dart';

class MyFavStoresPage extends StatefulWidget {
  const MyFavStoresPage({super.key});

  @override
  State<MyFavStoresPage> createState() => _MyFavStoresPageState();
}

class _MyFavStoresPageState extends State<MyFavStoresPage> {
  @override
  Widget build(BuildContext context) {
    var favoriteStoresModel = Provider.of<FavoriteStoresModel>(context);
    var favoriteStores = favoriteStoresModel.favoriteStores;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,),
            ),
        title: Text('Favorite stores',
        style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromARGB(255, 1, 31, 56),
      ),
      body: ListView.builder(
        itemCount: favoriteStores.length,
        itemBuilder: (context, index) {
          return CustomStoreCard(
            store: favoriteStores[index],
            onTap: () {
              Navigator.pop(context, favoriteStores[index]);
            },
          );
        },
      ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }
}