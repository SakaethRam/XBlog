import 'package:flutter/material.dart';
import 'package:xblog/details.dart';
import 'package:xblog/scroll_search.dart';
import 'package:xblog/settings.dart';



void main(){
  runApp(const XBlogArk3());
  runApp(const XBlogArk2());
  runApp(const XBlog());
}

class XBlog extends StatelessWidget {
  const XBlog({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold(
        body: Stack(  // Stack to overlay MyDraggableSheet over content
          children: [
            // Your existing body content wrapped inside SingleChildScrollView
            SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: ClipOval(
                              child: Image.asset(
                                'assets/X.png', // Replace with the path to your logo PNG
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Continue with the rest of the content
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 400,
                            child: Center(
                              child: RotatedBox(
                                quarterTurns: 3,
                                child: Text("JJK\nBlack Hunt", style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 28.0, fontFamily: 'ModernAntiqua',
                                ),),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 400,
                            color: Colors.black,
                            child: Image.asset(
                              "assets/Black_Hunt.jpg", // Replace with the path to your image
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 350,
                            color: Colors.black,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RotatedBox(
                                  quarterTurns: 3,
                                  child: Text("01",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 28.0, color: Colors.white, fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 20.0),
                                  width: 2,
                                  height: 50.0,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                                  child: Text("Blog:",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 20.0,
                                        fontFamily: 'ModernAntiqua'
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                                  child: Text("En-tangle in the JJk Sorcery Blog: Black Hunt.",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontFamily: 'Merienda'
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Builder(
                                    builder: (context) => GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (BuildContext context) => Details()),
                                        );
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 50,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(color: Colors.black),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        child: Text(
                                          "Read More",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins'
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // MyDraggableSheet goes here, overlaying on top of the content
            MyDraggableSheet(
              child: Column(
                children: [
                  Text("", style: TextStyle(color: Colors.black87, fontSize: 18),),
                  ScrollYBlog(),
                  ScrollZBlog(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class XBlogArk2 extends StatelessWidget {
  const XBlogArk2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold(
        body: Stack(  // Stack to overlay MyDraggableSheet over content
          children: [
            // Your existing body content wrapped inside SingleChildScrollView
            SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: ClipOval(
                              child: Image.asset(
                                'assets/X.png', // Replace with the path to your logo PNG
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    // Continue with the rest of the content
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 400,
                            child: Center(
                              child: RotatedBox(
                                quarterTurns: 3,
                                child: Text("JJK\nCrimson Red", style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 28.0, fontFamily: 'ModernAntiqua',
                                ),),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 400,
                            color: Colors.black,
                            child: Image.asset(
                              "assets/Crimson_Red.jpg", // Replace with the path to your image
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 350,
                            color: Colors.red.shade900,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RotatedBox(
                                  quarterTurns: 3,
                                  child: Text("02",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 28.0, color: Colors.white, fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 20.0),
                                  width: 2,
                                  height: 50.0,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                                  child: Text("Blog:",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 20.0,
                                        fontFamily: 'ModernAntiqua'
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                                  child: Text("En-tangle in the JJk Sorcery Blog: Crimson Red.",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontFamily: 'Merienda'
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Builder(
                                    builder: (context) => GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (BuildContext context) => DetailsTwo()),
                                        );
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 50,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(color: Colors.black),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        child: Text(
                                          "Read More",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins'
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // MyDraggableSheet goes here, overlaying on top of the content
            MyDraggableSheet(
              child: Column(
                children: [
                  Text("", style: TextStyle(color: Colors.black87, fontSize: 18),),
                  ScrollXBlog(),
                  ScrollZBlog(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class XBlogArk3 extends StatelessWidget {
  const XBlogArk3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold(
        body: Stack(  // Stack to overlay MyDraggableSheet over content
          children: [
            // Your existing body content wrapped inside SingleChildScrollView
            SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: ClipOval(
                              child: Image.asset(
                                'assets/X.png', // Replace with the path to your logo PNG
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    // Continue with the rest of the content
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 400,
                            child: Center(
                              child: RotatedBox(
                                quarterTurns: 3,
                                child: Text("JJK\nStyled Brown", style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 28.0, fontFamily: 'ModernAntiqua',
                                ),),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 400,
                            color: Colors.black,
                            child: Image.asset(
                              "assets/Stylish_Brown.jpg", // Replace with the path to your image
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 350,
                            color: Colors.brown.shade800,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RotatedBox(
                                  quarterTurns: 3,
                                  child: Text("03",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 28.0, color: Colors.white, fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 20.0),
                                  width: 2,
                                  height: 50.0,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                                  child: Text("Blog:",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 20.0,
                                        fontFamily: 'ModernAntiqua'
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                                  child: Text("En-tangle in the JJk Sorcery Blog: Styled Brown.",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontFamily: 'Merienda'
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Builder(
                                    builder: (context) => GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (BuildContext context) => DetailsThree()),
                                        );
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 50,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(color: Colors.black),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        child: Text(
                                          "Read More",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins'
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // MyDraggableSheet goes here, overlaying on top of the content
            MyDraggableSheet(
              child: Column(
                children: [
                  Text("", style: TextStyle(color: Colors.black87, fontSize: 18),),
                  ScrollXBlog(),
                  ScrollYBlog(),
                ],
              ), // This will hold the content for the bottom sheet
            ),
          ],
        ),
      ),
    );
  }
}








