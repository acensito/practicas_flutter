import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgetsapp/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navIndex = 0;

  @override
  Widget build(BuildContext context) {

    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: null,
      onDestinationSelected: (value) {
        final menuItem = appMenuItems[value];
        context.push(menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 0, 26, 10),
          child: Text('Menu', style: Theme.of(context).textTheme.headlineSmall),
        ),
        //iteramos las opciones del menu
        ...appMenuItems
        .sublist(0,3)
        .map((item) {
          return NavigationDrawerDestination(
            icon: Icon(item.icon),
            label: Text(item.title),
          );
        }),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 28, vertical: 10),
          child: Divider()
        ),
        Padding(padding: EdgeInsets.fromLTRB(28, 10, 26, 10),
          child: Text('More options', style: Theme.of(context).textTheme.headlineSmall),
        ),
        ...appMenuItems
        .sublist(3)
        .map((item) {
          return NavigationDrawerDestination(
            icon: Icon(item.icon),
            label: Text(item.title),
          );
        }),
      ],
    );
  }
}