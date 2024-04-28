import 'package:flutter/material.dart';
import 'package:mobile_local_db/models/fovorite_stores_model.dart';
import 'package:mobile_local_db/models/user_model.dart';
import 'package:mobile_local_db/screens/login_screen.dart';
import 'package:mobile_local_db/screens/profile_screen.dart';
import 'package:mobile_local_db/screens/sign_up_screen.dart';

/*void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'LoginPage': (context) => LoginPage(),
        'ProfilePage': (context) => ProfilePage(),
        //'EditProfilePage': (context) => EditProfilePage(),
        'SignUpPage': (context) => SignUpPage(),
      },
      home: SignUpPage(), // Remove initialRoute and set home to SignUpPage
    );
  }
}*/

import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserModel()),
        ChangeNotifierProvider(create: (_) => FavoriteStoresModel()), // Provide the FavoriteStoresModel
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
      routes: {
        'LoginPage': (context) => LoginPage(),
        'ProfilePage': (context) => ProfilePage(),
        'SignUpPage': (context) => SignUpPage(),
      }
    );
  }
}