import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uhcs_dental_app/ui/molecules/textfields/app_textfield.dart';
import 'package:uhcs_dental_app/utils/font_size.dart';
import 'package:uhcs_dental_app/utils/helpers/app_layout_helpers.dart';

import '../../../../../ui/molecules/app_text/app_text.dart';
import '../../../../../utils/asset_utils.dart';
import '../../../../../utils/color_utils.dart';
//
// class ActivitiesView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//
//
//     return SingleChildScrollView(
//       child: Padding(
//         padding:  EdgeInsets.symmetric(horizontal: cw(13)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//
//             SizedBox(
//               height: ch(24),
//             ),
//
//             AppText(
//               txt: "Activities",
//               fontSize: 15,
//               color: AppColor.c082755,
//               fontWeight: FontWeight.w600,
//               lineHeight: 21,
//             ),
//
//             SizedBox(
//               height:ch(9),
//             ),
//
//
//             SvgPicture.asset(
//               AssetUtils.stepper1,
//               width: cw(375),
//               // width: cw(30),
//               // height: cw(22),
//             ),
//
//             // ListView.builder(
//             //   // padding: EdgeInsets.zero,
//             //   shrinkWrap: true,
//             //   itemCount: personalInfoList.length,
//             //   physics:  const BouncingScrollPhysics(),
//             //   itemBuilder: ((context, index) {
//             //     final isLastItemIndex = index == personalInfoList.length - 1;
//             //
//             //     final label = personalInfoList[index]['label'];
//             //     final value = personalInfoList[index]['value'];
//             //
//             //     return  _personalInfo(
//             //       context: context,
//             //       label: label,
//             //       value:value,
//             //     );
//             //   }),
//             // ),
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// Widget _personalInfo({
//   required BuildContext context,
//   required String? label,
//   required String? value,
// }){
//   return Container(
//     width: cw(375),
//     height: ch(35),
//     decoration: BoxDecoration(
//       color: AppColor.white,
//       border: Border(
//           bottom: BorderSide(
//               color:AppColor.c082755,
//               width: cw(0.2)
//           )
//       ),
//     ),
//     child: Padding(
//       padding:  EdgeInsets.symmetric(horizontal: cw(16)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//
//           AppText(
//             txt: label ?? "",
//             fontSize: 14,
//             color: AppColor.c082755,
//             fontWeight: FontWeight.w500,
//             lineHeight: 15,
//
//           ),
//
//           AppText(
//             txt: value ?? "",
//             fontSize: 14,
//             color: AppColor.c082755,
//             fontWeight: FontWeight.w500,
//             lineHeight: 15,
//
//           ),
//         ],
//       ),
//     ),
//   );
// }

import 'package:flutter/material.dart';

class ActivitiesView extends StatelessWidget {
  // Hardcoded list of step data
  // final List<Map<String, String>> stepsData = [
  //   {
  //     'circleColor': 'green',
  //     'title': 'logged in @ Mon, Oct/14/2024',
  //     'time': '2:59 pm',
  //     'date': 'Mon, Oct/14/2024',
  //     // "isFirst":
  //   },
  //   {
  //     'circleColor': 'blue',
  //     'title': 'joined session with Dr.Sana Akhter',
  //     'time': '2:20 pm',
  //     'date': 'Tue, Oct/08/2024',
  //   },
  //   {
  //     'circleColor': 'red',
  //     'title': 'ended session with Dr.Sana Akhter',
  //     'time': '2:20 pm',
  //     'date': 'Tue, Oct/08/2024',
  //   },
  // ];
  final List<Map<String, dynamic>> stepsData = [
    {
      'circleColor': 'green',
      'title': 'logged in @ Mon, Oct/14/2024',
      'time': '2:59 pm',
      'date': 'Mon, Oct/14/2024',
      'isFirst': true,
      'isLast': false, // will be calculated dynamically
    },
    {
      'circleColor': 'blue',
      'title': 'joined session with Dr.Sana Akhter',
      'time': '2:20 pm',
      'date': 'Tue, Oct/08/2024',
      'isFirst': false,
      'isLast': false, // will be calculated dynamically
    },
    {
      'circleColor': 'red',
      'title': 'ended session with Dr.Sana Akhter',
      'time': '2:20 pm',
      'date': 'Tue, Oct/08/2024',
      'isFirst': false,
      'isLast': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: cw(13)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

        SizedBox(
              height: ch(24),
            ),

            AppText(
              txt: "Activities",
              fontSize: AppFontSize.f16,
              color: AppColor.c082755,
              fontWeight: FontWeight.w600,
              lineHeight: 21,
            ),

            SizedBox(
              height:ch(20.4),
            ),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: cw(17)),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: stepsData.length,
                itemBuilder: (context, index) {
                  final step = stepsData[index];
                  final Color circleColor = _getCircleColor(step['circleColor']!);
              
                  return _buildStep(
                    circleColor: circleColor,
                    title: step['title']!,
                    time: step['time']!,
                    date: step['date']!,
                    isFirst: index == 0,
                    isLast: index == stepsData.length - 1,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to convert string color name to actual Color object
  Color _getCircleColor(String colorName) {
    switch (colorName) {
      case 'green':
        return AppColor.c35B518;
      case 'blue':
        return AppColor.c082755;
      case 'red':
        return AppColor.cC80919;
      default:
        return Colors.grey;
    }
  }

  // Custom step widget
  Widget _buildStep({
    required Color circleColor,
    required String title,
    required String time,
    required String date,
    bool isFirst = true,
    bool isLast = true,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            if (!isFirst)
              Container(
                width: cw(0.75),
                height: ch(4),
                color: AppColor.c082755.withOpacity(0.5),
              ),
            Container(
              // width: cw(13.6),
              // height: cw(13.6),
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: circleColor,
              ),
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: circleColor,
                ),
              ),
            ),
            if (!isLast)
              Container(
                width: cw(0.75),
                height: ch(60),
                color: AppColor.c082755.withOpacity(0.5),
              )
            else
              Container(
                width: cw(0.75),
                height: ch(100), // Longer line for the last step
                color: AppColor.c082755.withOpacity(0.5),
              ),
          ],
        ),
        SizedBox(width: cw(11.53)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                txt: time,
                fontSize: AppFontSize.f11,
                color: AppColor.c082755,
                fontWeight: FontWeight.w400,
                lineHeight: 12,
              ),

