import 'package:flutter/material.dart';

import '../../../utils/font_size.dart';

class AppRichText extends StatelessWidget {
  AppRichText({Key? key, this.textAlign, required this.childtxt})
      : super(key: key);

  List<InlineSpan> childtxt;
  TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.start,
      maxLines: 5,
      text: TextSpan(
        style: TextStyle(
          fontSize: AppFontSize.f14,
          fontWeight: FontWeight.w400,
          color: Color(0xff9A9A9A),
          fontFamily: 'Nunito',
        ),
        children: childtxt,
      ),
    );
  }
}
