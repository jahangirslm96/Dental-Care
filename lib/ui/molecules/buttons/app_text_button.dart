import 'package:flutter/material.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/font_size.dart';
import '../../../utils/helpers/app_layout_helpers.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width,
    this.height,
    this.isLoading = false,
    this.textStyle,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.lineHeight,
    this.letterSpacing,
  });

  final String text;
  final TextStyle? textStyle;
  final Function onPressed;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? letterSpacing;
  final FontWeight? fontWeight;
  final Color? textColor;
  final bool isLoading;
  final double? lineHeight; // Allowing line height to be passed

  @override
  Widget build(BuildContext context) {
    const double defaultLineHeightMultiplier = 1.5;
    final double effectiveFontSize = fontSize ?? AppFontSize.f14;
    final double effectiveLineHeightMultiplier = lineHeight ?? defaultLineHeightMultiplier;

    return GestureDetector(
      onTap: isLoading
          ? null
          : () {
              FocusManager.instance.primaryFocus?.unfocus();
              onPressed();
            },
      child: Text(
        text,
        style: textStyle ??
            TextStyle(
              fontSize: fontSize ?? AppFontSize.f14,
              color: textColor ?? AppColor.c35B518,
              height: effectiveLineHeightMultiplier / effectiveFontSize, // Set height as a multiple
              fontFamily: 'Rubik',
              fontWeight: fontWeight ?? FontWeight.w600,
              letterSpacing: letterSpacing ?? cw(1),

            ),
      ),
    );
  }
}


