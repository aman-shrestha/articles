import 'package:articles/app/modules/favorite/views/favorite_view.dart';
import 'package:articles/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/navbar_controller.dart';

class NavbarView extends StatefulWidget {
  NavbarView({super.key});

  @override
  State<NavbarView> createState() => _NavbarViewState();
}

class _NavbarViewState extends State<NavbarView> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home Screen',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.favorite)),
            label: 'Favorite Article',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        HomeView(),
        FavoriteView(),
      ][currentPageIndex],
    );
  }
}
