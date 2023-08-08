import 'package:flutter/material.dart';

void showError(BuildContext context, String error) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Center(
          child: Text(error,
        style: const TextStyle(color: Colors.white),
      )),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      width: 300 * 0.9,
    ));
}
