import 'package:app/Models/User.dart';
import 'package:app/Services/UserServices.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  int savedId;
  String savedUsername, savedPassword;
  UserServices userServices = UserServices();

  UserProvider(
      {this.savedId = 0, this.savedUsername = "", this.savedPassword = ""});

  saveUser(String username, String password) async {
    userServices.getUserId(username).then((value) {
      savedId = value;
      savedUsername = username;
      savedPassword = password;
      notifyListeners();
    });
  }
}
