//connection to backend is handled in here
import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

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
}
