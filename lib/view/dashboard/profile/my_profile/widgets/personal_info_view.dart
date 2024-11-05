import 'package:flutter/material.dart';
import 'package:uhcs_dental_app/ui/molecules/textfields/app_textfield.dart';
import 'package:uhcs_dental_app/utils/font_size.dart';
import 'package:uhcs_dental_app/utils/helpers/app_layout_helpers.dart';

import '../../../../../ui/molecules/app_text/app_text.dart';
import '../../../../../utils/asset_utils.dart';
import '../../../../../utils/color_utils.dart';

class PersonalInfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<Map<String, String>> personalInfoList = [
      {
        "label":"Email",
        "value": "itsmesaleem@gmail.com",
      },
      {
        "label":"Phone",
        "value": "+92 283-234-2324",
      },
      {
        "label":"Date Of Birth",
        "value": "10/10/2000",
      },
      {
        "label":"Country",
        "value": "Pakistan",
      },
      {
        "label":"Zip Code",
        "value": "720001",
      },
      {
        "label":"State",
        "value": "Sindh",
      },{

        "label":"City",
        "value": "Karachi",
      },
      {
        "label":"Address",
        "value": "Johar,block-2 house-232A",
      },
      {
        "label":"Timezone",
        "value": "Asia/Karachi",
      },


    ];

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: cw(13)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              height: ch(24),
            ),

            AppText(
              txt: "Personal Details",
              fontSize: AppFontSize.f15,
              color: AppColor.c082755,
              fontWeight: FontWeight.w600,
              lineHeight: 21,
            ),

            SizedBox(
              height:ch(7),
            ),


            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: personalInfoList.length,
              physics:  const BouncingScrollPhysics(),
              itemBuilder: ((context, index) {
                final isLastItemIndex = index == personalInfoList.length - 1;

                final label = personalInfoList[index]['label'];
                final value = personalInfoList[index]['value'];

                return  _personalInfo(
                  context: context,
                  label: label,
                  value:value,
                  isLastItemIndex: isLastItemIndex,
                );
              }),
            ),


          ],
        ),
      ),
    );
  }
}

Widget _personalInfo({
  required BuildContext context,
  required String? label,
  required String? value,
  required bool isLastItemIndex,
}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.symmetric(vertical: ch(15)),
        width: cw(375),
        decoration: BoxDecoration(
          color: AppColor.white,
          border: Border(
            bottom: BorderSide(
              color: AppColor.c082755,
              width: cw(0.2),
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: cw(16)),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Label
                  Container(
                    width: cw(120), // Fixed width for label alignment
                    child: AppText(
                      txt: label ?? "",
                      fontSize: 14,
                      color: AppColor.c082755,
                      fontWeight: FontWeight.w500,
                      lineHeight: 15,
                    ),
                  ),

                  // Value aligned with padding
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: cw(40)),
                        child: AppText(
                          txt: value ?? "",
                          fontSize: 14,
                          color: AppColor.c082755,
                          fontWeight: FontWeight.w500,
                          lineHeight: 15,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: ch(9)), // Adjust this value for more/less space
            ],
          ),
        ),
      ),

      // Additional space after last item
      if (isLastItemIndex) ...[
        SizedBox(
          height: ch(45.42),
        ),
      ]
    ],
  );
}



// Widget _personalInfo({
//   required BuildContext context,
//   required String? label,
//   required String? value,
//   required bool isLastItemIndex,
// }){
//   return Column(
//     children: [
//       Container(
//         margin: EdgeInsets.symmetric(vertical: ch(15)),
//         width: cw(375),
//         // height: ch(40),
//         decoration: BoxDecoration(
//           color: AppColor.white,
//           border: Border(
//               bottom: BorderSide(
//                   color:AppColor.c082755,
//                   width: cw(0.2)
//               )
//           ),
//         ),
//         child: Padding(
//           padding:  EdgeInsets.symmetric(horizontal: cw(16)),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//
//                   AppText(
//                     txt: label ?? "",
//                     fontSize: 14,
//                     color: AppColor.c082755,
//                     fontWeight: FontWeight.w500,
//                     lineHeight: 15,
//
//                   ),
//
//                   AppText(
//                     txt: value ?? "",
//                     fontSize: 14,
//                     color: AppColor.c082755,
//                     fontWeight: FontWeight.w500,
//                     lineHeight: 15,
//                     textAlign: TextAlign.start,
//
//                   ),
//                 ],
//               ),
//
//               SizedBox(
//                 height: ch(8),
//               ),
//             ],
//           ),
//         ),
//       ),
//
//       if(isLastItemIndex)...[
//         SizedBox(
//           height: ch(45.42),
//         ),
//       ]
//     ],
//   );
// }
