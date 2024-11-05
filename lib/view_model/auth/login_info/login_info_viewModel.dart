import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoginInfoViewModel with ChangeNotifier {

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController  passwordController= TextEditingController();
  final TextEditingController  confirmPasswordController= TextEditingController();

  // Variable to check if both fields are filled
  bool _isNextEnabled = false;
  bool get isNextEnabled => _isNextEnabled;

  bool? _isCompanyHoldAccount;

  bool? get isCompanyHoldAccount => _isCompanyHoldAccount;

  // When setting the value, we call notifyListeners to update the UI
  set isCompanyHoldAccount(bool? value) {
    _isCompanyHoldAccount = value;
    notifyListeners();
  }

  // Function to toggle the value safely, considering null as false
  void toggleCompanyHoldAccount() {
    _isCompanyHoldAccount = !(_isCompanyHoldAccount ?? false);
    notifyListeners();  // This will refresh the UI
  }

  LoginInfoViewModel() {
    // Add listeners to the TextEditingControllers
    usernameController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
  }


  void clearTextFields() {
    usernameController.clear();
    passwordController.clear();
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


