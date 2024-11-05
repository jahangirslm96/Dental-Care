import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uhcs_dental_app/providers/api_integration_provider.dart';
import 'package:uhcs_dental_app/ui/molecules/bottom_navigation/custom_bottom_navigation.dart';
import 'package:uhcs_dental_app/ui/molecules/buttons/app_primary_button.dart';
import 'package:uhcs_dental_app/ui/molecules/drawer/main_drawer.dart';
import 'package:uhcs_dental_app/ui/molecules/slider/slider.dart';
import 'package:uhcs_dental_app/utils/file_picker.dart';
import 'package:uhcs_dental_app/utils/routes.dart';
import 'package:uhcs_dental_app/view/auth/login/login_screen.dart';
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
import 'package:uhcs_dental_app/view/dashboard/profile/my_profile/widgets/activities_view.dart';
import 'package:uhcs_dental_app/view/e_visit/doctor_details/doctor_details_view.dart';
import 'package:uhcs_dental_app/view/splash/splash_screen.dart';
import 'package:uhcs_dental_app/view/walkthrough/walkthrough_view.dart';
import 'package:uhcs_dental_app/view_model/auth/login/login_viewModel.dart';
import 'package:uhcs_dental_app/view_model/auth/login_info/login_info_viewModel.dart';
import 'package:uhcs_dental_app/view_model/auth/register/register_viewModel.dart';
import 'package:uhcs_dental_app/view_model/dashboard/all_sessions/all_sessions_view_model.dart';
import 'package:uhcs_dental_app/view_model/dashboard/dashboard_main/dashboard_main_viewModel.dart';
import 'package:uhcs_dental_app/view_model/dashboard/medical_history/medical_history_view_model.dart';
import 'package:uhcs_dental_app/view_model/dashboard/my_doctors/my_doctors_view_model.dart';
import 'package:uhcs_dental_app/view_model/dashboard/payment_method/payment_method_view_model.dart';
import 'package:uhcs_dental_app/view_model/e_visit/online_intake_specialist/online_intake_specialist_view_model.dart';
import 'package:uhcs_dental_app/view_model/profile/my_profile/my_profile_view_model.dart';
import 'package:uhcs_dental_app/view_model/splash/splash_viewModel.dart';


  void main() {
    runApp(const MyApp());
  }

// void main() {
//   runApp(DevicePreview(
//     enabled: !kReleaseMode,
//     builder: (context) => const MyApp(),
//   )
//   );
// }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return ResponsiveSizer( // Wrap your app in ResponsiveSizer
        builder: (context, orientation, screenType) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => ApiIntegrationHandler()),
              ChangeNotifierProvider(create: (_) => SplashViewModel()),
              ChangeNotifierProvider(create: (_) => LoginViewModel()),
              ChangeNotifierProvider(create: (_) => RegisterViewModel()),
              ChangeNotifierProvider(create: (_) => LoginInfoViewModel()),
              ChangeNotifierProvider(create: (_) => DashboardMainViewModel()),
              ChangeNotifierProvider(create: (_) => DrawerProvider()),
              ChangeNotifierProvider(create: (_) => NavigationProvider()),
              ChangeNotifierProvider(create: (_) => CarouselProvider()),
              ChangeNotifierProvider(create: (_) => PaymentMethodViewModel()),
              ChangeNotifierProvider(create: (_) => MyDoctorsViewModel()),
              ChangeNotifierProvider(create: (_) => MyProfileViewModel()),
              ChangeNotifierProvider(create: (_) => AllSessionsViewModel()),
              ChangeNotifierProvider(create: (_) => OnlineIntakeViewModel()),
              ChangeNotifierProvider(create: (_) => FilePickerProvider()),
              ChangeNotifierProvider(create: (_) => MedicalHistoryViewModel()),
              // ChangeNotifierProvider(create: (_) => ButtonStateProvider()),

            ],
            child: MaterialApp(
              home: MedicalHistoryView(),
              // initialRoute: Routes.splash,
              // onGenerateRoute: Routes.generateRoute,
              debugShowCheckedModeBanner: false,
              title: 'Dental App',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
            ),
          );
        },
      );
    }
  }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    debugPrint('Counter ::: $_counter');
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
