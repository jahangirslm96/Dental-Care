import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoginViewModel with ChangeNotifier {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController  passwordController= TextEditingController();
  final TextEditingController  emailController= TextEditingController();

  // Variable to check if both fields are filled
  bool _isNextEnabled = false;
  bool get isNextEnabled => _isNextEnabled;

  // Variable to control password visibility
  bool _obscureText = true;
  bool get obscureText => _obscureText;


  LoginViewModel() {
    // Add listeners to the TextEditingControllers
    usernameController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
    emailController.addListener(_validateForm);
  }

  // Toggle the password visibility
  void togglePasswordVisibility() {
    _obscureText = !_obscureText;
    notifyListeners(); // Notify listeners to rebuild the UI
  }

  void clearTextFields() {
    usernameController.clear();
    passwordController.clear();
    emailController.clear();
    notifyListeners(); // Notifies listeners if needed
  }

  // Validate if both fields have values
  void _validateForm() {
    _isNextEnabled = usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty ;
    notifyListeners(); // This notifies the UI to rebuild
  }

  @override
  void dispose() {
    usernameController.dispose(); // Clean up the controller
    passwordController.dispose(); // Clean up the controller
    super.dispose();              // Call the superclass dispose
  }


}


