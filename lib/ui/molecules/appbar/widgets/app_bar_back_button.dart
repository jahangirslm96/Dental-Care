import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uhcs_dental_app/utils/helpers/app_layout_helpers.dart';

import '../../../../utils/asset_utils.dart';
import '../../../../utils/color_utils.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({
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
        color: AppColor.transparent,
        // alignment: Alignment.topCenter,
        child: icon ??
            SvgPicture.asset(
              AssetUtils.blueBackArrow,
              fit: BoxFit.none,
              height: cw(22.95),
              width: cw(22.95),
              // color: isColor ? AppColor.black : AppColor.white,
            ),
      ),
    );
  }
}
