import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/asset_utils.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/font_size.dart';
import '../../../utils/helpers/app_layout_helpers.dart';
import '../app_text/app_text.dart';

class DisabledTextField extends StatelessWidget {
  const DisabledTextField({
    Key? key,
    this.labelText = '',
    this.isDisabled = true,
    this.disableColor = AppColor.transparent,
    this.disableTextColor = AppColor.c082755,
    this.isLabelIcon = false,
    this.isLabelText = false,
    this.controller,
    this.prefixIcon,
    this.suffixText,  // Changed to accept suffixText
    this.onTap,
    this.validator,
    this.onChanged,
    this.maxLength,
    this.inputFormatters,
    this.textInputAction,
    this.keyboardType,
    this.textStyle,
    this.labelColor,
    this.labelFontSize,
    this.labelFontWeight,
    this.autoFocus = false,
    this.fillColor,
    this.borderRadius,
    this.hintText,
    this.obscureText = false,
    this.isTextFieldError = false,
    this.errorText = "",
    this.isUserInteracted = false,
  }) : super(key: key);

  final String labelText;
  final bool isDisabled;
  final String? hintText;
  final Color? disableColor;
  final Color? disableTextColor;
  final bool isLabelIcon;
  final bool isLabelText;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final String? suffixText;  // New property for suffix text
  final Function? onChanged;
  final Function? onTap;
  final Function(String)? validator;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Color? labelColor;
  final double? labelFontSize;
  final FontWeight? labelFontWeight;
  final TextStyle? textStyle;
  final bool autoFocus;
  final Color? fillColor;
  final bool obscureText;
  final double? borderRadius;
  final bool isTextFieldError;
  final String errorText;
  final bool isUserInteracted;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: cw(327),
            padding: EdgeInsets.symmetric(horizontal: cw(16)),
            decoration: BoxDecoration(
              color: isDisabled
                  ? disableColor ?? AppColor.cf5f5f5
                  : fillColor ?? AppColor.transparent,
              border: Border(
                bottom: BorderSide(
                  color: isDisabled
                      ? AppColor.cCAC4D0
                      : AppColor.cCAC4D0,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: ch(16),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (isLabelText) ...[
                      AppText(
                        txt: labelText,
                        color: labelColor ?? AppColor.c101010,
                        fontSize: labelFontSize ?? AppFontSize.f13,
                        fontWeight: labelFontWeight ?? FontWeight.w400,
                      ),
                    ],
                    if (isLabelIcon) ...[
                      SizedBox(
                        width: cw(4),
                      ),
                      Container(
                        width: cw(16),
                        height: cw(16),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColor.c101010,
                            width: cw(1.5),
                          ),
                        ),
                        child: UnconstrainedBox(
                          child: SvgPicture.asset(
                            AssetUtils.walletIcon,
                            width: cw(2.67),
                            height: ch(9.33),
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                    ]
                  ],
                ),
                TextFormField(
                  controller: controller,
                  readOnly: isDisabled,
                  inputFormatters: inputFormatters,
                  maxLength: maxLength,
                  keyboardType: keyboardType,
                  textInputAction: textInputAction,
                  autofocus: autoFocus,
                  obscureText: obscureText,
                  style: textStyle ?? TextStyle(
                    color: disableTextColor ?? AppColor.c677294,
                    fontSize: AppFontSize.f16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Poppins",
                    letterSpacing: cw(-0.3),
                  ),
                  decoration: InputDecoration(
                    counterText: "",
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: hintText ?? 'Please enter',
                    hintStyle: TextStyle(
                      fontSize: AppFontSize.f16,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins",
                      color: AppColor.black.withOpacity(0.7),
                      letterSpacing: cw(-0.3),
                    ),
                    prefixIconConstraints: const BoxConstraints(),
                    isDense: true,
                    contentPadding:
                    EdgeInsets.only(bottom: ch(16), top: ch(10)),
                    prefixIcon: prefixIcon,
                    suffixIcon: suffixText != null ? Padding(
                      padding:  EdgeInsets.only(right: 8.0,top: ch(10)),
                      child: Text(
                        suffixText!,
                        style: TextStyle(
                          color: disableTextColor ?? AppColor.c082755,
                          fontSize: AppFontSize.f16,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ) : null,
                  ),
                  onChanged: onChanged == null ? (val) {} : (val) => onChanged!(val),
                  onTap: () => onTap == null ? null : onTap!(),
                  validator: validator == null ? null : (val) => validator!(val!),
                ),
              ],
            ),
          ),
          if (isTextFieldError && isUserInteracted) ...[
            SizedBox(height: ch(8)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: cw(16)),
              child: AppText(
                txt: errorText,
                color: AppColor.cE95858,
                fontSize: AppFontSize.f13,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ],
      ),
    );
  }
}
