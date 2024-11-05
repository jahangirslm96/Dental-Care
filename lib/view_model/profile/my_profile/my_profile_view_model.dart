import 'package:flutter/material.dart';

class MyProfileViewModel with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners(); // Notify listeners to rebuild UI
  }

  int? _activeTab;
  int get activeTab => _activeTab ?? 0;
  set activeTab(int value) {
    _activeTab = value;
    notifyListeners();
  }
}
