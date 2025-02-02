import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNav({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        color: Colors.grey[400],
          mainAxisAlignment: MainAxisAlignment.center,
          activeColor: Colors.grey[700],
          tabBackgroundColor: Colors.grey.shade300,
          tabBorderRadius: 20,
          tabActiveBorder: Border.all(color: Colors.black),
          tabs: [
        GButton(icon: Icons.home, text: 'HOME'),

        GButton(icon: Icons.heart_broken, text: 'préféré'.toUpperCase()),

      ]),
    );
  }
}
