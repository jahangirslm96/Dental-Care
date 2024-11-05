import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../utils/asset_utils.dart';
import '../../../../utils/color_utils.dart';
import '../../../../utils/helpers/app_layout_helpers.dart';



class AppBarSearchIcon extends StatelessWidget {
  const AppBarSearchIcon({
    Key? key,
    required this.onPressed,
    this.icon,
    this.width,
    this.height,
    this.isLoading = false,
    this.isColor = false,
    this.buttonStyle,
  }) : super(key: key);

  final Widget? icon;
  final Function onPressed;
  final double? width;
  final double? height;
  final ButtonStyle? buttonStyle;
  final bool isLoading;
  final bool isColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading
          ? null
          : () {
              FocusManager.instance.primaryFocus?.unfocus();
              onPressed();
            },
      child: Container(
        width: cw(22.95),
        height: cw(22.95),
        color: Colors.transparent,
        child: icon ??
            SvgPicture.asset(
              // AssetUtils.cross,
              AssetUtils.searchIconBlue,
              fit: BoxFit.none,
              height: cw(22.95),
              width: cw(22.95),
              // color: isColor ? AppColor.black : AppColor.white,
            ),
      ),
    );
  }
}
