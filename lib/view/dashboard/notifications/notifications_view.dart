// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:uhcs_dental_app/ui/molecules/appbar/widgets/app_bar_back_button.dart';
// import 'package:uhcs_dental_app/ui/molecules/appbar/widgets/app_bar_search_icon.dart';
// import 'package:uhcs_dental_app/ui/molecules/bottom_navigation/custom_bottom_navigation.dart';
// import 'package:uhcs_dental_app/utils/app_dismiss_keyboard.dart';
// import 'package:uhcs_dental_app/utils/helpers/app_layout_helpers.dart';
//
//
// import '../../../ui/molecules/app_text/app_text.dart';
// import '../../../ui/molecules/appbar/appbar.dart';
// import '../../../utils/asset_utils.dart';
// import '../../../utils/color_utils.dart';
// import '../../../utils/font_size.dart';
//
//
// class NotificationsView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AppDismissKeyboard(
//         child: Container(
//             height: 100.h,
//             width: 100.w,
//             // decoration: const BoxDecoration(
//             //   image: DecorationImage(
//             //     image: AssetImage(AssetUtils.bg),
//             //     fit: BoxFit.cover,
//             //   ),
//             // ),
//             color: AppColor.white,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//
//                 // ** App Bar ** //
//                 _buildAppBar(
//                     context: context
//                 ),
//
//                 // *** Main Body *** //
//                 _buildBody(context: context),
//
//               ],
//             )
//         ),
//       ),
//     );
//   }
// }
// int buildCounter = 0;
// Widget _buildBody({
//   required BuildContext context,
// }) {
//   buildCounter++;
//   print('Build count: $buildCounter');
//
//   final List<Map<String, String>> notifications = [
//     {
//       "title": "You received a payment of \$780.1 from",
//       "message": "Justin Westervelt",
//       "time": "9:01 am",
//     },
//     {
//       "title": "You received a payment of \$780.1 from",
//       "message": "Justin Westervelt",
//       "time": "9:01 am",
//     },
//     {
//       "title": "You received a payment of \$780.1 from",
//       "message": "Justin Westervelt",
//       "time": "9:01 am",
//     },
//     {
//       "title": "You received a payment of \$780.1 from",
//       "message": "Justin Westervelt",
//       "time": "9:01 am",
//     },
//
//
//
//   ];
//
//   return  Expanded(
//     child: Padding(
//       padding:  EdgeInsets.symmetric(horizontal: cw(24)),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//
//           Expanded(
//             child: ListView.builder(
//               physics: const BouncingScrollPhysics(),
//               itemCount: notifications.length,
//               itemBuilder: (context, index) {
//                 return Container(
//                   color: AppColor.white,
//                   width: cw(375),
//                   height: ch(80),
//
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//
//                       Image.asset(
//                         AssetUtils.notificationAvatar1,
//                         width: cw(48),
//                         height: cw(48),
//                         filterQuality: FilterQuality.high,
//                       ),
//
//
//                       SizedBox(
//                         width: cw(14),
//                       ),
//
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//
//                             AppText(
//                               txt: 'You received a payment of \$780.1 from Justin Westervelt',
//                               fontSize: AppFontSize.f16,
//                               color: AppColor.black,
//                               fontWeight: FontWeight.w400,
//                               lineHeight: 20,
//                               // letterspacing: cw(-0.3),
//                             ),
//
//                             SizedBox(
//                               height: ch(8),
//                             ),
//
//                             AppText(
//                               txt: '9:01am',
//                               fontSize: AppFontSize.f14,
//                               color: AppColor.black ,
//                               fontWeight: FontWeight.w400,
//                               lineHeight: 16,
//                               letterspacing: cw(0.4),
//                             ),
//
//                             SizedBox(
//                               height: ch(8),
//                             ),
//
//                             Divider(
//                               height: 0,
//                               thickness: ch(1),
//                               color: AppColor.cEEEEEE,
//                             ),
//
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//                   // NotificationTile(notification: notifications[index]);
//               },
//             ),
//           ),
//
//         ]
//       ),
//     ),
//   );
// }
//
//
//
// Widget _buildAppBar({
//   required BuildContext context,
// }) {
//
//
//   return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//
//         CustomAppBar(
//
//           backButton: AppBarBackButton(
//               onPressed: (){
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => BottomNavigationBarExample()),
//                 );
//               }
//           ),
//           title: 'Notification',
//           searchIcon: AppBarSearchIcon(
//               onPressed: (){}
//           ),
//
//         ),
//
//       ]
//   );
// }
//
// class NotificationTile extends StatelessWidget {
//   final Map<String, String> notification;
//
//   const NotificationTile({Key? key, required this.notification}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: CircleAvatar(
//         child: Icon(Icons.notifications), // You can customize this icon
//       ),
//       title: Text(notification["title"] ?? ''),
//       subtitle: Text(notification["message"] ?? ''),
//       trailing: Text(notification["time"] ?? ''),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
//
// class NotificationsView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, dynamic>> notifications = [
//       {
//         "title": "Payment Received",
//         "message": "\$780.1 from Justin",
//         "time": DateTime.now().subtract(Duration(hours: 1)), // Today
//       },
//       {
//         "title": "Payment Requested",
//         "message": "\$400 from Lindsey",
//         "time": DateTime.now().subtract(Duration(days: 1)), // Yesterday
//       },
//       {
//         "title": "Payment Sent",
//         "message": "\$250 to Mike",
//         "time": DateTime.now().subtract(Duration(days: 2)), // Earlier
//       },
//     ];
//
//     final groupedNotifications = groupNotifications(notifications);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Notifications'),
//       ),
//       body: ListView(
//         children: [
//           // Today's Notifications
//           if (groupedNotifications['Today']!.isNotEmpty) ...[
//             Text(
//               "Today",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 // padding: EdgeInsets.all(10),
//               ),
//             ),
//             ...groupedNotifications['Today']!.map((notification) => ListTile(
//               title: Text(notification['title']),
//               subtitle: Text(notification['message']),
//             ))
//           ],
//
//           // Yesterday's Notifications
//           if (groupedNotifications['Yesterday']!.isNotEmpty) ...[
//             Text(
//               "Yesterday",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 // padding: EdgeInsets.all(10),
//               ),
//             ),
//             ...groupedNotifications['Yesterday']!.map((notification) => ListTile(
//               title: Text(notification['title']),
//               subtitle: Text(notification['message']),
//             ))
//           ],
//
//           // Earlier Notifications
//           if (groupedNotifications['Earlier']!.isNotEmpty) ...[
//             Text(
//               "Earlier",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 // padding: EdgeInsets.all(10),
//               ),
//             ),
//             ...groupedNotifications['Earlier']!.map((notification) => ListTile(
//               title: Text(notification['title']),
//               subtitle: Text(notification['message']),
//             ))
//           ],
//         ],
//       ),
//     );
//   }
//
//   // Function to group notifications into "Today", "Yesterday", and "Earlier"
//   Map<String, List<Map<String, dynamic>>> groupNotifications(List<Map<String, dynamic>> notifications) {
//     final Map<String, List<Map<String, dynamic>>> grouped = {
//       'Today': [],
//       'Yesterday': [],
//       'Earlier': []
//     };
//
//     DateTime now = DateTime.now();
//
//     for (var notification in notifications) {
//       DateTime time = notification['time'];
//       if (time.day == now.day && time.month == now.month && time.year == now.year) {
//         grouped['Today']!.add(notification);
//       } else if (time.day == now.subtract(Duration(days: 1)).day) {
//         grouped['Yesterday']!.add(notification);
//       } else {
//         grouped['Earlier']!.add(notification);
//       }
//     }
//
//     return grouped;
//   }
// }
//
// void main() {
//   runApp(MaterialApp(home: NotificationsView()));
// }

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uhcs_dental_app/ui/molecules/appbar/widgets/app_bar_back_button.dart';
import 'package:uhcs_dental_app/ui/molecules/appbar/widgets/app_bar_search_icon.dart';
import 'package:uhcs_dental_app/ui/molecules/bottom_navigation/custom_bottom_navigation.dart';
import 'package:uhcs_dental_app/utils/app_dismiss_keyboard.dart';
import 'package:uhcs_dental_app/utils/helpers/app_layout_helpers.dart';
import '../../../ui/molecules/app_text/app_text.dart';
import '../../../ui/molecules/appbar/appbar.dart';
import '../../../utils/asset_utils.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/font_size.dart';
import '../../../utils/routes.dart';

class NotificationsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppDismissKeyboard(
        child: Container(
          height: 100.h,
          width: 100.w,
          color: AppColor.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // ** App Bar ** //
              _buildAppBar(context: context),
              // *** Main Body *** //
              _buildBody(context: context),
            ],
          ),
        ),
      ),
    );
  }
}

int buildCounter = 0;

Widget _buildBody({required BuildContext context}) {
  buildCounter++;
  print('Build count: $buildCounter');

  // Sample notifications with time and data
  final List<Map<String, dynamic>> notifications = [
    {
      "title": "You received a payment of \$780.1 from Justin Westervelt",
      "amount":"\$12.0",
      "message": "Justin Westervelt",
      "image": AssetUtils.notificationAvatar1,
      "isPayButton":false,
      "time": DateTime.now().subtract(Duration(hours: 1)), // Today
    },

    {
      "title": "Lindsey Culhane requested a payment of \$780.1 ",
      "message": "Justin Westervelt",
      "image": AssetUtils.notificationAvatar3,
      "isPayButton":true,
      "time": DateTime.now().subtract(Duration(hours: 3)), // Today
    },
    {
      "title": "You received a payment of \$780.1 from Justin Westervelt",
      "message": "Justin Westervelt",
      "image": AssetUtils.notificationAvatar2,
      "isPayButton":false,
      "time": DateTime.now().subtract(Duration(hours: 1)), // Today
    },
    {
      "title": "You received a payment of \$400 from Lindsey",
      "message": "Lindsey Williamson",
      "image": AssetUtils.notificationAvatar1,
      "isPayButton":false,
      "time": DateTime.now().subtract(Duration(days: 1)), // Yesterday
    },
    {
      "title": "Lindsey Culhane requested a payment of \$780.1 ",
      "message": "Lindsey Williamson",
      "image": AssetUtils.notificationAvatar4,
      "isPayButton":true,
      "time": DateTime.now().subtract(Duration(days: 1)), // Yesterday
    },

    // {
    //   "title": "You sent a payment of \$250 to Mike",
    //   "message": "Mike Doe",
    //   "time": DateTime.now().subtract(Duration(days: 2)), // Earlier
    // },
  ];

  // Group notifications into Today, Yesterday, Earlier
  final groupedNotifications = groupNotifications(notifications);

  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              if (groupedNotifications['Today']!.isNotEmpty) ...[
                _buildSectionHeader("Today"),
                ...groupedNotifications['Today']!
                    .map((notification) => _buildNotificationTile(notification)),
              ],
              if (groupedNotifications['Yesterday']!.isNotEmpty) ...[
                _buildSectionHeader("Yesterday"),
                ...groupedNotifications['Yesterday']!
                    .map((notification) => _buildNotificationTile(notification)),
              ],
              if (groupedNotifications['Earlier']!.isNotEmpty) ...[
                _buildSectionHeader("Earlier"),
                ...groupedNotifications['Earlier']!
                    .map((notification) => _buildNotificationTile(notification)),
              ],
            ],
          ),
        ),
      ],
    ),
  );
}

