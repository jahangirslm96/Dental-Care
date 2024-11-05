import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/asset_utils.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/font_size.dart';
import '../../../utils/helpers/app_layout_helpers.dart';
import '../app_text/app_text.dart';
//
//
//
// class CustomPrimaryDropdown extends StatelessWidget {
//   final Map dropdownItem;
//   final VoidCallback? onPressHandler;
//
//   const CustomPrimaryDropdown({
//     Key? key,
//     required this.dropdownItem,
//     required this.onPressHandler,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     return GestureDetector(
//       onTap: onPressHandler,
//       child: Row(
//         children: [
//
//
//           SvgPicture.asset(
//             AssetUtils.location1,
//             width: cw(10),
//             height: cw(14.48),
//
//           ),
//
//           SizedBox(
//             width: cw(3.86),
//           ),
//
//           AppText(
//             txt: 'Albama',
//             fontSize: AppFontSize.f16,
//             color: AppColor.c082755,
//             fontWeight: FontWeight.w600,
//             lineHeight: 21,
//           ),
//
//           SizedBox(
//             width: cw(4),
//           ),
//
//           SvgPicture.asset(
//             AssetUtils.dropdownIcon,
//             width: cw(9),
//             height: cw(7),
//
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
/// With Consumer
class CustomPrimaryDropdown<T extends ChangeNotifier> extends StatelessWidget {
  final Map dropdownItem;
  final VoidCallback? onPressHandler;
  final String Function(T provider) selectedState;
  final void Function(T provider, String newState) onStateSelected;

  const CustomPrimaryDropdown({
    Key? key,
    required this.dropdownItem,
    required this.onPressHandler,
    required this.selectedState, // Function to get the selected state from the provider
    required this.onStateSelected, // Function to set the new state in the provider
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDropdown(context);
      },
      child: Row(
        children: [
          SvgPicture.asset(
            AssetUtils.location1,
            width: cw(10),
            height: cw(14.48),
          ),
          SizedBox(width: cw(3.86)),
          // Use Consumer to listen to the passed-in provider dynamically
          Consumer<T>(
            builder: (context, provider, child) {
              return AppText(
                txt: selectedState(provider), // Display the selected state
                fontSize: AppFontSize.f15,
                color: AppColor.c082755,
                fontWeight: FontWeight.w600,
                lineHeight: 21,
              );
            },
          ),
          SizedBox(width: cw(4)),
          SvgPicture.asset(
            AssetUtils.dropdownIcon,
            width: cw(9),
            height: cw(7),
          ),
        ],
      ),
    );
  }

  // Function to show the dropdown menu
  void showDropdown(BuildContext context) {
    final provider = Provider.of<T>(context, listen: false);
    final List<String> states = [
      'Albama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Florida'
      // Add more states here
    ];

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: states.length,
          itemBuilder: (context, index) {
            return ListTile(
              title:
              AppText(
                  txt:states[index],
                      fontSize: AppFontSize.f16,
              ),
              onTap: () {
                // Update selected state in the dynamic provider
                onStateSelected(provider, states[index]);
                Navigator.pop(context);  // Close the dropdown
              },
            );
          },
        );
      },
    );
  }
}

/// With Selector
// class CustomPrimaryDropdown<T extends ChangeNotifier> extends StatelessWidget {
//   final Map dropdownItem;
//   final VoidCallback? onPressHandler;
//   final String Function(T provider) selectedState;
//   final void Function(T provider, String newState) onStateSelected;
//
//   const CustomPrimaryDropdown({
//     Key? key,
//     required this.dropdownItem,
//     required this.onPressHandler,
//     required this.selectedState, // Function to get the selected state from the provider
//     required this.onStateSelected, // Function to set the new state in the provider
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // Use context.select to rebuild only when the selected state changes
//     final selected = context.select<T, String>((provider) => selectedState(provider));
//
//     return GestureDetector(
//       onTap: () {
//         showDropdown(context);
//       },
//       child: Row(
//         children: [
//           SvgPicture.asset(
//             AssetUtils.location1,
//             width: cw(10),
//             height: cw(14.48),
//           ),
//           SizedBox(width: cw(3.86)),
//
//           // Only this part will rebuild when selected state changes
//           AppText(
//             txt: selected,  // Display the selected state
//             fontSize: AppFontSize.f16,
//             color: AppColor.c082755,
//             fontWeight: FontWeight.w600,
//             lineHeight: 21,
//           ),
//
//           SizedBox(width: cw(4)),
//           SvgPicture.asset(
//             AssetUtils.dropdownIcon,
//             width: cw(9),
//             height: cw(7),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Function to show the dropdown menu
//   void showDropdown(BuildContext context) {
//     final provider = Provider.of<T>(context, listen: false);
//     final List<String> states = [
//       'Albama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Florida'
//       // Add more states here
//     ];
//
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return ListView.builder(
//           itemCount: states.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(states[index]),
//               onTap: () {
//                 // Update selected state in the dynamic provider
//                 onStateSelected(provider, states[index]);
//                 Navigator.pop(context);  // Close the dropdown
//               },
//             );
//           },
//         );
//       },
//     );
//   }
// }
