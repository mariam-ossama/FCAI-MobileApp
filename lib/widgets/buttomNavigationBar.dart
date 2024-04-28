import 'package:flutter/material.dart';
import 'package:mobile_local_db/screens/all_fav_stores_screen.dart';
import 'package:mobile_local_db/screens/all_stores_screen.dart';
import 'package:mobile_local_db/screens/calculate_distance_screen.dart';


class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
          //backgroundColor: Color.fromARGB(255, 1, 31, 56),
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'ProfilePage');
                },
                icon: Icon(Icons.person,
                color: Colors.white,),
              ),
              label: 'Profile',
              backgroundColor: Color.fromARGB(255, 1, 31, 56),
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: (){
                  Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StoreListPage(),
                ),
              );
                },
                icon:Icon(Icons.shop, color: Colors.white),),
              label: 'Stores',
              backgroundColor: Color.fromARGB(255, 1, 31, 56),
            ),
           BottomNavigationBarItem(
  icon: IconButton(
    onPressed: (){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Builder(
            builder: (context) {
              return MyFavStoresPage(); // Use Builder to access the provider
            },
          ),
        ),
      );
    },
    icon: Icon(Icons.star, color: Colors.white),
  ),
  label: 'Favorite',
  backgroundColor: Color.fromARGB(255, 1, 31, 56),
),

            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: (){
                  Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Builder(
            builder: (context) {
              return CalculateDistancePage(); // Use Builder to access the provider
            },
          ),
        ),
      );
                },
                icon:Icon(Icons.location_on, color: Colors.white),),
              label: 'Distance',
              backgroundColor: Color.fromARGB(255, 1, 31, 56),
            ),
          ]);
  }
}