// Function to build the section header (Today, Yesterday, Earlier)
Widget _buildSectionHeader(String title) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: ch(18),horizontal: cw(24)),
    child: AppText(
      txt: title,
      fontSize: AppFontSize.f15,
      fontWeight: FontWeight.w600,
      color: AppColor.c757575,
      letterspacing: cw(0.1),
    ),
  );
}

// Function to build notification tiles
Widget _buildNotificationTile(Map<String, dynamic> notification) {
  return Container(
    color: AppColor.white,
    padding: EdgeInsets.symmetric(vertical: ch(8)),
    child: Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: cw(24)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                notification['image'] ?? "",
                width: cw(48),
                height: cw(48),
                filterQuality: FilterQuality.high,
              ),
              SizedBox(width: cw(14)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      txt: notification['title'] ?? "",
                      fontSize: AppFontSize.f14,
                      color: AppColor.c082755,
                      fontWeight: FontWeight.w400,
                      lineHeight: 20,
                      letterspacing: cw(0.1),
                    ),
                    SizedBox(height: ch(8)),
                    AppText(
                      txt: _formatTime(notification['time']) ?? "",
                      fontSize: AppFontSize.f12,
                      color: AppColor.black,
                      fontWeight: FontWeight.w400,
                      lineHeight: 16,
                    ),
                    // SizedBox(height: ch(8)),
                    // Divider(
                    //   height: 0,
                    //   thickness: ch(1),
                    //   color: AppColor.cEEEEEE,
                    // ),
                  ],
                ),
              ),
          
              if(notification['isPayButton'])...[
                // ** Pay Button ** //
                Padding(
                  padding:  EdgeInsets.only(right: cw(28)),
                  child: GestureDetector(
                    onTap: (){
          
                    },
                    child: Container(
                      width: cw(55),
                      height: ch(32),
                      decoration: BoxDecoration(
                        color: AppColor.c1573FE,
                        borderRadius: BorderRadius.circular(cw(8)),
                      ),
                      child: Center(
                        child: AppText(
                          txt: 'Pay'.toUpperCase(),
                          fontSize: AppFontSize.f14,
                          fontWeight: FontWeight.w500,
                          color: AppColor.white,
                          lineHeight: 1.3,
                        ),
                      ),
                    ),
                  ),
                ),
              ]
            ],
          ),
        ),
        SizedBox(height: ch(8)),
        Padding(
          padding:  EdgeInsets.only(left: cw(78)),
          child: Divider(
            height: 0,
            thickness: ch(1),
            color: AppColor.cEEEEEE,
          ),
        ),
      ],
    ),
  );
}
//
// Widget _buildNotificationTile(Map<String, dynamic> notification) {
//   return Container(
//     color: AppColor.white,
//     padding: EdgeInsets.symmetric(vertical: ch(8)),
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Image.asset(
//           notification['image'] ?? "",
//           width: cw(48),
//           height: cw(48),
//           filterQuality: FilterQuality.high,
//         ),
//         SizedBox(width: cw(14)),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               RichText(
//                 text: TextSpan(
//                   style: TextStyle(
//                     fontSize: AppFontSize.f16,
//                     color: AppColor.c757575,
//                     fontWeight: FontWeight.w400,
//                     letterSpacing: cw(0.1),
//                   ),
//                   children: <TextSpan>[
//                     TextSpan(text: notification['actionText'] ?? ""), // e.g., "You received a payment of "
//                     TextSpan(
//                       text: notification['amount'] ?? "\$0.0", // e.g., "$780.1"
//                       style: TextStyle(
//                         color: AppColor.black, // Different color for the amount
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     TextSpan(text: " ${notification['from'] ?? ''}"), // e.g., " from Justin Westervelt"
//                   ],
//                 ),
//               ),
//               SizedBox(height: ch(8)),
//               AppText(
//                 txt: _formatTime(notification['time']),
//                 fontSize: AppFontSize.f14,
//                 color: AppColor.black,
//                 fontWeight: FontWeight.w400,
//                 lineHeight: 16,
//               ),
//               SizedBox(height: ch(8)),
//               Divider(
//                 height: 0,
//                 thickness: ch(1),
//                 color: AppColor.cEEEEEE,
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }

