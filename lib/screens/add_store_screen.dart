

import 'package:flutter/material.dart';
import 'package:mobile_local_db/models/store_model.dart';
import 'package:mobile_local_db/widgets/buttomNavigationBar.dart';
import 'package:mobile_local_db/widgets/custom_text_field.dart';
import 'package:mobile_local_db/widgets/custum_button.dart';

class AddStorePage extends StatefulWidget {
  const AddStorePage({super.key});

  @override
  State<AddStorePage> createState() => _AddStorePageState();
}

class _AddStorePageState extends State<AddStorePage> {
  final List<StoreModel> storesList = [];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();

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
        title: Text('Add Store',
        style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromARGB(255, 1, 31, 56),
      ),
      body: ListView(
        children: [
          SizedBox(height: 30,),
          CustomTextField(obsText: false,
          label: 'store name',
          hint: 'store name',
          controllerText: _nameController,),
          SizedBox(height: 15,),
          CustomTextField(obsText: false,
          label: 'store type',
          hint: 'store type',
          controllerText: _typeController,),
          SizedBox(height: 15,),
          CustomTextField(obsText: false,
          label: 'store location',
          hint: 'store location',
          controllerText: _locationController,),
          SizedBox(height: 15,),
          CustomTextField(obsText: false,
          label: 'store latitude',
          hint: 'store latitude',
          controllerText: _latitudeController,),
          SizedBox(height: 15,),
          CustomTextField(obsText: false,
          label: 'store longitude',
          hint: 'store longitude',
          controllerText: _longitudeController,),
          SizedBox(height: 15,),
          CustomButton(text: 'Submit',
          onPressed: () {
  String name = _nameController.text;
  String type = _typeController.text;
  String location = _locationController.text;
  double? latitude = double.tryParse(_latitudeController.text);
  double? longitude = double.tryParse(_longitudeController.text);

  if (name.isNotEmpty && type.isNotEmpty && location.isNotEmpty) {
    StoreModel newStore = StoreModel(
      id: storesList.length + 1, // Assign a unique ID to the new store
      storeName: name,
      storeType: type,
      location: location,
      latitude: latitude,
      longitude: longitude,
    );

    setState(() {
      storesList.add(newStore);
    });

    Navigator.pop(context, storesList);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Please fill in all fields.'),
        duration: Duration(seconds: 2),
      ),
    );
  }
},)
        ],
      ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }
}