import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/asset_utils.dart';

class AppCheckbox extends StatelessWidget {
  final VoidCallback onChange;
  bool isChecked;
  final double? size;
  final double? boxPadding;
  final double? iconHeight;
  final double? iconWidth;
  final Color? selectedColor;
  final Color? selectedIconColor;
  final Color? borderColor;
  final Icon? checkIcon;
  final VoidCallback? onPress;

  AppCheckbox(
      {required this.isChecked,
      required this.onChange,
      this.size,
      this.boxPadding,
      this.iconHeight,
      this.iconWidth,
      this.selectedColor,
      this.selectedIconColor,
      this.borderColor,
      this.onPress,
      this.checkIcon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChange();
        isChecked != isChecked;
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          color: selectedColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: isChecked ? Colors.white : borderColor ?? Color(0xffCE7B28),
            width: 1,
          ),
        ),
        width: size ?? 2.9.h,
        height: size ?? 2.9.h,
        child: isChecked
            ? SvgPicture.asset(
                AssetUtils.tick,
                height: iconHeight ?? 2.9.h,
                width: iconWidth ?? 2.9.h,
                //   color: selectedIconColor ?? Colors.white,
              )
            : null,
      ),
    );
  }
}
