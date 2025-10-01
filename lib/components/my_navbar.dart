import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyNavBar extends StatelessWidget {
  Function(int)? onTabChange;
  MyNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),

      child: GNav(
        color: Theme.of(context).colorScheme.inversePrimary,
        activeColor: Theme.of(context).colorScheme.inverseSurface,

        tabBackgroundColor: Theme.of(context).colorScheme.primary,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        tabBorderRadius: 10,
        onTabChange: (value) => onTabChange!(value),

        tabs: [
          GButton(icon: Icons.home, iconSize: 25, text: ' chat'),
          GButton(icon: Icons.person, iconSize: 25, text: ' profile'),
          GButton(icon: Icons.settings, iconSize: 25, text: ' settings'),
        ],
      ),
    );
  }
}
