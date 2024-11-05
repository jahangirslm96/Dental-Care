import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/font_size.dart';
import '../../../utils/helpers/app_layout_helpers.dart';


class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.onPressed,
    this.text,
    this.textColor,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.isLoading = false,
    this.textStyle,
    this.fontSize,
    this.fontWeight,
    this.buttonStyle,
    this.textDecoration,
    this.color,
    this.buttonColor,
    this.isBorder = false,
    this.borderColor,
    this.borderWidth = 0.5,
    this.isButtonEnable = true, this.letterSpacing, this.borderRadius,
  }) : super(key: key);

  final String? text;
  final Color? textColor;
  final Widget? child;
  final TextStyle? textStyle;
  final Function? onPressed;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final double? fontSize;
  final FontWeight? fontWeight;
  final BoxDecoration? buttonStyle;
  final bool isLoading;
  final TextDecoration? textDecoration;
  final Color? color;
  final Color? buttonColor;
  final bool isBorder;
  final Color? borderColor;
  final double borderWidth;
  final bool isButtonEnable;
  final double? letterSpacing;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading
          ? null
          : () {
              FocusManager.instance.primaryFocus?.unfocus();
              onPressed!();
            },
      child: Container(
        alignment: Alignment.center,
        padding: padding ?? EdgeInsets.zero,
        width: (width ?? cw(295)),
        height: (height ?? ch(54)),
        child: (child != null)
            ? child
            : !isLoading
                ? Text(
                    text!,
                    style: textStyle ??
                        TextStyle(
                          fontSize: fontSize ?? AppFontSize.f18,
                          color: isButtonEnable
                              ? textColor ?? AppColor.white
                              : AppColor.c5B4B4B4,
                          fontWeight: fontWeight ?? FontWeight.w500,
                          decoration: textDecoration ?? TextDecoration.none,
                            fontFamily: "Poppins",
                          letterSpacing: letterSpacing ?? cw(-0.3),
                          height: 1.3
                        ),
                  )
                : SizedBox(
                    height: ch(20),
                    width: cw(20),
                    child:  CircularProgressIndicator(
                        color: AppColor.c00F659),
                  ),
        decoration: buttonStyle ??
            BoxDecoration(
              borderRadius: BorderRadius.circular( borderRadius ??cw(12) ),
              color: isButtonEnable
                  ? buttonColor ?? AppColor.c082755
                  : AppColor.cf5f5f5,
              border: isBorder == true
                  ? Border.all(
                      color: borderColor ?? AppColor.cFFF7EF,
                      width: borderWidth)
                  : null,
            ),
      ),
    );
  }
}




