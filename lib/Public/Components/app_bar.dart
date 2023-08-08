import 'package:flutter/material.dart';

AppBar appBar(String title) {
  return AppBar(
      automaticallyImplyLeading: false,
      leading: null,
      leadingWidth: 0,
      //backgroundColor: Colors.blue,
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          color: Colors.grey,
          height: 1,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ));
}
