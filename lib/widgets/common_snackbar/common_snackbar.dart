import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';




// ignore: non_constant_identifier_names
void ShowToastMessage(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.white,
    textColor: Colors.black,
    fontSize: 16.0,
  );
}