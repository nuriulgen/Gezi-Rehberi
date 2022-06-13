import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.black, size: 25),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    title: Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
