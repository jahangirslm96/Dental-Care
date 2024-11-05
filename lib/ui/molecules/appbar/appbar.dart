import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/font_size.dart';
import '../../../utils/helpers/app_layout_helpers.dart';
import '../app_text/app_text.dart';
//
// Widget appBar({
//   double? appBarHeight,
//   double? appBarWidth,
//   Color? appBarColor,
//   double? borderRadius,
//   EdgeInsets? innerPadding,
//   required Widget backButton,
//   required Widget title,
//   required Widget closeIcon,
// }) {
//   return Container(
//     height: appBarHeight ?? (14.28).h,
//     width: appBarWidth ?? 100.w,
//     decoration: BoxDecoration(
//       color: appBarColor ?? Colors.white,
//       borderRadius: BorderRadius.only(
//         bottomLeft: Radius.circular(borderRadius ?? cw(20)),
//         bottomRight: Radius.circular(borderRadius ?? cw(20)),
//       ),
//     ),
//     padding: innerPadding ??
//         EdgeInsets.only(left: (6.93).w, right: (7.73).w, top: (8.2).h),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         backButton,
//         Container(
//           height: (7.4).w,
//           color: AppColor.transparent,
//           alignment: Alignment.center,
//           child: title,
//         ),
//         closeIcon,
//       ],
//     ),
//   );
// }


// Global AppBar Widget
class CustomAppBar extends StatelessWidget {
  final double? appBarHeight;
  final double? appBarWidth;
  final Color? appBarColor;
  final double? borderRadius;
  final EdgeInsets? innerPadding;
  final Widget backButton;
  final String? title;
  final Widget searchIcon;

  const CustomAppBar({
    Key? key,
    this.appBarHeight,
    this.appBarWidth,
    this.appBarColor,
    this.borderRadius,
    this.innerPadding,
    required this.backButton,
    required this.title,
    required this.searchIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        // this height is the status bar height of android phone //

        // if(Platform.isAndroid)...[
        //   SizedBox(
        //     height: ch(24),
        //   ),
        // ]else if(Platform.isIOS)...[
        //
        //   SizedBox(
        //     height: ch(54),
        //   ),
        //
        // ],

    SizedBox(
        height: ch(24),
      ),

        Container(
          // height: appBarHeight ?? 14.28.h,
          height: appBarHeight ?? cw(60.68),
          width: appBarWidth ?? 100.w,
          decoration: BoxDecoration(
            color: appBarColor ?? AppColor.white,
            // borderRadius: BorderRadius.only(
            //   bottomLeft: Radius.circular(borderRadius ?? cw(20)),
            //   bottomRight: Radius.circular(borderRadius ?? cw(20)),
            // ),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0.0, 4.0),
                blurRadius: 4.0,
                spreadRadius: 0.0,
                color: AppColor.c082755.withOpacity(0.30),
              )
            ],
          ),
          // padding: innerPadding ??
          //     // EdgeInsets.only(left: 6.93.w, right: 7.73.w, top: 8.2.h),
          //     EdgeInsets.only(left: cw(22),right: cw(22),bottom: ch(13.74)),
          padding: innerPadding ?? EdgeInsets.symmetric(horizontal: cw(22)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              backButton,
              Container(
                height: 7.4.w,
                color: AppColor.transparent,
                alignment: Alignment.center,
                child: AppText(
                  txt: title!,
                  fontSize: AppFontSize.f22,
                  color: AppColor.c082755,
                  fontWeight: FontWeight.w600,
                  lineHeight: 28,
                ),
              ),
              searchIcon,
            ],
          ),
        ),
      ],
    );
  }
}
