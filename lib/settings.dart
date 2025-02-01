import 'package:flutter/material.dart';
import 'package:xblog/Design//feature_box.dart';

class SetBlog extends StatefulWidget {
  const SetBlog({super.key});

  @override
  State<SetBlog> createState() => _SetBlogState();
}

class _SetBlogState extends State<SetBlog> {

  //Padding Constants
  final double HorizontalPadding = 40;
  final double VerticalPadding = 40;

  //List of Custom Features
  List Feature = [
    //[FeatureName, ImgPath, PowerStatus]
    ["DARK", "assets/X.png", false],
    ["ZENIT", "assets/X.png", false],
    ["HOVER", "assets/X.png", false],
    ["CLONE", "assets/X.png", false],
  ];

  //Power Button Switched
  void PowerSwitchChanged(bool value, int index){
    setState(() {
      Feature[index][2] = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Custom App Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  //User
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_rounded,
                      size: 35,
                      color: Colors.grey[800],
                    ),
                  ),

                ],
              ),
            ),

            const SizedBox(height: 20),
        
            //Welcome Home Screen
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Text("Welcome Homie!", style: TextStyle(fontFamily: 'Poppins'),),
                  Text('ARKIN X', style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Poppins',
                  ),
                  ),
                ],
              ),
            ),


            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Divider(
                  color: Colors.grey[800],
                thickness: 1,
              ),
            ),

            const SizedBox(height: 25),
            //Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text("Custom Space", style: TextStyle(fontFamily: 'Poppins'),),
            ),

            Expanded(
                child: GridView.builder(
                    itemCount: Feature.length,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(25),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.3,
                    ),
                    itemBuilder: (context,index) {
                      return FeatureBox(
                        FeatureName: Feature[index][0],
                        ImgPath: Feature[index][1],
                        PowerStatus: Feature[index][2],
                        onChanged: (value) => PowerSwitchChanged(value, index),
                      );
                    }
                )
            )

          ],
        ),
      ),
    );
  }
}
