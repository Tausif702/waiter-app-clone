import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static Widget loginButton({
    required String text,
    required VoidCallback onPressed,
    Color? backgroundColor,
    Color? textColor,
    double? fontSize,
    EdgeInsets? padding,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Color(0xFF218C4E),
        padding: padding ?? const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize ?? 16,
          color: textColor ?? Colors.white,
        ),
      ),
    );
  }
  static const String _green = '\x1B[32m';
  static const String _blue = '\x1B[34m';
  static const String _red = '\x1B[31m';
  static const String _reset = '\x1B[0m';

  static void printRequest(String message) {
    print('\n\n$_green$message$_reset\n\n');
  }

  static void printResponse(String message) {
    print('\n\n$_blue$message$_reset\n\n');
  }

  static void printError(String message) {
    print('\n\n$_red$message$_reset]\n\n');
  }
}
