// import 'package:audi/ui/Neo/molecules/custom_stepper_two.dart';
// import 'package:audi/utils/Neo/Neo_utils_main.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
//
// Widget extendedAppBarV1({
//   double? appBarHeight,
//   double? appBarWidth,
//   double? titleTopSpacing,
//   bool isDetailedWidgetLeftSpacing = true,
//   required Widget backButton,
//   required Widget title,
//   required Widget closeIcon,
//   required Widget appBarDetailedWidget,
//   bool isStepperTwo = false,
//   Map? stepperOptionsTwo,
// }) {
//   return Container(
//     height: appBarHeight ?? (31.4).h,
//     width: appBarWidth ?? 100.w,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(15),
//       boxShadow: const [
//         BoxShadow(
//           color: AppColor.c8A8A8A,
//           blurRadius: 20,
//           spreadRadius: 0,
//           offset: Offset(0, -12),
//         )
//       ],
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Container(
//           width: 100.w,
//           padding:
//               EdgeInsets.only(left: (6.93).w, right: (7.73).w, top: (8.2).h),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               backButton,
//               Container(
//                 height: (7.4).w,
//                 color: AppColor.transparent,
//                 alignment: Alignment.center,
//                 child: title,
//               ),
//               closeIcon,
//             ],
//           ),
//         ),
//         Container(
//           padding: EdgeInsets.only(
//               left: isDetailedWidgetLeftSpacing ? (6.4).w : 0,
//               top: titleTopSpacing ?? 1.84.h),
//           child: appBarDetailedWidget,
//         ),
//         if (isStepperTwo) ...[
//           Padding(
//             padding: EdgeInsets.only(
//                 top: ch(11), bottom: ch(25), left: cw(22), right: cw(24)),
//             child: CustomStepperTwo(
//               totalSteps: stepperOptionsTwo!["totalSteps"],
//               width: 100.w,
//               curStep: stepperOptionsTwo["curStep"],
//               stepCompleteColor: AppColor.c1D1D1B,
//               currentStepColor: AppColor.c1D1D1B,
//               inactiveColor: AppColor.cDDDDDD,
//               lineHeight: ch(4),
//             ),
//           ),
//         ]
//       ],
//     ),
//   );
// }
