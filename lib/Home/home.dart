import 'package:flutter/material.dart';
import 'package:xblog/Home/blog.dart';
import 'package:xblog/Home/bottom_nav.dart';
import 'package:xblog/Home/favorite.dart';

class HomeSect extends StatefulWidget {
  const HomeSect({super.key});

  @override
  State<HomeSect> createState() => _HomeSectState();
}

class _HomeSectState extends State<HomeSect> {
  //Navigate Bottom Bar
  int _selectedIndex = 0;
  void NavigateBottom(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //Pages
  final List<Widget> _pages = [
    //BLOG PAGES
    BlogPage(),

    //FAVORITE PAGES
    FavoritePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: BottomNav(
        onTabChange: (index) => NavigateBottom(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}

