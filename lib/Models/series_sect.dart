import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xblog/Models/series.dart';

class SeriesSect extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Series List (Static Data)
  final List<Series> _shop = [
    Series(id: '1', name: 'Black Hunt', tag: '#JJK #XPremium', imagePath: 'assets/Stocked.jpg'),
    Series(id: '2', name: 'Crimson Red', tag: '#JJK #XRock', imagePath: 'assets/Stocked.jpg'),
    Series(id: '3', name: 'Styled Brown', tag: '#JJK #BrownBack', imagePath: 'assets/Stocked.jpg'),
  ];

  // User's Favorite List
  List<Series> _userCart = [];

  // Get Series List
  List<Series> get seriesSect => _shop;

  // Get User Cart
  List<Series> get userCart => _userCart;

  // Load Favorites from Firestore (Real-Time Sync)
  void fetchFavorites() {
    _firestore.collection("Favorite").snapshots().listen((snapshot) {
      _userCart = snapshot.docs.map((doc) => Series.fromMap(doc.data() as Map<String, dynamic>)).toList();
      notifyListeners();
    });
  }

  // Add Favorite to Firestore (Avoid Duplicates)
  Future<void> addFavorite(Series series) async {
    try {
      DocumentReference docRef = _firestore.collection("Favorite").doc(series.id);

      // Check if the item already exists
      DocumentSnapshot doc = await docRef.get();
      if (!doc.exists) {
        await docRef.set(series.toMap());
        _userCart.add(series); // Update local list
        notifyListeners();
      }
    } catch (e) {
      print("Error adding to Firestore: $e");
    }
  }

  // Remove Favorite from Firestore
  Future<void> removeFavorite(Series series) async {
    try {
      await _firestore.collection("Favorite").doc(series.id).delete();
      _userCart.removeWhere((item) => item.id == series.id);
      notifyListeners();
    } catch (e) {
      print("Error removing from Firestore: $e");
    }
  }
}
