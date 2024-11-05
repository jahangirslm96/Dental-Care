import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/helpers/app_layout_helpers.dart';

Widget extendedAppBar({
  double? appBarHeight,
  double? appBarWidth,
  double? titleTopSpacing,
  bool isDetailedWidgetLeftSpacing = true,
  required Widget backButton,
  required Widget title,
  required Widget closeIcon,
  required Widget appBarDetailedWidget,
}) {
  return Container(
    margin: EdgeInsets.only(bottom: ch(12)),
    height: appBarHeight ?? (31.4).h,
    width: appBarWidth ?? 100.w,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: const [
        BoxShadow(
          color: AppColor.c8A8A8A,
          blurRadius: 20,
          spreadRadius: 0,
          offset: Offset(0, -12),
        )
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 100.w,
          padding:
              EdgeInsets.only(left: (6.93).w, right: (7.73).w, top: (8.2).h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backButton,
              Container(
                height: (7.4).w,
                color: AppColor.transparent,
                alignment: Alignment.center,
                child: title,
              ),
              closeIcon,
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(
                left: isDetailedWidgetLeftSpacing ? (6.4).w : 0,
                top: titleTopSpacing ?? 1.84.h),
            child: appBarDetailedWidget,
          ),
        ),
      ],
    ),
  );
}
