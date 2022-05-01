import 'package:app/Models/User.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  late User savedUser = User(id: 0, username: "", password: "");

  saveUser(String username, String password) {
    this.savedUser = User(id: 0, username: username, password: password);
    notifyListeners();
  }
}
