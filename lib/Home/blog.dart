import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xblog/Design/menu_design.dart';
import 'package:xblog/Home/home.dart';
import 'package:xblog/Models/series.dart';
import 'package:xblog/Models/series_sect.dart';
import 'package:xblog/Models/series_tile.dart';
import 'package:xblog/Themes/drawer.dart';
import 'package:xblog/main.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add Blog to Favorite (Firestore)
  void addFavorite(Series series) async {
    try {
      await _firestore.collection("Favorite").doc(series.id).set(series.toMap());

      // Add locally (if needed)
      Provider.of<SeriesSect>(context, listen: false).addFavorite(series);

      // Event Message
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text(
            'Added to your Favorites Successfully!',
            style: TextStyle(fontSize: 11, fontFamily: 'Poppins'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
      );
    } catch (e) {
      print("Error adding to Firestore: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SeriesSect>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/X.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 50),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => MyDrawer(background: HomeSect()),
                          ),
                        );
                      },
                      icon: CustomPaint(
                        size: const Size(30, 30),
                        painter: MenuIconPainter(iconColor: Theme.of(context).colorScheme.inversePrimary),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Comment styleriez-vous votre shuffle?'.toUpperCase(),
                style: const TextStyle(fontSize: 12, fontFamily: 'Poppins'),
              ),
              const SizedBox(height: 25),

              // List of Blogs
              Expanded(
                child: ListView.builder(
                  itemCount: value.seriesSect.length,
                  itemBuilder: (context, index) {
                    Series eachSeries = value.seriesSect[index];

                    return SeriesTile(
                      series: eachSeries,
                      icon: Icon(Icons.heart_broken, color: Theme.of(context).colorScheme.inversePrimary),
                      onPressed: () => addFavorite(eachSeries),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
