import 'package:mobile_local_db/models/store_model.dart';
import 'package:mobile_local_db/screens/add_store_screen.dart';
import 'package:mobile_local_db/widgets/buttomNavigationBar.dart';
import 'package:mobile_local_db/widgets/custom_store_card.dart';
import 'package:flutter/material.dart';
import 'package:mobile_local_db/database_Store.dart';
import 'package:provider/provider.dart';
import 'package:mobile_local_db/providers/get_store_provider.dart';

class StoreListPage extends StatelessWidget {
  const StoreListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetStoreProvider(),
      child: _StoreListPage(),
    );
  }
}

class _StoreListPage extends StatefulWidget {
  @override
  __StoreListPageState createState() => __StoreListPageState();
}

class __StoreListPageState extends State<_StoreListPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<GetStoreProvider>(context, listen: false).fetchStores();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Stores',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 1, 31, 56),
      ),
      body: Consumer<GetStoreProvider>(
        builder: (context, provider, child) {
          List<StoreModel> storesList = provider.stores;
          return ListView.builder(
            itemCount: storesList.length,
            itemBuilder: (context, index) {
              final store = storesList[index];
              return CustomStoreCard(
                store: store,
                onTap: () {
                  // Handle onTap event
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final updatedStoresList = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddStoreScreen(),
            ),
          );
          if (updatedStoresList != null) {
            Provider.of<GetStoreProvider>(context, listen: false)
                .fetchStores(); // Update the store list when a new store is added
          }
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color.fromARGB(255, 1, 31, 56),
      ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }
}
