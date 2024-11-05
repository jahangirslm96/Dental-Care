// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:uhcs_dental_app/utils/helpers/app_layout_helpers.dart';
//
// import '../../../utils/color_utils.dart';
//
// class CustomSearchTextField<T> extends StatelessWidget {
//   final T provider;
//   final String Function(T) getSearchQuery;
//   final Function(T, String) updateSearchQuery;
//   final Function(T) clearSearchQuery;
//   final String hintText;
//
//   const CustomSearchTextField({
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

class SearchTextField<T> extends StatelessWidget {
  final T provider;
  final String Function(T) getSearchQuery;
  final Function(T, String) updateSearchQuery;
  final Function(T) clearSearchQuery;
  final TextEditingController controller; // Accept controller as a parameter
  final String hintText;

  const SearchTextField({
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
        color: AppColor.cDDE2F3,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0.0, 0.0),
            blurRadius: 20.0,
            spreadRadius: 0.0,
            color: AppColor.black.withOpacity(0.08),
          )
        ],
      ),
      child: Row(
        children: [

          SvgPicture.asset(
            AssetUtils.searchIcon,
            width: cw(15),
            height: ch(15),
            fit: BoxFit.cover,
          ),
          SizedBox(width: cw(11.69)),

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
                  fontSize: AppFontSize.f14,
                  height: 1.3,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding:
                EdgeInsets.only(bottom: 17.55, top: 18),
              ),
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: AppFontSize.f14,
                height: 1.3,
                color: AppColor.c082755
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              controller.clear();
              clearSearchQuery(provider);
            },
            child: SvgPicture.asset(
              AssetUtils.crossIcon,
              width: cw(12),
              height: ch(12),
              fit: BoxFit.cover,
            ),
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
