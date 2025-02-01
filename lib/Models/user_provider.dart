import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _username = 'No username available';
  bool _isLoading = false;

  String get username => _username;
  bool get isLoading => _isLoading;

  // Update username manually
  void updateUsername(String newUsername) {
    _username = newUsername;
    notifyListeners();
  }

  // Simulate fetching username asynchronously
  Future<void> fetchUsername() async {
    _isLoading = true;
    notifyListeners(); // Notify that loading has started

    // Simulate a delay (e.g., fetching from database or API)
    await Future.delayed(Duration(seconds: 2));

    // Example: Update the username after fetching
    _username = 'FetchedUsername';
    _isLoading = false;
    notifyListeners(); // Notify that loading has completed
  }
}
