import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navIndex,
      children: [
        NavigationDrawerDestination(icon: Icon(Icons.home), label: Text('Home')),
        NavigationDrawerDestination(icon: Icon(Icons.settings), label: Text('Settings')),
        NavigationDrawerDestination(icon: Icon(Icons.info), label: Text('About')),
      ],
    );
  }
}