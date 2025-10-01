import 'package:flutter/material.dart';
import 'package:modern_chat_app/components/my_navbar.dart';
import 'package:modern_chat_app/pages/home_page.dart';
import 'package:modern_chat_app/pages/profile_page.dart';
import 'package:modern_chat_app/pages/settings_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  //this is to control the bottom bar
  int _selectedIndex = 0;

  //this method will update our index
  //when the user taps on the navbar
  void navigateButtomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    //home page
    HomePage(),

    //Profile page
    ProfilePage(),

    //settings page
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyNavBar(
        onTabChange: (index) => navigateButtomBar(index),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,

      body: _pages[_selectedIndex],
    );
  }
}
