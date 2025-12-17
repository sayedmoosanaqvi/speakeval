import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage {
  static void showToast(String message, Color bgColor) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: bgColor,
      gravity: ToastGravity.TOP_RIGHT,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}
