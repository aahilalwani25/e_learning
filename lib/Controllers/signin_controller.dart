import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SigninController {
  BuildContext context;
  SigninController({required this.context});

  Future<String?> handleSignin(
      String type, String email, String password) async {
    String? error = null;
    try {
      if (type == "email") {
        print(email);
        // Uri uri = Uri.parse('htt p://192.18.2.108:3000/api/login?e ma il=$email&password=$password');

        // final response = await get(uri, headers: {
        //   "Connection": "keep-alive",
        // });

        // if (response.statusCode == 200) {
        //   final decoded = jsonDecode(response.body);
        //   print(decoded);

        //   for (var user in decoded) {
        //     if (user['email'] == email && user['password'] == password) {
        //       print('user logged in');
        //       break;
        //     }
        //   }
        // } else {
        //   print('either username or password is wrong');
        // }

        UserCredential credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        if (credential.user == null) {
          error = ("wrong email and password");
        }

        if (credential.user!.emailVerified) {
          error = ("User exists");
        }
      }
    } on FirebaseAuthException catch (e) {
      // TODO

      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        error = ("Either username or password is wrong");
      }
      
      if (e.code == 'invalid-email') {
        error = 'Invalid Email';
      }
    }

    return error;
  }
}
