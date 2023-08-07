import 'package:flutter/material.dart';

Widget socialIcons(String iconName) {
    return GestureDetector(
      onTap: () {},
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Image.asset('assets/icons/$iconName.png'),
      ),
    );
  }