              SizedBox(height: ch(4)),

              AppText(
                txt: title,
                fontSize: AppFontSize.f14,
                color: AppColor.c082755,
                fontWeight: FontWeight.w600,
                lineHeight: 12,
              ),
              
              SizedBox(height: ch(5)),
              Row(
                children: [
                  SvgPicture.asset(
                    AssetUtils.calendar,
                    width: cw(13),
                    height: cw(13),
                    fit: BoxFit.contain,
                  ),

                  SizedBox(width: cw(5)),

                  AppText(
                    txt: date,
                    fontSize: AppFontSize.f12,
                    color: AppColor.c082755,
                    fontWeight: FontWeight.w400,
                    lineHeight: 9,
                  ),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}



// import 'package:flutter/material.dart';
//
// class ActivitiesView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Custom Stepper'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             _buildStep(
//               circleColor: Colors.green,
//               title: 'logged in @ Mon, Oct/14/2024',
//               time: '2:59 pm',
//               date: 'Mon, Oct/14/2024',
//               isFirst: true, // first step, no top line
//             ),
//             _buildStep(
//               circleColor: Colors.blue,
//               title: 'joined session with Dr.Sana Akhter',
//               time: '2:20 pm',
//               date: 'Tue, Oct/08/2024',
//             ),
//             _buildStep(
//               circleColor: Colors.red,
//               title: 'ended session with Dr.Sana Akhter',
//               time: '2:20 pm',
//               date: 'Tue, Oct/08/2024',
//               isLast: true, // last step, add a longer bottom line
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Custom step widget
//   Widget _buildStep({
//     required Color circleColor,
//     required String title,
//     required String time,
//     required String date,
//     bool isFirst = false,
//     bool isLast = false,
//   }) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Column(
//           children: [
//             // Show the top line only if it's not the first step
//             if (!isFirst)
//               Container(
//                 width: 2,
//                 height: 20,
//                 color: Colors.grey,
//               ),
//             // Circle for the step
//             Container(
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: circleColor,
//               ),
//               child: Container(
//                 width: 12,
//                 height: 12,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: circleColor,
//                 ),
//               ),
//             ),
//             // Show the bottom line, make it longer if it's the last step
//             if (!isLast)
//               Container(
//                 width: 2,
//                 height: 50, // Regular height for intermediate steps
//                 color: Colors.grey,
//               )
//             else
//               Container(
//                 width: 2,
//                 height: 100, // Longer height for the last step
//                 color: Colors.grey,
//               ),
//           ],
//         ),
//         SizedBox(width: 16), // Space between the circle and text
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 time,
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.grey,
//                 ),
//               ),
//               SizedBox(height: 4),
//               Text(
//                 title,
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               SizedBox(height: 4),
//               Row(
//                 children: [
//                   Icon(Icons.calendar_today, size: 12, color: Colors.grey),
//                   SizedBox(width: 4),
//                   Text(
//                     date,
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }



