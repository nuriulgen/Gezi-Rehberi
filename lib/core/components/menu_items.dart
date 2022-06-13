import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/view/test/model/menu_item.dart';

class MenuItems {
  static const List<MenuItem> itemFirst = [
    itemSettings,
    itemDarkMode,
  ];
  static const List<MenuItem> itemSecond = [
    itemSignOut,
  ];

  static const itemSettings = MenuItem(text: 'Settings', icon: Icons.settings);
  static const itemDarkMode =
      MenuItem(text: 'Dark Mode', icon: CupertinoIcons.moon_stars);
  static const itemSignOut = MenuItem(text: 'Log Out', icon: Icons.logout);
}
