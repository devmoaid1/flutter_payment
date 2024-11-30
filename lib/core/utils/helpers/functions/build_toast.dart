import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void buildToast({required String message, Color? color}) =>
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: color ?? Colors.green,
      textColor: Colors.white,
    );
