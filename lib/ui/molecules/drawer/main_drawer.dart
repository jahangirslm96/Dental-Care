

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uhcs_dental_app/view/dashboard/all_sessions/all_sessions_view.dart';

import '../../../utils/asset_utils.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/font_size.dart';
import '../../../utils/helpers/app_layout_helpers.dart';
import '../../../view/auth/login/login_screen.dart';
import '../../../view/dashboard/privacy_and_policy/privacy_and_policy_view.dart';
import '../app_text/app_text.dart';

class DrawerProvider with ChangeNotifier {
  String selectedItem = "Dashboard"; // Default selected item

  void updateSelectedItem(String item) {
    selectedItem = item;
    notifyListeners();
  }
}

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: cw(299),
      child: Container(
        color: AppColor.c2C4262,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ** Drawer Header ** //
            _drawerHeader(context),

            // ** Drawer List and Logout Button ** //
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Drawer List Items
                    _buildDrawerList(context),
                
                SizedBox(
                  height: ch(69),
                ),

                    _logoutButton(context),


                    SizedBox(
                      height: ch(29),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _logoutButton(BuildContext context){
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: cw(24)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              AssetUtils.logout,
              width: cw(24),
              height: cw(24),
              fit: BoxFit.contain,
            ),

            SizedBox(
              width: cw(27),
            ),
            AppText(
              txt: 'Logout',
              fontSize: AppFontSize.f20,
              color: AppColor.white,
              fontWeight: FontWeight.w500,
              lineHeight: 23.7,
            ),

          ],
        ),
      ),);

  }

  Widget _drawerHeader(BuildContext context) {
    return SizedBox(
      // height: ch(100 + 61),
      height: ch(100 + 41),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: cw(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ch(24 + 28)),

            // ** Profile ** //
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: cw(44),
                    height: cw(44),
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(cw(60))),
                    child: Center(
                      child: Image.asset(
                        AssetUtils.drawerProfile,
                        // width: cw(7),
                        // height: ch(12.71),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  width: cw(12),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    AppText(
                      txt: 'Saleem Saeed',
                      fontSize: AppFontSize.f16,
                      color: AppColor.white,
                      fontWeight: FontWeight.w600,
                      lineHeight: 24,
                      letterspacing: cw(-0.3),
                    ),

                    SizedBox(
                      height: ch(1),
                    ),


                    // ** phone icon and phone number ** //
                    Row(
                      children: [

                        SvgPicture.asset(
                          AssetUtils.phoneIcon,
                          width: cw(10),
                          height: ch(10),
                          fit: BoxFit.cover,
                        ),

                        SizedBox(
                          width: cw(2),
                        ),
                        AppText(
                          txt: '123-123-1232',
                          fontSize: AppFontSize.f15,
                          color: AppColor.white,
                          fontWeight: FontWeight.w400,
                          lineHeight: 14.22,
                          letterspacing: cw(-0.3),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildDrawerList(BuildContext context) {
    final List<Map<String, dynamic>> drawerItems = [
      {
        "title": "Dashboard",
        "image": AssetUtils.dashboardHomeIcon,
        "onTap": () {
        },
      },
      {
        "title": "Medical Profile",
        "image": AssetUtils.medicalProfile,
        "onTap": () {
        },
      },
      {
        "title": "E-Visit",
        "image": AssetUtils.eVisitWhite,
        "onTap": () {
        },
      },
      {
        "title": "Charts",
        "image": AssetUtils.charts,
        "onTap": () {
        },
      },
      {
        "title": "Sessions Record",
        "image": AssetUtils.sessionsRecord,
        "onTap": () {
          Navigator.pop(context);

          Future.delayed(Duration(milliseconds: 100), () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AllSessionsView()),
            );
          });
        },
      },
      {
        "title": "Appointment",
        "image": AssetUtils.appointment,
        "onTap": () {
        },
      },
      {
        "title": "Privacy & Policy",
        "image": AssetUtils.privacyPolicy,
        "onTap": () {

          // Close the drawer and wait for it to close before pushing the new route
          Navigator.pop(context);

          Future.delayed(Duration(milliseconds: 100), () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PrivacyAndPolicyView()),
            );
          });

        },
      },
      {
        "title": "Help Center",
        "image": AssetUtils.helpCenter,
        "onTap": () {
        },
      },
      {
        "title": "Settings",
        "image": AssetUtils.settings,
        "onTap": () {
        },
      },
    ];

    final selectedItem = Provider.of<DrawerProvider>(context).selectedItem;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: drawerItems.length ,
      itemBuilder: (context, index) {
        final item = drawerItems[index];
        final isSelected = selectedItem == item['title'];


        return Padding(
          padding: EdgeInsets.only(left: cw(20),right: cw(60)),
          child: Container(
            // width: cw(),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColor.white.withOpacity(0.1)
                  : AppColor.c2C4262,
              borderRadius: BorderRadius.circular(cw(6))
            ),
            child: ListTile(
              leading: SvgPicture.asset(
                item["image"]!,
                width: cw(21.42),
                height: cw(17.14),
                fit: BoxFit.contain,
                color: AppColor.white,
              ),
              title: AppText(
                txt: item["title"]!,
                fontSize: AppFontSize.f16,
                color: AppColor.white,
                fontWeight: FontWeight.w400,
                lineHeight: 22.5,
                letterspacing: cw(-0.3),
              ),
              trailing: SvgPicture.asset(
                AssetUtils.forwardBlueArrow,
                width: cw(7.4),
                height: cw(12),
                fit: BoxFit.cover,
                color: AppColor.white,
              ),

              selected: isSelected,
              // selectedTileColor: isSelected
              //     ? AppColor.c2C4262
              //     : Colors.white, // Background color when selected
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(cw(10)),
              ),

              onTap: () {
                Provider.of<DrawerProvider>(context, listen: false)
                    .updateSelectedItem(item['title']);
                item['onTap']();
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }
}





