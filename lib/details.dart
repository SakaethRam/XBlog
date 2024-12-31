import 'package:flutter/material.dart';
import 'package:xblog/main.dart';
import 'package:xblog/navigation_bar.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 450, // Fixed height for consistency
                  width: double.infinity, // Full width or you can set a fixed width
                  decoration: BoxDecoration(
                    color: Colors.black, // Optional: background color while loading
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/Black_Hunt.jpg", // Replace with your actual asset path
                      ),
                      fit: BoxFit.cover, // Ensures the image fills the container while maintaining its aspect ratio
                    ),
                  ),
                ),


                Container(
                  margin: EdgeInsets.only(top: 75.0),
                  height: 15,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
                  child: Text("Draped in a sleek black trench coat and ribbed turtleneck, the character exudes a commanding aura of mystery and style. "
                      "His confident posture and concealed gaze embody the stealthy, predatory essence of - Black Hunt. ", style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 0.8,
                      fontFamily: 'Merienda',
                    fontWeight: FontWeight.w500,
                    height: 1.5
                  ),),
                )
              ],
            ),

            Positioned(
              top: 27, // Adjust this to set the vertical position
              right: 7.5,  // Adjust this to set the horizontal position
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => NavigationMenu(
                        backgroundContent: Details(),
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.black, // Background color for the circle
                    shape: BoxShape.circle, // Circular background
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(0, 4), // Shadow position
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.menu_open,
                      size: 25.0,
                      color: Colors.white, // Icon color
                    ),
                  ),
                ),
              ),
            ),

            SafeArea(
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black54, // Set the background color for the circle
                  ),
                  padding: EdgeInsets.all(6), // Adjust padding for icon size within the circle
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                  child: Text("\n\n\n\n\n\n\n\n\n\n\n\n>> BLACK HUNT <<", style: TextStyle(
                    fontFamily: 'ModernAntiqua',
                    fontWeight: FontWeight.w500,
                    fontSize: 28
                  ),)
              ),
            ),


          ],
        ),
      ),
    );
  }
}

class DetailsTwo extends StatelessWidget {
  const DetailsTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 450, // Fixed height for consistency
                  width: double.infinity, // Full width or you can set a fixed width
                  decoration: BoxDecoration(
                    color: Colors.black, // Optional: background color while loading
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/Crimson_Red.jpg", // Replace with your actual asset path
                      ),
                      fit: BoxFit.cover, // Ensures the image fills the container while maintaining its aspect ratio
                    ),
                  ),
                ),


                Container(
                  margin: EdgeInsets.only(top: 75.0),
                  height: 15,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
                  child: Text("Draped in a sleek black trench coat and ribbed turtleneck, the character exudes a commanding aura of mystery and style. His confident posture and concealed gaze embody the stealthy, predatory essence of - Crimson Red.", style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 0.8,
                      fontFamily: 'Merienda',
                      fontWeight: FontWeight.w500,
                      height: 1.5
                  ),),
                )
              ],
            ),
            Positioned(
              top: 27, // Adjust this to set the vertical position
              right: 7.5,  // Adjust this to set the horizontal position
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => NavigationMenu(
                        backgroundContent: DetailsTwo(),
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.red.shade900, // Background color for the circle
                    shape: BoxShape.circle, // Circular background
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(0, 4), // Shadow position
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.menu_open,
                      size: 25.0,
                      color: Colors.white, // Icon color
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black54, // Set the background color for the circle
                  ),
                  padding: EdgeInsets.all(6), // Adjust padding for icon size within the circle
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                  child: Text("\n\n\n\n\n\n\n\n\n\n\n\n>> Crimson Red <<", style: TextStyle(
                      fontFamily: 'ModernAntiqua',
                      fontWeight: FontWeight.w500,
                      fontSize: 28
                  ),)
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetailsThree extends StatelessWidget {
  const DetailsThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 450, // Fixed height for consistency
                  width: double.infinity, // Full width or you can set a fixed width
                  decoration: BoxDecoration(
                    color: Colors.black, // Optional: background color while loading
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/Stylish_Brown.jpg", // Replace with your actual asset path
                      ),
                      fit: BoxFit.cover, // Ensures the image fills the container while maintaining its aspect ratio
                    ),
                  ),
                ),


                Container(
                  margin: EdgeInsets.only(top: 75.0),
                  height: 15,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
                  child: Text("Draped in a patterned blazer with subtle brown tones and a sleek black turtleneck, the character exudes refined elegance and modern flair. His composed demeanor and stylish accessories embody effortless confidence and intellectual charm, true to the - Styled Brown theme.", style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 0.8,
                      fontFamily: 'Merienda',
                      fontWeight: FontWeight.w500,
                      height: 1.5
                  ),),
                )
              ],
            ),
            Positioned(
              top: 27, // Adjust this to set the vertical position
              right: 7.5,  // Adjust this to set the horizontal position
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => NavigationMenu(
                        backgroundContent: DetailsThree(),
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.brown.shade800, // Background color for the circle
                    shape: BoxShape.circle, // Circular background
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(0, 4), // Shadow position
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.menu_open,
                      size: 25.0,
                      color: Colors.white, // Icon color
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black54, // Set the background color for the circle
                  ),
                  padding: EdgeInsets.all(6), // Adjust padding for icon size within the circle
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                  child: Text("\n\n\n\n\n\n\n\n\n\n\n\n>> Styled Brown <<", style: TextStyle(
                      fontFamily: 'ModernAntiqua',
                      fontWeight: FontWeight.w500,
                      fontSize: 28
                  ),)
              ),
            )
          ],
        ),
      ),
    );
  }
}

