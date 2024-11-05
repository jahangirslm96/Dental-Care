import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uhcs_dental_app/view/splash/splash_screen.dart';
import 'package:uhcs_dental_app/view/walkthrough/walkthrough_view.dart';

import '../../utils/routes.dart';
import '../../view/auth/login/login_screen.dart';


class SplashViewModel with ChangeNotifier {

  // bool _isLoading = true;
  //
  // bool get isLoading => _isLoading;
  //
  // // Simulate some background tasks (e.g., API calls, auth check)
  // Future<void> loadResources(BuildContext context) async {
  //   await Future.delayed(Duration(seconds: 3)); // Simulate loading
  //
  //   _isLoading = false;
  //   notifyListeners();
  //
  //   // Navigate to the next screen after the splash
  //   // Navigator.pushReplacementNamed(context, SplashScreen());
  // }

  // Method to simulate loading and move to the next screen
  Future<void> initializeApp(BuildContext context) async {
    await Future.delayed(Duration(seconds:2)); // Simulate a delay
    // Navigator.pushReplacementNamed(context, '/home'); /
    // / Navigate to HomeScreen
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => LoginScreen()),

    Navigator.pushReplacementNamed(context, Routes.logIn);

  }

}


