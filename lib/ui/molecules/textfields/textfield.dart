// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter/material.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
//
// import '../../../utils/color_utils.dart';
// import '../../../utils/font_size.dart';
//
//
// class AppTextField extends StatelessWidget {
//   const AppTextField({
//     Key? key,
//     required this.labelText,
//     this.controller,
//     this.hintText = "",
//     this.prefix,
//     this.suffix,
//     this.obscureText = false,
//     this.keyboardType,
//     this.readOnly = false,
//     this.autofocus = false,
//     this.isDisabled = false,
//     this.onTap,
//     this.hintStyle,
//     this.textStyle,
//     this.labelStyle,
//     this.validator,
//     this.onFieldSubmitted,
//     this.onChanged,
//     this.border,
//     this.focusBorder,
//     this.inputExtraHint,
//     this.enableborder,
//     this.fillColor,
//     this.borderRadius,
//     this.contentPaddingVertical,
//     this.contentPaddingHorizontal,
//     this.floatingLabelStyle,
//     this.floatingLabelBehaviour,
//     this.inputFormatters,
//     this.maxLength,
//     this.textInputAction = TextInputAction.next,
//   }) : super(key: key);
//
//   final String labelText;
//   final String hintText;
//   final Function? inputExtraHint;
//   final InputBorder? border;
//   final InputBorder? enableborder;
//   final InputBorder? focusBorder;
//   final Color? fillColor;
//   final TextStyle? labelStyle;
//   final double? borderRadius;
//   final double? contentPaddingVertical;
//   final double? contentPaddingHorizontal;
//   final TextStyle? floatingLabelStyle;
//   final TextEditingController? controller;
//   final Widget? prefix;
//   final Widget? suffix;
//   final bool obscureText;
//   final bool autofocus;
//   final TextInputType? keyboardType;
//   final bool readOnly;
//   final bool isDisabled;
//   final Function? onTap;
//   final Function? onFieldSubmitted;
//   final Function? onChanged;
//   final TextStyle? hintStyle;
//   final TextStyle? textStyle;
//   final FloatingLabelBehavior? floatingLabelBehaviour;
//   final TextInputAction? textInputAction;
//   final int? maxLength;
//   final List<TextInputFormatter>? inputFormatters;
//   final Function(String)? validator;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       cursorHeight: (2.09).h,
//       controller: controller,
//       obscureText: obscureText,
//       keyboardType: keyboardType,
//       textInputAction: textInputAction,
//       style: textStyle ?? _textStyle(),
//       autofocus: autofocus,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       inputFormatters: inputFormatters,
//       maxLength: maxLength,
//       decoration: InputDecoration(
//         // floatingLabelStyle: floatingLabelStyle ??
//         //     TextStyle(
//         //       color: AppColor.cB5B5B5,
//         //       fontSize: AppFontSize.f14,
//         //       fontFamily: "Nunito",
//         //       fontWeight: FontWeight.w400,
//         //       backgroundColor: AppColor.cDDDDDD,
//         //     ),
//         labelText: labelText,
//         floatingLabelBehavior:
//             floatingLabelBehaviour ?? FloatingLabelBehavior.never,
//         fillColor: fillColor ?? AppColor.white,
//         focusColor: AppColor.blue,
//         filled: true,
//         labelStyle: labelStyle ??
//             TextStyle(
//               color: AppColor.cB5B5B5,
//               fontFamily: "Nunito",
//               fontWeight: FontWeight.w400,
//               fontSize: AppFontSize.f14,
//             ),
//         focusedBorder: focusBorder ??
//             OutlineInputBorder(
//               borderSide: BorderSide(color: AppColor.cDDDDDD, width: (0.266).w),
//               borderRadius: BorderRadius.circular(borderRadius ?? 26.6.w),
//             ),
//         enabledBorder: enableborder ??
//             OutlineInputBorder(
//               borderSide: BorderSide(color: AppColor.cDDDDDD, width: (0.266).w),
//               borderRadius: BorderRadius.circular(borderRadius ?? 26.6.w),
//             ),
//         // isDense: true,
//         contentPadding: EdgeInsets.symmetric(
//           vertical: contentPaddingHorizontal ?? 2.40.h,
//           horizontal: contentPaddingHorizontal ?? 8.26.w,
//         ),
//         // hintText: readOnly ? labelText : hintText,
//         hintStyle: hintStyle ?? _hintStyle(),
//         prefixIcon: prefix != null
//             ? Align(
//                 widthFactor: 1,
//                 heightFactor: 1,
//                 alignment: Alignment.centerLeft,
//                 child: prefix,
//               )
//             : null,
//         suffixIcon: suffix != null
//             ? Align(
//                 widthFactor: 1,
//                 heightFactor: 1,
//                 alignment: Alignment.center,
//                 child: suffix,
//               )
//             : null,
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(26.66.w),
//           borderSide: BorderSide(
//             color: AppColor.cD42F30,
//             width: (0.266).w,
//           ),
//         ),
//         errorStyle: TextStyle(
//           color: AppColor.cD42F30,
//           fontFamily: "Nunito",
//           fontWeight: FontWeight.w400,
//           fontSize: AppFontSize.f10,
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(26.66.w),
//           borderSide: BorderSide(
//             color: AppColor.cD42F30,
//             width: (0.266).w,
//           ),
//         ),
//       ),
//       readOnly: readOnly,
//
//       // if want to validate on text change use below onChanged handler
//       onChanged: onChanged == null ? (val) {} : (val) => onChanged!(val),
//       onTap: () => onTap == null ? null : onTap!(),
//       validator: validator == null ? null : (val) => validator!(val!),
//
//       // onFieldSubmitted:
//       //     onFieldSubmitted == null ? null : (_) => onFieldSubmitted!(_),
//     );
//   }
//
//   TextStyle _textStyle() {
//     return TextStyle(
//       fontWeight: FontWeight.w400,
//       fontSize: AppFontSize.f14,
//       fontFamily: "Nunito",
//       color: AppColor.c101010,
//     );
//   }
//
//   TextStyle _hintStyle() {
//     return TextStyle(
//       color: AppColor.cB5B5B5,
//       fontWeight: FontWeight.w400,
//       fontSize: AppFontSize.f14,
//       fontFamily: "Nunito",
//     );
//   }
// }
