// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:uhcs_dental_app/utils/helpers/app_layout_helpers.dart';
//
// import '../../../utils/color_utils.dart';
//
// class CustomSecondarySearchTextField<T> extends StatelessWidget {
//   final T provider;
//   final String Function(T) getSearchQuery;
//   final Function(T, String) updateSearchQuery;
//   final Function(T) clearSearchQuery;
//   final String hintText;
//
//   const CustomSecondarySearchTextField({
//     Key? key,
//     required this.provider,
//     required this.getSearchQuery,
//     required this.updateSearchQuery,
//     required this.clearSearchQuery,
//     this.hintText = 'Search...', // Default hint text, customizable
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final searchQuery = getSearchQuery(provider);
//
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 12),
//       decoration: BoxDecoration(
//         color: AppColor.cDDE2F3,
//         borderRadius: BorderRadius.circular(cw(6)),
//       ),
//       child: Row(
//         children: [
//           Icon(
//             Icons.search,
//             color: Color(0xFF6D728E),
//           ),
//           SizedBox(width: 8),
//           Expanded(
//             child: TextField(
//               onChanged: (value) {
//                 updateSearchQuery(provider, value);
//               },
//               controller: TextEditingController(text: searchQuery),
//               decoration: InputDecoration(
//                 hintText: hintText,
//                 border: InputBorder.none,
//                 isDense: true,
//                 contentPadding:
//                 EdgeInsets.only(bottom: ch(17.55), top: ch(18)),
//               ),
//               style: TextStyle(
//                 color: Color(0xFF6D728E),
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           if (searchQuery.isNotEmpty) ...[
//             GestureDetector(
//               onTap: () {
//                 clearSearchQuery(provider);
//               },
//               child: Icon(
//                 Icons.clear,
//                 color: Colors.red,
//               ),
//             ),
//           ],
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uhcs_dental_app/utils/font_size.dart';
import '../../../utils/asset_utils.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/helpers/app_layout_helpers.dart';

class SecondarySearchTextField<T> extends StatelessWidget {
  final T provider;
  final String Function(T) getSearchQuery;
  final Function(T, String) updateSearchQuery;
  final Function(T) clearSearchQuery;
  final TextEditingController controller; // Accept controller as a parameter
  final String hintText;

  const SecondarySearchTextField({
    Key? key,
    required this.provider,
    required this.getSearchQuery,
    required this.updateSearchQuery,
    required this.clearSearchQuery,
    required this.controller, // Initialize the controller here
    this.hintText = 'Search...', // Default hint text, customizable
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: cw(20)),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: AppColor.c082755,
          width: cw(0.3)
        ),
      ),
      child: Row(
        children: [

          Expanded(
            child: TextField(
              controller: controller, // Use the passed controller
              onChanged: (value) {
                updateSearchQuery(provider, value);
              },
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 1.3,
                  color: AppColor.c677294
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding:
                EdgeInsets.only(bottom: ch(10), top: ch(10)),
              ),
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: AppFontSize.f16,
                height: 1.3,
                color: AppColor.c082755
              ),
            ),
          ),

          SvgPicture.asset(
            AssetUtils.searchIcon,
            width: cw(19.43),
            height: ch(19.43),
            fit: BoxFit.cover,
            color: AppColor.c082755,
          ),
          // if (controller.text.isNotEmpty)
          //   GestureDetector(
          //     onTap: () {
          //       controller.clear(); // Clear the text field
          //       clearSearchQuery(provider);
          //     },
          //     child: Icon(
          //       Icons.clear,
          //       color: Colors.red,
          //     ),
          //   ),
        ],
      ),
    );
  }
}
