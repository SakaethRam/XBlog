import 'package:flutter/material.dart';

class ProfilePicture extends StatefulWidget {
  @override
  _ProfilePictureState createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  // List of available asset images
  final List<String> _availableImages = [
    "assets/Stocked_\$.jpg",
    "assets/Stocked_\#.jpg",
    "assets/Stocked_\@.jpg",
    "assets/Stocked.jpg",
  ];

  String _selectedImage = "assets/Stocked.jpg"; // Default image
  bool _isExpanded = false; // Flag to control the dropdown

  void _changeImage(String newImage) {
    setState(() {
      _selectedImage = newImage;
      _isExpanded = false; // Close dropdown after selecting an image
    });
  }

  void _toggleDropdown() {
    setState(() {
      _isExpanded = !_isExpanded; // Toggle the dropdown when clicked
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _toggleDropdown,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.25), // Shadow color
                  offset: Offset(3, 4), // Position of the shadow
                  blurRadius: 6, // Blur effect
                  spreadRadius: 1, // How much the shadow spreads
                ),
              ],
              image: DecorationImage(
                image: AssetImage(_selectedImage),
                fit: BoxFit.cover, // Ensures the image fits within the circle
              ),
            ),
          ),
        ),
        SizedBox(height: 15),

        // Add dropdown of profile pictures when _isExpanded is true
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: _isExpanded ? 120 : 0, // Control height for sliding down/up
          child: _isExpanded
              ? Wrap(
            spacing: 10,
            children: _availableImages.map((image) {
              return GestureDetector(
                onTap: () => _changeImage(image),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(2, 4),
                        blurRadius: 6,
                        spreadRadius: 1,
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }).toList(),
          )
              : SizedBox(),
        ),
      ],
    );
  }
}
