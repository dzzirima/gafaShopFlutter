import 'package:amazon_clone/model/user.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      id: "",
      name: '',
      email: '',
      password: '',
      address: '',
      type: '',
      token: '');

// This user is a  private variable we need to create a gettor and a setter
  User get user => _user;
  void setUser(String user) {
    _user = User.fromJson(user);

    //notify all the users that the user has changed
    notifyListeners();
  }
}
