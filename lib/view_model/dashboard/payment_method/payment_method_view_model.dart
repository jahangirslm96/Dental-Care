import 'package:flutter/material.dart';

class PaymentMethodViewModel with ChangeNotifier {
  List<Map<String, String>> savedCards = [
    {'logo': 'assets/mastercard_logo.png', 'cardNumber': '************113123'},
    // {'logo': 'assets/visa_logo.png', 'cardNumber': '************567890'},
    // {'logo': 'assets/amex_logo.png', 'cardNumber': '************987654'},
  ];

  String _selectedCard = '';

  String get  selectedCard => _selectedCard;

  void selectCard(String cardNumber) {
    _selectedCard = cardNumber;
    notifyListeners(); // Notify listeners about the change.
  }
}
