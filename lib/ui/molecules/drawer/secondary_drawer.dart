// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:uhcs_dental_app/view/auth/login/login_screen.dart';
//
// import '../../../utils/asset_utils.dart';
// import '../../../utils/color_utils.dart';
// import '../../../utils/font_size.dart';
// import '../../../utils/helpers/app_layout_helpers.dart';
// import '../app_text/app_text.dart';
//
// class DrawerProvider with ChangeNotifier {
//   String selectedItem = "Dashboard";
//
//   void updateSelectedItem(String item) {
//     selectedItem = item;
//     notifyListeners();
//   }
// }
//
// class SecondaryDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//
//
//     return Drawer(
//       width:cw(300) ,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//           // ** Drawer Header ** //
//           _drawerHeader(
//             context
//           ),
//
//           //** Drawer List Items **//
//           _buildDrawerList(
//             context,
//           ),
//
//
//         ],
//       ),
//     );
//   }
//
//   Widget _drawerHeader(BuildContext context){
//     return Container(
//       height: ch(250),
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage(AssetUtils.drawerBg),
//           fit: BoxFit.cover,
//           filterQuality: FilterQuality.high,
//         ),
//       ),
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: cw(16)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//
//             SizedBox(
//               height: ch(24 + 28),
//             ),
//             // ** Back Button **//
//             Align(
//               alignment: Alignment.centerLeft,
//               child: GestureDetector(
//                 onTap: (){
//
//                   Navigator.pop(context);
//
//
//                 },
//                 child: Container(
//                   width: cw(30),
//                   height: cw(30),
//                   decoration: BoxDecoration(
//                       color: AppColor.white,
//                       borderRadius: BorderRadius.circular(cw(10))
//                   ),
//                   child: Center(
//                     child: SvgPicture.asset(
//                       AssetUtils.backArrow,
//                       width: cw(7),
//                       height: ch(12.71),
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//             SizedBox(
//               height: ch(20),
//             ),
//
//             SvgPicture.asset(
//               AssetUtils.uhcsLogo,
//               width: cw(186.14),
//               height: ch(99.32),
//               fit: BoxFit.cover,
//             ),
//
//             SizedBox(
//               height: ch(3.58),
//             ),
//
//             AppText(
//               txt: 'Dashboard'.toUpperCase(),
//               fontSize: AppFontSize.f23,
//               color: AppColor.c082755,
//               fontWeight: FontWeight.w600,
//               lineHeight: 42,
//               letterspacing: cw(-0.3),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   Widget _buildDrawerList(BuildContext context) {
//     final List<Map<String, dynamic>> drawerItems = [
//       {
//         "title": "Dashboard",
//         "image": AssetUtils.dashboardHomeIcon,
//         "onTap": () {
//
//         },
//       },
//       {
//         "title": "E-Visit",
//         "image": AssetUtils.eVisitWhite,
//         "onTap": () {
//
//         },
//       },
//       {
//         "title": "Appointment",
//         "image": AssetUtils.appointment,
//         "onTap": () {
//           print("Navigate to Profile");
//           // Add your navigation logic for Profile here
//         },
//       },
//       {
//         "title": "Profile",
//         "image": AssetUtils.profile,
//         "onTap": () {
//           print("Navigate to Settings");
//           // Add your navigation logic for Settings here
//         },
//       },
//       {
//         "title": "Charts",
//         "image": AssetUtils.charts,
//         "onTap": () {
//         },
//       },{
//         "title": "Sessions Record",
//         "image": AssetUtils.sessionsRecord,
//         "onTap": () {
//
//         },
//       },{
//         "title": "Orders",
//         "image": AssetUtils.orders,
//         "onTap": () {
//           print("Navigate to Messages");
//           // Add your navigation logic for Messages here
//         },
//       },{
//         "title": "Account Settings",
//         "image": AssetUtils.accountSettings,
//         "onTap": () {
//           print("Navigate to Messages");
//           // Add your navigation logic for Messages here
//         },
//       },
//       // Add other items as needed
//     ];
//
//     final selectedItem = Provider.of<DrawerProvider>(context).selectedItem;
//
//     return Expanded(
//       child: ListView.builder(
//         itemCount: drawerItems.length + 1, // Increase count by 1 for the Logout item
//         itemBuilder: (context, index) {
//           if (index < drawerItems.length) {
//             // Render drawer items
//             final item = drawerItems[index];
//             final isSelected = selectedItem == item['title'];
//
//             return Padding(
//               padding: EdgeInsets.symmetric(horizontal: cw(20)),
//               child: ListTile(
//                 // tileColor: Colors.red,
//                 leading: Container(
//                   width: cw(32.45),
//                   height: ch(31.96),
//                   decoration: BoxDecoration(
//                     color: AppColor.c082755,
//                     borderRadius: BorderRadius.circular(cw(4)),
//                   ),
//                   child: Center(
//                     child: SvgPicture.asset(
//                       item["image"]!,
//                       width: cw(21.42),
//                       height: cw(17.14),
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//                 title: AppText(
//                   txt: item["title"]!,
//                   fontSize: AppFontSize.f16,
//                   color: AppColor.c082755,
//                   fontWeight: FontWeight.w600,
//                   lineHeight: 22.5,
//                   letterspacing: cw(-0.3),
//                 ),
//                 trailing: SvgPicture.asset(
//                   AssetUtils.forwardBlueArrow,
//                   width: cw(7.4),
//                   height: cw(12),
//                   fit: BoxFit.cover,
//                 ),
//                 selected: isSelected,
//                 onTap: () {
//                   // Update the selected item on tap
//                   Provider.of<DrawerProvider>(context, listen: false)
//                       .updateSelectedItem(item['title']);
//
//                   // Execute the item's custom onTap function
//                   item['onTap']();
//
//                   // Close the drawer after selection
//                   Navigator.pop(context);
//                 },
//               ),
//             );
//           } else {
//             // Render Logout item
//             return Column(
//               children: [
//                 Padding(
//                   padding:  EdgeInsets.only(top: ch(20.52)),
//                   child: GestureDetector(
//                     onTap: (){
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => LoginScreen()),
//                       );
//                     },
//                     child: Padding(
//                       padding:  EdgeInsets.symmetric(horizontal: cw(40)),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           SvgPicture.asset(
//                             AssetUtils.logoutBackButton,
//                             width: cw(24),
//                             height: cw(24),
//                             fit: BoxFit.contain,
//                           ),
//
//                           SizedBox(
//                             width: cw(5),
//                           ),
//                           AppText(
//                             txt: 'LOG OUT'.toUpperCase(),
//                             fontSize: AppFontSize.f18,
//                             color: AppColor.red,
//                             fontWeight: FontWeight.w400,
//                             lineHeight: 27,
//                           ),
//
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(
//                   height: ch(56),
//                 ),
//               ],
//             );
//           }
//         },
//       ),
//     );
//   }
//
//
//   // Widget _buildDrawerList(BuildContext context) {
//   //   final List<Map<String, dynamic>> drawerItems = [
//   //     {
//   //       "title": "Dashboard",
//   //       "image": AssetUtils.dashboardHomeIcon,
//   //       "onTap": () {
//   //         print("Navigate to Dashboard");
//   //         // Add your navigation logic for Dashboard here
//   //       },
//   //     },
//   //     {
//   //       "title": "E-Visit",
//   //       "image": AssetUtils.startEVisit,
//   //       "onTap": () {
//   //         print("Navigate to Appointment");
//   //         // Add your navigation logic for Appointment here
//   //       },
//   //     },
//   //     {
//   //       "title": "Profile",
//   //       "image": AssetUtils.dashboardHomeIcon,
//   //       "onTap": () {
//   //         print("Navigate to Profile");
//   //         // Add your navigation logic for Profile here
//   //       },
//   //     },
//   //     {
//   //       "title": "Profile",
//   //       "image": AssetUtils.dashboardHomeIcon,
//   //       "onTap": () {
//   //         print("Navigate to Profile");
//   //         // Add your navigation logic for Profile here
//   //       },
//   //     },
//   //     {
//   //       "title": "Profile",
//   //       "image": AssetUtils.dashboardHomeIcon,
//   //       "onTap": () {
//   //         print("Navigate to Profile");
//   //         // Add your navigation logic for Profile here
//   //       },
//   //     },
//   //   ];
//   //
//   //   final selectedItem = Provider.of<DrawerProvider>(context).selectedItem;
//   //
//   //   return Expanded(
//   //     child: ListView.builder(
//   //       itemCount: drawerItems.length,
//   //       itemBuilder: (context, index) {
//   //         final item = drawerItems[index];
//   //         final isSelected = selectedItem == item['title'];
//   //         final isLastItem = index == (drawerItems.length - 1);
//   //         return Padding(
//   //           padding:  EdgeInsets.symmetric(horizontal: cw(20)),
//   //           child: ListTile(
//   //             tileColor: Colors.red,
//   //             leading: Container(
//   //               width: cw(32.45),
//   //               height: ch(31.96),
//   //               decoration: BoxDecoration(
//   //                 color: AppColor.c082755,
//   //                 borderRadius: BorderRadius.circular(cw(4)),
//   //               ),
//   //               child: Center(
//   //                 child: SvgPicture.asset(
//   //                   item["image"]!,
//   //                   width: cw(21.42),
//   //                   height: cw(17.14),
//   //                   fit: BoxFit.contain,
//   //                 ),
//   //               ),
//   //             ),
//   //             title: AppText(
//   //               txt: item["title"]!,
//   //               fontSize: AppFontSize.f16,
//   //               color: AppColor.c082755,
//   //               fontWeight: FontWeight.w600,
//   //               lineHeight: 22.5,
//   //               letterspacing: cw(-0.3),
//   //             ),
//   //             trailing: SvgPicture.asset(
//   //               AssetUtils.forwardBlueArrow,
//   //               width: cw(7.4),
//   //               height: cw(12),
//   //               fit: BoxFit.cover,
//   //             ),
//   //             selected: isSelected,
//   //             onTap: () {
//   //               // Update the selected item on tap
//   //               Provider.of<DrawerProvider>(context, listen: false).updateSelectedItem(item['title']);
//   //
//   //               // Execute the item's custom onTap function
//   //               item['onTap']();
//   //
//   //               // Close the drawer after selection
//   //               Navigator.pop(context);
//   //             },
//   //
//   //           ),
//   //         );
//   //       },
//   //     ),
//   //   );
//   // }
//
//
// }
