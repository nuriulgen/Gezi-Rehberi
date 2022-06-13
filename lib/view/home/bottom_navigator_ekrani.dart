import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../google_maps/maps/google_maps_view.dart';
import 'katki_ekrani.dart';
import 'oylama_ekrani.dart';
import 'profil_ekrani.dart';

class BottomNavigatorPage extends StatefulWidget {
  const BottomNavigatorPage({Key? key}) : super(key: key);

  @override
  _BottomNavigatorPageState createState() => _BottomNavigatorPageState();
}

class _BottomNavigatorPageState extends State<BottomNavigatorPage> {
  var _currentIndex = 0;

  final screens = [
    OylamaSayfasi(),
    GoogleMapsView(),
    Test(),
    ProfilSayfasi(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          children: [
            screens[_currentIndex],
          ],
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.favorite, size: 30),
              title: const Text("Oylama"),
              selectedColor: Colors.purple,
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                CupertinoIcons.placemark_fill,
                size: 30,
              ),
              title: const Text("Harita"),
              selectedColor: Colors.red,
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                CupertinoIcons.add,
                size: 30,
              ),
              title: const Text("Katkı"),
              selectedColor: Colors.indigo,
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.perm_identity,
                size: 30,
              ),
              title: const Text("Profil"),
              selectedColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}
