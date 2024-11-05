import 'package:flutter/material.dart';

class MyDoctorsViewModel with ChangeNotifier {
  Map<String, bool> _favorites = {}; // Map to track favorite status by appointmentId

  // Check if the appointment is marked as favorite
  bool isFavorite(String appointmentId) {
    return _favorites[appointmentId] ?? false; // If null, default to false
  }

  // Toggle the favorite status
  void toggleFavorite(String appointmentId) {
    // If the appointmentId doesn't exist in the map, initialize it as false
    bool currentStatus = _favorites[appointmentId] ?? false;
    _favorites[appointmentId] = !currentStatus; // Toggle the status
    notifyListeners(); // Notify listeners to rebuild only the icon
  }
}



