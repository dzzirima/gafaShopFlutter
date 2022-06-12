import 'dart:convert';

import 'package:gafashop/model/user.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
// ignore: prefer_typing_uninitialized_variables
  String? _user;
// This user is a  private variable we need to create a gettor and a setter
  get user => _user;
  void setUser(String user) {
    _user = user;

    //notify all the users that the user has changed
    notifyListeners();
  }
}
