import 'package:flutter/material.dart';
import 'package:mobile_local_db/models/store_model.dart';
import 'package:mobile_local_db/database_Store.dart';
import 'package:mobile_local_db/widgets/buttomNavigationBar.dart';
import 'package:provider/provider.dart';
import 'package:mobile_local_db/providers/store_provider.dart';

class AddStoreScreen extends StatelessWidget {
  const AddStoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StoreProvider(),
      child: _AddStoreScreen(),
    );
  }
}

class _AddStoreScreen extends StatefulWidget {
  @override
  __AddStoreScreenState createState() => __AddStoreScreenState();
}

class __AddStoreScreenState extends State<_AddStoreScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _typeController;
  late final TextEditingController _locationController;
  late final TextEditingController _latitudeController;
  late final TextEditingController _longitudeController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _typeController = TextEditingController();
    _locationController = TextEditingController();
    _latitudeController = TextEditingController();
    _longitudeController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _typeController.dispose();
    _locationController.dispose();
    _latitudeController.dispose();
    _longitudeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Store'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Store Name'),
            ),
            TextField(
              controller: _typeController,
              decoration: InputDecoration(labelText: 'Store Type'),
            ),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            TextField(
              controller: _latitudeController,
              decoration: InputDecoration(labelText: 'Latitude'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _longitudeController,
              decoration: InputDecoration(labelText: 'Longitude'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _addStore(context);
              },
              child: Text('Add Store'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }

  void _addStore(BuildContext context) async {
    final storeProvider = Provider.of<StoreProvider>(context, listen: false);

    String name = _nameController.text.trim();
    String type = _typeController.text.trim();
    String location = _locationController.text.trim();
    double latitude = double.parse(_latitudeController.text.trim());
    double longitude = double.parse(_longitudeController.text.trim());

    StoreModel store = StoreModel(
      id: 2,
      storeName: name,
      storeType: type,
      location: location,
      latitude: latitude,
      longitude: longitude,
      is_favourite: false,
    );

    int storeId = await storeProvider.addStore(store);
    if (storeId != 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Store added successfully')),
      );
      _nameController.clear();
      _typeController.clear();
      _locationController.clear();
      _latitudeController.clear();
      _longitudeController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add store')),
      );
    }
  }
}
