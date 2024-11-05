import 'package:flutter/material.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/font_size.dart';
//
// class AppText extends StatelessWidget {
//   AppText({
//     Key? key,
//     required this.txt,
//     this.fontSize,
//     this.fontWeight,
//     this.color,
//     this.fontFamily,
//     this.textAlign,
//     this.height,
//     this.letterspacing,
//     this.wordspacing,
//     this.decoration,
//     this.textStyle,
//     this.maxLines,
//   }) : super(key: key);
//   final String txt;
//   double? fontSize;
//   FontWeight? fontWeight;
//   Color? color;
//   String? fontFamily;
//   TextAlign? textAlign;
//   double? height;
//   TextDecoration? decoration;
//   TextStyle? textStyle;
//   double? letterspacing;
//   double? wordspacing;
//   int? maxLines;
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       txt,
//       maxLines: maxLines ?? 10,
//       textAlign: textAlign ?? TextAlign.start,
//       style: textStyle ??
//           TextStyle(
//               fontFamily: fontFamily ?? "Rubik",
//               fontSize: fontSize ?? AppFontSize.f14,
//               fontWeight: fontWeight ?? FontWeight.w400,
//               color: color ?? AppColor.c101010,
//               height: height ?? 1.0,
//               letterSpacing: letterspacing ?? 0,
//               wordSpacing: wordspacing ?? 0,
//               decoration: decoration ?? TextDecoration.none),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/font_size.dart';

class AppText extends StatelessWidget {
  AppText({
    Key? key,
    required this.txt,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.fontFamily,
    this.textAlign,
    this.lineHeight, // Allowing custom line height
    this.letterspacing,
    this.wordspacing,
    this.decoration,
    this.textStyle,
    this.maxLines,
  }) : super(key: key);

  final String txt;
  double? fontSize; // Can be any size
  FontWeight? fontWeight;
  Color? color;
  String? fontFamily;
  TextAlign? textAlign;
  double? lineHeight; // Allowing line height to be passed
  TextDecoration? decoration;
  TextStyle? textStyle;
  double? letterspacing;
  double? wordspacing;
  int? maxLines;

  @override
  Widget build(BuildContext context) {
    // Default line height can be specified here
    const double defaultLineHeightMultiplier = 1.5; // Default multiplier for line height

    // Determine the effective font size, defaulting to AppFontSize.f14 if not provided
    final double effectiveFontSize = fontSize ?? AppFontSize.f14;

    // Use the provided lineHeight or fall back to the default multiplier
    final double effectiveLineHeightMultiplier = lineHeight ?? defaultLineHeightMultiplier;

    // Calculate the actual line height based on font size and line height multiplier
    final double actualLineHeight = effectiveFontSize * effectiveLineHeightMultiplier;

    return Text(
      txt,
      maxLines: maxLines ?? 10,
      textAlign: textAlign ?? TextAlign.start,
      style: textStyle ??
          TextStyle(
            fontFamily: fontFamily ?? "Poppins",
            fontSize: effectiveFontSize,
            fontWeight: fontWeight ?? FontWeight.w400,
            color: color ?? AppColor.c101010,
            height: effectiveLineHeightMultiplier / effectiveFontSize, // Set height as a multiple
            letterSpacing: letterspacing ?? 0,
            wordSpacing: wordspacing ?? 0,
            decoration: decoration ?? TextDecoration.none,
          ),
    );
  }
}
