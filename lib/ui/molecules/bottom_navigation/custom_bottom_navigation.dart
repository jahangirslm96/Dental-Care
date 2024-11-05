import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uhcs_dental_app/utils/font_size.dart';
import 'package:uhcs_dental_app/utils/helpers/app_layout_helpers.dart';
import 'package:uhcs_dental_app/view/auth/login/login_screen.dart';
import 'package:uhcs_dental_app/view/auth/register/register_screen.dart';

import '../../../utils/asset_utils.dart';
import '../../../utils/color_utils.dart';
import '../../../view/dashboard/appointment/appointment_view.dart';
import '../../../view/dashboard/dashboard_main_view/dashboard_main_view.dart';
import '../../../view/dashboard/my_doctors/my_doctors_view.dart';
import '../../../view/dashboard/profile/my_profile/my_profile_view.dart';
import '../app_text/app_text.dart';
import '../drawer/main_drawer.dart';

class NavigationProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}


class DashboardScreenWithBottomNav extends StatefulWidget {
  @override
  _DashboardScreenWithBottomNavState createState() => _DashboardScreenWithBottomNavState();
}

class _DashboardScreenWithBottomNavState extends State<DashboardScreenWithBottomNav> {
  // Cache the pages
  final List<Widget> _pages = [
    DashboardMainView(),
    AppointmentView(),
    MyDoctorsView(),
    MyProfileView(),
  ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Bottom Navigation Bar'),
//       // ),
//       body: Consumer<NavigationProvider>(
//         builder: (context, navigationProvider, child) {
//           // Only this part rebuilds when the selected index changes
//           return _pages[navigationProvider.selectedIndex];
//         },
//       ),
//       bottomNavigationBar: Consumer<NavigationProvider>(
//         builder: (context, navigationProvider, child) {
//           return BottomNavigationBar(
//             currentIndex: navigationProvider.selectedIndex,
//             onTap: (index) {
//               navigationProvider.setIndex(index);
//             },
//             items: const [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.search),
//                 label: 'Search',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person),
//                 label: 'Profile',
//               ),
//             ],
//             // Customize the colors
//             selectedItemColor: Colors.blue,  // Color for the selected icon and text
//             unselectedItemColor: Colors.grey,
//           );
//         },
//       ),
//     );
//   }
// }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Color getIconColor(int index, NavigationProvider navigationProvider) {
    return navigationProvider.selectedIndex == index ? AppColor.c082755 : AppColor.c999999;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MainDrawer(),
      body: Consumer<NavigationProvider>(
        builder: (context, navigationProvider, child) {
          // Add animation between page transitions
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300), // Animation duration
            child: _pages[navigationProvider.selectedIndex],
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
          );
        },
      ),
      bottomNavigationBar: Consumer<NavigationProvider>(
        builder: (context, navigationProvider, child) {
          return SizedBox(
            height: ch(85),
            child: BottomNavigationBar(
              backgroundColor: AppColor.white,
              type: BottomNavigationBarType.fixed,
              currentIndex: navigationProvider.selectedIndex,
              onTap: (index) {
                navigationProvider.setIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    AssetUtils.dashboardNav,
                    width: cw(30),
                    height: cw(20),
                    color: getIconColor(0, navigationProvider), // Set color based on selection
                    filterQuality: FilterQuality.high,
                  ),
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    AssetUtils.appoint,
                    width: cw(30),
                    height: cw(22),
                    color: getIconColor(1, navigationProvider), // Set color based on selection
                    filterQuality: FilterQuality.high,
                  ),
                  label: 'Appointment',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    AssetUtils.myDocNav,
                    width: cw(30),
                    height: cw(22),
                    color: getIconColor(2, navigationProvider), // Set color based on selection
                    filterQuality: FilterQuality.high,
                  ),
                  label: 'My Doctors',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    AssetUtils.profileImg,
                    width: cw(30),
                    height: cw(22),
                    color: getIconColor(3, navigationProvider), // Set color based on selection
                    filterQuality: FilterQuality.high,
                  ),
                  label: 'Profile',
                ),
              ],
              // Customize colors for selected and unselected items
              selectedItemColor: AppColor.c082755, // Color for the selected icon and text
              unselectedItemColor: AppColor.c999999,
              selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: AppFontSize.f12,
                height: 2,
                fontFamily: "Poppins",
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: AppFontSize.f12,
                height: 2,
                fontFamily: "Poppins",
              ),
            ),
          );
        },
      ),
    );
  }
}