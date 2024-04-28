import 'package:mobile_local_db/models/store_model.dart';
import 'package:mobile_local_db/screens/add_store_screen.dart';
import 'package:mobile_local_db/widgets/buttomNavigationBar.dart';
import 'package:mobile_local_db/widgets/custom_store_card.dart';
import 'package:flutter/material.dart';

class StoreListPage extends StatefulWidget {
  const StoreListPage({super.key});

  @override
  State<StoreListPage> createState() => _StoreListPageState();
}

class _StoreListPageState extends State<StoreListPage> {
  
  List<StoreModel> storesList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,),
            ),
        title: Text('Stores',
        style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromARGB(255, 1, 31, 56),
      ),
      body: ListView.builder(
  itemCount: storesList.length,
  itemBuilder: (context, index) {
    return CustomStoreCard(
      store: storesList[index],
      onTap: () {
        // Handle onTap event
      },
    );
  },
),
floatingActionButton: FloatingActionButton(
  onPressed: () async{
    final updatedStoresList = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddStorePage(),
            ),
          );
          if (updatedStoresList != null) {
            setState(() {
              storesList.addAll(updatedStoresList);
            });
          }
  },
  child: Icon(Icons.add, color: Colors.white,),
  backgroundColor: Color.fromARGB(255, 1, 31, 56),),
bottomNavigationBar: MyNavigationBar(),
    );
  }
}