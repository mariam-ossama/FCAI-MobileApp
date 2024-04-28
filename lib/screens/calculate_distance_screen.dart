


import 'package:flutter/material.dart';
import 'package:mobile_local_db/widgets/buttomNavigationBar.dart';

class CalculateDistancePage extends StatefulWidget {
  const CalculateDistancePage({super.key});

  @override
  State<CalculateDistancePage> createState() => _CalculateDistancePgeState();
}

class _CalculateDistancePgeState extends State<CalculateDistancePage> {
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
      body: ListView(
        children: [],
      ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }
}