
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/asset_utils.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/font_size.dart';
import '../../../utils/helpers/app_layout_helpers.dart';
import '../app_text/app_text.dart';

class AppSecondaryButton extends StatelessWidget {
  const AppSecondaryButton({
    Key? key,
    required this.onPressHandler,
    required this.buttonText,
    this.child,
    this.isLoading = false,
    this.textStyle,
    this.fontSize,
    this.fontWeight,
    this.buttonStyle,
    this.textDecoration,
    this.color,
    this.buttonIcon,
  }) : super(key: key);

  final String buttonText;
  final Widget? child;
  final Widget? buttonIcon;
  final TextStyle? textStyle;
  final Function onPressHandler;

  final double? fontSize;
  final FontWeight? fontWeight;
  final BoxDecoration? buttonStyle;
  final bool isLoading;
  final TextDecoration? textDecoration;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isLoading ? null : onPressHandler();
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(
            cw(12),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0.0, 3.0),
              blurRadius: 8.0,
              spreadRadius: 0.0,
              color: AppColor.c9D9D9D.withOpacity(0.16),
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: cw(7),
            ),
            Container(
              width: cw(30),
              height: cw(30),
              margin: EdgeInsets.symmetric(vertical: ch(6)),
              decoration: BoxDecoration(
                color: AppColor.c00F659,
                borderRadius: BorderRadius.circular(
                  cw(8),
                ),
              ),
              child: UnconstrainedBox(
                child: SvgPicture.asset(
                  AssetUtils.walletIcon,
                  width: cw(10),
                  height: cw(10),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: cw(17), right: cw(28)),
              child: AppText(
                textStyle: textStyle ??
                    TextStyle(
                      fontSize: fontSize ?? AppFontSize.f13,
                      color: color ?? AppColor.c101010,
                      fontWeight: fontWeight ?? FontWeight.w700,
                      decoration: textDecoration ?? TextDecoration.none,
                      fontFamily: 'Nunito',
                    ),
                txt: buttonText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
