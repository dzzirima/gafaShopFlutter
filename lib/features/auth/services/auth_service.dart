//connection to backend is handled in here
import 'dart:convert';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/model/user.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  //signup user
  //we might need the build context so we will see the error , ie snackbar

  void signUpUser({
    required BuildContext context,
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      User user = User(
          address: '',
          id: '',
          name: name,
          password: password,
          token: '',
          type: '',
          email: email);

      http.Response res = await http.post(
        Uri.parse('$url/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
      );

      // print(res.body);

      //using customised http handling stuff
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, "Account Created SuccessFully !!!");
        },
      );
    } catch (e) {
      //error when creating a user
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$url/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
      );

      //using customised http handling stuff
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          //get shared preference instance
          SharedPreferences prefs = await SharedPreferences.getInstance();
          //if we are outside context listen is always false
          // ignore: use_build_context_synchronously
          String user = res.body;

          // ignore: use_build_context_synchronously
          Provider.of<UserProvider>(context, listen: false).setUser(user);
          await prefs.setString(
            'x-auth-token',
            jsonDecode(res.body)['token'],
          );

          // ignore: use_build_context_synchronously
          Navigator.pushNamedAndRemoveUntil(
              context, HomeScreen.routeName, (route) => false);
        },
      );
    } catch (e) {
      //error when creating a user
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }

//get User Data
  void getUserData({
    required BuildContext context,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }
      var tokenRes = await http.post(
        Uri.parse('$url/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'x-auth-token': token! //means it cant be  null
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        //get the user data
        http.Response userRes = await http.get(
          Uri.parse('$url/'),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
            'x-auth-token': token
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      //error when creating a user
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }
}
