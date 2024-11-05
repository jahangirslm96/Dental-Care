import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/font_size.dart';
import '../../../utils/helpers/app_layout_helpers.dart';


class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton(
      {Key? key,
      required this.onPressed,
      this.text,
      this.child,
      this.width,
      this.trailingIconSpaceWidth,
      this.height,
      this.isLoading = false,
      this.textStyle,
      this.fontSize,
      this.fontWeight,
      this.buttonStyle,
      this.padding,
      this.textDecoration,
      this.trailingIcon,
      this.isTrailingIcon = false,
      this.borderRadius,
      this.borderWidth})
      : super(key: key);

  final String? text;
  final TextStyle? textStyle;
  final Function onPressed;
  final double? width;
  final double? trailingIconSpaceWidth;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final BoxDecoration? buttonStyle;
  final bool isLoading;
  final Widget? child;
  final EdgeInsets? padding;
  final TextDecoration? textDecoration;
  final bool isTrailingIcon;
  final Widget? trailingIcon;
  final double? borderWidth;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: padding ?? EdgeInsets.zero,
        height: (height ?? ch(56)),
        width: (width ?? (87.2).w),
        child: Row(
          mainAxisAlignment: isTrailingIcon
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            if (child != null) ...[
              child!
            ] else ...[
              Text(
                text!,
                style: textStyle ??
                    TextStyle(
                      fontSize: fontSize ?? AppFontSize.f14,
                      color: AppColor.c1D1D1B,
                      fontWeight: fontWeight ?? FontWeight.w600,
                      fontFamily: 'Nunito',
                      decoration: textDecoration ?? TextDecoration.none,
                    ),
              ),
            ],
            if (isTrailingIcon) ...[
              SizedBox(width: cw(trailingIconSpaceWidth ?? 35)),
              trailingIcon!
            ],
          ],
        ),
        decoration: buttonStyle ??
            BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius ?? (4.26).w),
                border: Border.all(
                  width: borderWidth ?? (0.266).w,
                  color: AppColor.c1D1D1B,
                )),
      ),
      onTap: isLoading
          ? null
          : () {
              FocusManager.instance.primaryFocus?.unfocus();
              onPressed();
            },
    );
  }
}
