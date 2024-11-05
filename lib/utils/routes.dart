import 'package:flutter/material.dart';
import 'package:uhcs_dental_app/view/auth/login_info/login_info_screen.dart';
import 'package:uhcs_dental_app/view/auth/register/register_screen.dart';
import 'package:uhcs_dental_app/view/dashboard/all_sessions/all_sessions_view.dart';
import 'package:uhcs_dental_app/view/dashboard/appointment/appointment_view.dart';
import 'package:uhcs_dental_app/view/dashboard/card_details/card_details_view.dart';
import 'package:uhcs_dental_app/view/dashboard/dashboard_main_view/dashboard_main_view.dart';
import 'package:uhcs_dental_app/view/dashboard/medical_history/medical_history_view.dart';
import 'package:uhcs_dental_app/view/dashboard/my_doctors/my_doctors_view.dart';
import 'package:uhcs_dental_app/view/dashboard/notifications/notifications_view.dart';
import 'package:uhcs_dental_app/view/dashboard/payment_method/payment_method_view.dart';
import 'package:uhcs_dental_app/view/dashboard/privacy_and_policy/privacy_and_policy_view.dart';
import 'package:uhcs_dental_app/view/dashboard/profile/my_profile/my_profile_view.dart';
import 'package:uhcs_dental_app/view/e_visit/doctor_details/doctor_details_view.dart';
import 'package:uhcs_dental_app/view/e_visit/online_intake_specialist/online_intake_specialist_view.dart';

import '../ui/molecules/bottom_navigation/custom_bottom_navigation.dart';
import '../view/auth/login/login_screen.dart';
import '../view/splash/splash_screen.dart';

class Routes {

  //** Auth Screens **//
  static const String splash = "/";
  static const String logIn = "/login";
  static const String register = "/register";
  static const String logInInfo = "/logInInfo";

  //** Dashboard Screens **//
  static const String dashboardMain = "/dashboardMain";
  static const String dashboardWithBottomNav = "/dashboardWithBottomNav";
  static const String allSessions = "/allSessions";
  static const String appointment = "/appointment";
  static const String cardDetails = "/cardDetails";
  static const String myDoctors = "/myDoctors";
  static const String notifications = "/notifications";
  static const String paymentMethod = "/paymentMethod";
  static const String privacyAndPolicy = "/privacyAndPolicy";
  static const String myProfile = "/myProfile";
  static const String medicalProfile = "/medicalProfile";

  //** E-Visit Screens **//
  static const String doctorDetails = "/doctorDetails";
  static const String onlineIntakeSpecialist = "/onlineIntakeSpecialist";


  static Map<String, WidgetBuilder> routes = {

    //** Auth Screens **//
    splash: (context) =>  SplashScreen(),
    logIn: (context) =>  LoginScreen(),
    register: (context) =>  RegisterScreen(),
    logInInfo: (context) =>  LoginInfoScreen(),

    //** Dashboard Screens **//
    dashboardMain: (context) =>  DashboardMainView(),
    dashboardWithBottomNav: (context) =>  DashboardScreenWithBottomNav(),
    allSessions: (context) =>  AllSessionsView(),
    appointment: (context) =>  AppointmentView(),
    cardDetails: (context) =>  CardDetailsView(),
    myDoctors: (context) =>  MyDoctorsView(),
    notifications: (context) =>  NotificationsView(),
    paymentMethod: (context) =>  PaymentMethodView(),
    privacyAndPolicy: (context) =>  PrivacyAndPolicyView(),
    myProfile: (context) =>  MyProfileView(),
    // medicalProfile: (context) =>  MedicalScreen(),


    //** E-Visit Screens **//
    doctorDetails: (context) =>  DoctorDetailsView(),
    onlineIntakeSpecialist: (context) =>  OnlineIntakeView(),


  };

  // Handle undefined routes or custom transitions if needed
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {


      //** Auth Screens **//
      case Routes.splash:
        return MaterialPageRoute(builder: (context) =>  SplashScreen());

      case Routes.logIn:
        return MaterialPageRoute(builder: (context) =>  LoginScreen());

      case Routes.register:
        return MaterialPageRoute(builder: (context) =>  RegisterScreen());

      case Routes.logInInfo:
        return MaterialPageRoute(builder: (context) =>  LoginInfoScreen());

      //** Dashboard Screens **//
      case Routes.dashboardMain:
        return MaterialPageRoute(builder: (context) =>  DashboardMainView());

      case Routes.dashboardWithBottomNav:
        return MaterialPageRoute(builder: (context) =>  DashboardScreenWithBottomNav());

      case Routes.allSessions:
        return MaterialPageRoute(builder: (context) =>  AllSessionsView());

      case Routes.appointment:
        return MaterialPageRoute(builder: (context) =>  AppointmentView());

      case Routes.cardDetails:
        return MaterialPageRoute(builder: (context) =>  CardDetailsView());

      case Routes.myDoctors:
        return MaterialPageRoute(builder: (context) =>  MyDoctorsView());

      case Routes.notifications:
        return MaterialPageRoute(builder: (context) =>  NotificationsView());

      case Routes.paymentMethod:
        return MaterialPageRoute(builder: (context) =>  PaymentMethodView());

      case Routes.privacyAndPolicy:
        return MaterialPageRoute(builder: (context) =>  PrivacyAndPolicyView());

      case Routes.myProfile:
        return MaterialPageRoute(builder: (context) =>  MyProfileView());


      //** E-Visit Screens **//
      case Routes.doctorDetails:
        return MaterialPageRoute(builder: (context) =>  DoctorDetailsView());

      case Routes.onlineIntakeSpecialist:
        return MaterialPageRoute(builder: (context) =>  OnlineIntakeView());


      //doctorDetails: (context) =>  DoctorDetailsView(),
    //     onlineIntakeSpecialist: (context) =>  OnlineIntakeView(),

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text('Route not found')),
          ),
        );
    }
  }
}


// --------------------------------------------------------------------------//
//** Route Class with animations ** //
//
// import 'package:flutter/material.dart';
//
// class RouteClass {
//   // Standard navigation without animation (MaterialPageRoute)
//   static Route<dynamic> withoutAnimation(Widget page) {
//     return MaterialPageRoute(
//       builder: (context) => page,
//     );
//   }
//
//   // Navigation with fade-in animation
//   static Route<dynamic> fadeIn(Widget page) {
//     return PageRouteBuilder(
//       pageBuilder: (context, animation, secondaryAnimation) => page,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         const begin = 0.0;
//         const end = 1.0;
//         const curve = Curves.easeInOut;
//
//         final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//         final opacityAnimation = animation.drive(tween);
//
//         return FadeTransition(
//           opacity: opacityAnimation,
//           child: child,
//         );
//       },
//     );
//   }
//
//   // Navigation with slide-from-right animation
//   static Route<dynamic> slideFromRight(Widget page) {
//     return PageRouteBuilder(
//       pageBuilder: (context, animation, secondaryAnimation) => page,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         const begin = Offset(1.0, 0.0);
//         const end = Offset.zero;
//         const curve = Curves.easeInOut;
//
//         final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//         final offsetAnimation = animation.drive(tween);
//
//         return SlideTransition(
//           position: offsetAnimation,
//           child: child,
//         );
//       },
//     );
//   }
// }

// usage of animations route class

// Navigator.push(
// context,
// RouteClass.withoutAnimation(YourNewScreen()),
// );
//
// Navigator.push(
// context,
// RouteClass.fadeIn(YourNewScreen()),
// );
//
// Navigator.push(
// context,
// RouteClass.slideFromRight(YourNewScreen()),
// );
