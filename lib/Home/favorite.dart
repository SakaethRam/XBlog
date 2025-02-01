import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xblog/Models/series.dart';
import 'package:xblog/Models/series_sect.dart';
import 'package:xblog/Models/series_tile.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  @override
  void initState() {
    super.initState();
    // Load favorites from Firestore when the page initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SeriesSect>(context, listen: false).fetchFavorites();
    });
  }

  // Remove Favorite from Firestore
  void removeFavorite(Series series) async {
    await Provider.of<SeriesSect>(context, listen: false).removeFavorite(series);

    // Event Message
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text(
          'Removed from your Favorites Successfully!',
          style: TextStyle(fontSize: 10, fontFamily: 'Poppins'),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SeriesSect>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // Heading
              Text(
                'Votre liste de favoris'.toUpperCase(),
                style: const TextStyle(fontSize: 20, fontFamily: 'Poppins'),
              ),

              const SizedBox(height: 25),

              // List of Favorite Items
              Expanded(
                child: value.userCart.isEmpty
                    ? const Center(child: Text("No favorites yet!"))
                    : ListView.builder(
                  itemCount: value.userCart.length,
                  itemBuilder: (context, index) {
                    Series eachSeries = value.userCart[index];

                    return SeriesTile(
                      series: eachSeries,
                      onPressed: () => removeFavorite(eachSeries),
                      icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.inversePrimary),
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
