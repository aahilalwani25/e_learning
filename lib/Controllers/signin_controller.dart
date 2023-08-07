import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SigninController {
  BuildContext context;
  SigninController({required this.context});

  Future<void> handleSignin(String type, String email, String password) async {
    try {
      if (type.compareTo("email") == 0) {
        Uri uri = Uri.parse('http://192.18.2.108:3000/api/login?email=$email&password=$password');

        final response = await get(uri, headers: {
          "Connection": "keep-alive",
        });

        if (response.statusCode == 200) {
          final decoded = jsonDecode(response.body);
          print(decoded);

          for (var user in decoded) {
            if (user['email'] == email && user['password'] == password) {
              print('user logged in');
              break;
            }
          }
        } else {
          print('either username or password is wrong');
        }
      }
    } on Exception {
      // TODO
    }
  }
}
