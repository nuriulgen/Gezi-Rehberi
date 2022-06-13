import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyThemes {
  final themeData = Get.isDarkMode ? ThemeData.dark() : ThemeData.light();
}
