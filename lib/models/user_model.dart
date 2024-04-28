import 'package:flutter/material.dart';


class UserModel extends ChangeNotifier {
  String? username;
  String? email;
  String? phoneNumber;
  String? password;

  UserModel({this.email, this.password,this.phoneNumber,this.username});

  void setUsername(String name) {
    username = name;
    notifyListeners();
  }

  void setEmail(String mail) {
    email = mail;
    notifyListeners();
  }

  void setPhoneNumber(String number) {
    phoneNumber = number;
    notifyListeners();
  }

  void setPassword(String pass) {
    password = pass;
    notifyListeners();
  }
}