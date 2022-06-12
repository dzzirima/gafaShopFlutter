//this file is for handling all the errors that may occur during the
import 'dart:convert';

import 'package:gafashop/constants/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context, //allows us to show messages
  required VoidCallback onSuccess, //Fuction()?
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      showSnackBar(context, jsonDecode(response.body)['error']);
      break;
    default:
      showSnackBar(context, "Something went Wrong !!!");
      break;
  }
}
