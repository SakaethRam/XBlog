import 'package:flutter/material.dart';
import 'package:xblog/main.dart';
import 'package:xblog/settings.dart';

class NavigationMenu extends StatefulWidget {
  final Widget backgroundContent; // Background widget to display

  const NavigationMenu({super.key, required this.backgroundContent});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  final bool _isMenuOpen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          // Background content passed from the previous screen
          widget.backgroundContent,

          // Sliding menu overlay
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: _isMenuOpen ? 0 : -250, // Adjust menu width
            top: 0,
            bottom: 0,
            child: Container(
              width: 250,
              decoration: BoxDecoration(
                color: Colors.white, // Background color of the container
                borderRadius: BorderRadius.circular(10), // Optional rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87.withOpacity(0.25), // Shadow color
                    spreadRadius: 5, // How wide the shadow spreads
                    blurRadius: 10, // Blurring effect of the shadow
                    offset: Offset(5, 5), // Shadow position offset (x, y)
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Aligns items to the start (left)
                    children: [
                      // Align the IconButton to the left with padding
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, top: 20.0), // Adjust the position here
                        child: IconButton(
                          icon: const Icon(Icons.close, color: Colors.black),

                          onPressed: () {
                            Navigator.pop(context); // Go back to the main screen
                          },
                        ),
                      ),

                      // Text aligned to the start next to the IconButton

                    ],
                  )
                  ,

                  const Divider(color: Colors.black54),
                  ListTile(
                    title: const Text('>> Black Hunt <<', style: TextStyle(color: Colors.black, fontFamily: 'ModernAntiqua')),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => XBlog()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('>> Crimson Red <<', style: TextStyle(color: Colors.black, fontFamily: 'ModernAntiqua')),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => XBlogArk2()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('>> Styled Brown <<', style: TextStyle(color: Colors.black, fontFamily: 'ModernAntiqua')),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => XBlogArk3()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Settings', style: TextStyle(color: Colors.black, fontFamily: 'ModernAntiqua')),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => SetBlog()),
                      );
                    },
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
