import 'package:flutter/material.dart';

class LogResultSnackBar {
  static SnackBar showLogResultSnackBar(bool result) {
    Color color = (result)
        ? const Color.fromARGB(185, 72, 134, 56)
        : const Color.fromARGB(184, 185, 44, 44);
    String message =
        (result) ? 'Authorization was successful' : 'Authorization failed';
    return SnackBar(
      content: SizedBox(
        height: 60,
        width: 360,
        child: Center(
          child: Text(message),
        ),
      ),
      duration: const Duration(milliseconds: 5000),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      padding: EdgeInsets.zero,
      backgroundColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(
          width: 4,
          color: color,
        ),
      ),
    );
  }
}