// Function to group notifications into "Today", "Yesterday", and "Earlier"
Map<String, List<Map<String, dynamic>>> groupNotifications(
    List<Map<String, dynamic>> notifications) {
  final Map<String, List<Map<String, dynamic>>> grouped = {
    'Today': [],
    'Yesterday': [],
    'Earlier': []
  };

  DateTime now = DateTime.now();

  for (var notification in notifications) {
    DateTime time = notification['time'];
    if (time.day == now.day && time.month == now.month && time.year == now.year) {
      grouped['Today']!.add(notification);
    } else if (time.day == now.subtract(Duration(days: 1)).day) {
      grouped['Yesterday']!.add(notification);
    } else {
      grouped['Earlier']!.add(notification);
    }
  }

  return grouped;
}

// // Helper function to format DateTime into time string (e.g., '9:01 AM')
String _formatTime(DateTime time) {
  return "${time.hour}:${time.minute.toString().padLeft(2, '0')} ${time.hour >= 12 ? 'PM' : 'AM'}";
}
// String _formatTime(DateTime time) {
//   int hour = time.hour % 12 == 0 ? 12 : time.hour % 12; // Convert to 12-hour format
//   String minute = time.minute.toString().padLeft(2, '0'); // Pad minute with '0' if needed
//   String period = time.hour >= 12 ? 'PM' : 'AM'; // Determine AM/PM
//
//   return "$hour:$minute $period";
// }



// App Bar component
Widget _buildAppBar({required BuildContext context}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CustomAppBar(
        backButton: AppBarBackButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.dashboardWithBottomNav);

          },
        ),
        title: 'Notification',
        searchIcon: AppBarSearchIcon(
          onPressed: () {},
        ),
      ),
    ],
  );
}
