import 'package:flutter/material.dart';
import 'package:xblog/Auth/login_sect.dart';
import 'package:xblog/Home/forum.dart';
import 'package:xblog/Home/home.dart';
import 'package:xblog/Home/profile.dart';
import 'package:xblog/main.dart';
import 'package:xblog/settings.dart';
import 'package:xblog/theme_settings.dart';

class MyDrawer extends StatelessWidget {
  final Widget background; // Page over which the drawer will hover

  MyDrawer({super.key, required this.background});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background page
          background,

          // Drawer Menu
          Align(
            alignment: Alignment.centerLeft,
            child: Drawer(
              backgroundColor: Colors.grey[900],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensures space between header/menu and logout
                children: [
                  Column(
                    children: [

                      const SizedBox(height: 50),
                      // HEADER
                      Center(
                        child: Image.asset(
                          'assets/X.png', // Replace with your logo image path
                          height: 64, // Adjust the size as needed
                          width: 64, // Adjust the size as needed
                          color: Colors.white, // Set the logo color to white
                        ),
                      ),

                      const SizedBox(height: 25),

                      // HOME LIST
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          onTap: () {
                            Navigator.pop(context); // Close the drawer
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    HomeSect(),
                              ),
                            );
                          },
                          title: Text(
                            'H O M E',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                      // HOME LIST
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.chat_bubble_outline,
                            color: Colors.white,
                          ),
                          onTap: () {
                            Navigator.pop(context); // Close the drawer
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ForumSect(),
                              ),
                            );
                          },
                          title: Text(
                            'F O R U M',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                      // PROFILE LIST
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          onTap: () {
                            Navigator.pop(context); // Close the drawer
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProfileSect(),
                              ),
                            );
                          },
                          title: Text(
                            'P R O F I L E',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                      // SETTINGS LIST
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                          onTap: () {
                            Navigator.pop(context); // Close the drawer
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SetXBlog(), // Replace ProfilePage with your profile page widget
                              ),
                            );
                          },
                          title: Text(
                            'S E T T I N G S',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                      // CLOSE
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                          onTap: () {
                            Navigator.pop(context); // Close the drawer
                          },
                          title: Text(
                            'C L O S E',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // LOGOUT LIST - Positioned at the bottom
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.pop(context); // Close the drawer
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                LoginSect(), // Replace XBlog with your logout handling widget/page
                          ),
                        );
                      },
                      title: Text(
                        'L O G O U T',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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
