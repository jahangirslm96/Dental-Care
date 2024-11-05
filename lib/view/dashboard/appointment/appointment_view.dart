import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uhcs_dental_app/ui/molecules/appbar/widgets/app_bar_back_button.dart';
import 'package:uhcs_dental_app/ui/molecules/appbar/widgets/app_bar_search_icon.dart';
import 'package:uhcs_dental_app/ui/molecules/bottom_navigation/custom_bottom_navigation.dart';
import 'package:uhcs_dental_app/utils/app_dismiss_keyboard.dart';
import 'package:uhcs_dental_app/utils/app_strings.dart';
import 'package:uhcs_dental_app/utils/helpers/app_layout_helpers.dart';
import 'package:uhcs_dental_app/view/dashboard/payment_method/payment_method_view.dart';


import '../../../ui/molecules/app_text/app_text.dart';
import '../../../ui/molecules/appbar/appbar.dart';
import '../../../utils/asset_utils.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/font_size.dart';
import '../../../utils/routes.dart';


class AppointmentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppDismissKeyboard(
        child: Container(
            height: 100.h,
            width: 100.w,
            color: AppColor.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                // ** App Bar ** //
                _buildAppBar(
                    context: context
                ),

                // *** Main Body *** //
                _buildBody(
                    context: context
                ),

              ],
            )
        ),
      ),
    );
  }
}
int buildCounter = 0;
Widget _buildBody({
  required BuildContext context,
}) {

  List<Map<String, String>> appointmentInfo = [
    {
      "date": "10-Jun-2024",
      "time": "16:00 CST",
      "name":"Dr. Ana",
      "appointmentId":"UAP-438628",
      "drImage":AssetUtils.drAvatar,
      "status":"unpaid",
    },
    {
      "date": "06-Jun-2024",
      "time": "17:00 CST",
      "name":"Dr. Jenna",
      "appointmentId":"UAP-4386656",
      "drImage":AssetUtils.drAvatar,
      "status":"paid",
    },
    {
      "date": "25-Dec-2024",
      "time": "15:00 CST",
      "name":"Dr. Jhon Leigh",
      "appointmentId":"UAP-4383445",
      "drImage":AssetUtils.drAvatar,
      "status":"paid",
    },

  ];


  buildCounter++;

  return  Expanded(
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: cw(17)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SizedBox(
              height: ch(29.26),
            ),
      
      
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: appointmentInfo.length,
              physics:  const BouncingScrollPhysics(),
              itemBuilder: ((context, index) {
                // final isLastItemIndex = index == appointmentInfo.length - 1;

                final date = appointmentInfo[index]['date'];
                final time = appointmentInfo[index]['time'];
                final name = appointmentInfo[index]['name'];
                final appointmentId = appointmentInfo[index]['appointmentId'];
                final drImage = appointmentInfo[index]['drImage'];
                final status = appointmentInfo[index]['status'];

                return  _appointmentCard(
                  context: context,
                  date: date,
                  time: time,
                  name: name,
                  appointmentId:appointmentId ,
                  drImage: drImage,
                  status:status,
                );
              }),
            ),
      
      
      
      
          ]
        ),
      ),
    ),
  );
}

Widget _appointmentCard({
  required BuildContext context,
  required String? date,
  required String? time,
  required String? name,
  required String? appointmentId,
  required String? drImage,
  required String? status,
}){

  return Container(
    margin: EdgeInsets.only(bottom: ch(10)),
    width: cw(375),
    // height: ch(147),
    height: ch(157),
    decoration: BoxDecoration(
      color: AppColor.white,
      borderRadius: BorderRadius.circular(cw(12)),
      border: Border.all(
        color: AppColor.c082755,
        width: cw(0.3),
      ),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0.0, 4.0),
          blurRadius: 4.0,
          spreadRadius: 2.0,
          color: AppColor.c082755.withOpacity(0.30),
        )
      ],
    ),
    child: Row(
      children: [
        // ** Blue Divider ** //
        SizedBox(
          height: ch(115.82),
          child: VerticalDivider(
            width: cw(3.9),
            thickness: ch(3.9),
            color: AppColor.c082755,
          ),
        ),

        SizedBox(width: cw(1)),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: cw(12.04)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(
                      height: ch(16.16),
                    ),
                    // Appointment Date Label
                    AppText(
                      txt: AppStrings.appointmentDate,
                      fontSize: AppFontSize.f12,
                      color: AppColor.c082755,
                      fontWeight: FontWeight.w500,
                      lineHeight: 13.8,
                    ),

                    SizedBox(height: ch(4.57)),

                    // Appointment Info (Date, Time, Dot)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AssetUtils.appointTimer,
                          width: cw(14.6),
                          height: cw(14.6),
                          fit: BoxFit.contain,
                        ),

                        SizedBox(width: cw(8.94)),

                        AppText(
                          txt: date ?? "",
                          fontSize: AppFontSize.f11,
                          color: AppColor.c082755,
                          fontWeight: FontWeight.w600,
                          lineHeight: 12.6,
                        ),

                        SizedBox(width: cw(5)),

                        SvgPicture.asset(
                          AssetUtils.dot,
                          width: cw(4),
                          height: cw(4),
                          fit: BoxFit.contain,
                        ),

                        SizedBox(width: cw(5.42)),

                        AppText(
                          txt: time ?? "",
                          fontSize: AppFontSize.f11,
                          color: AppColor.c082755,
                          fontWeight: FontWeight.w600,
                          lineHeight: 12.6,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: ch(5)),

              // ** THIS WILL ALIGN THE APPOINTMENT TEXT TO THE RIGHT **
              Flexible(
                child: Padding(
                  padding:  EdgeInsets.only(right: cw(20)),
                  child: Row(
                    children: [
                      const Spacer(), // Push the text to the right
                      AppText(
                        txt: AppStrings.status,
                        fontSize: AppFontSize.f11,
                        color: AppColor.c082755,
                        fontWeight: FontWeight.w500,
                        lineHeight: 13.8,
                      ),

                      SizedBox(width: cw(20)),

                      SvgPicture.asset(
                        AssetUtils.dot,
                        width: cw(4),
                        height: cw(4),
                        fit: BoxFit.contain,
                      ),

                      SizedBox(width: cw(20)),

                      AppText(
                        txt: AppStrings.action,
                        fontSize: AppFontSize.f11,
                        color: AppColor.c082755,
                        fontWeight: FontWeight.w500,
                        lineHeight: 13.8,
                      ),
                    ],
                  ),
                ),
              ),


              SizedBox(
                height: ch(5),
              ),
              // Divider without padding
              SizedBox(
                width: cw(340),
                child: Divider(
                  height: ch(0.43),
                  thickness: ch(0.43),
                  color: AppColor.black,
                ),
              ),


              SizedBox(
                height: ch(14.07),
              ),

              // Doctor info row
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: cw(12.1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Doctor Info
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        // Dr Picture
                        Container(
                          height: cw(49),
                          width: cw(49),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            drImage ?? "",
                            // width: cw(30),
                            // height: cw(22),
                            filterQuality: FilterQuality.high,
                          ),
                        ),

                        SizedBox(width: cw(13.75)),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            AppText(
                              txt: name ?? "",
                              fontSize: AppFontSize.f15,
                              color: AppColor.c082755,
                              fontWeight: FontWeight.w600,
                              lineHeight: 20.45,
                            ),

                            SizedBox(
                              height: ch(5),
                            ),

                            AppText(
                              txt: AppStrings.appointmentID,
                              fontSize: AppFontSize.f11,
                              color: AppColor.c082755,
                              fontWeight: FontWeight.w500,
                              lineHeight: 13.8,
                            ),

                            SizedBox(
                              height: ch(4),
                            ),

                            AppText(
                              txt: appointmentId ?? "",
                              fontSize: AppFontSize.f11,
                              color: AppColor.c082755,
                              fontWeight: FontWeight.w500,
                              lineHeight: 12.6,
                            ),
                          ],
                        ),
                      ],
                    ),


                    // ** Unpaid and Pay Button ** //
                    if(status!.toLowerCase() == 'unpaid')...[
                      Row(
                        children: [


                          Container(
                            width: cw(45),
                            height: ch(18),
                            decoration: BoxDecoration(
                                color: AppColor.cC80919,
                                borderRadius: BorderRadius.circular(cw(6))
                            ),
                            child: Center(
                              child: AppText(
                                txt: 'UNPAID',
                                fontSize: AppFontSize.f12,
                                color: AppColor.white,
                                fontWeight: FontWeight.w500,
                                lineHeight: 13.8,
                              ),
                            ),
                          ),

                          SizedBox(width: cw(31)),

                          GestureDetector(
                            onTap: (){

                              Navigator.pushNamed(context, Routes.paymentMethod);

                            },
                            child: Container(
                              width: cw(45),
                              height: ch(18),
                              decoration: BoxDecoration(
                                  color: AppColor.c1573FE,
                                  borderRadius: BorderRadius.circular(cw(6))
                              ),
                              child: Center(
                                child: AppText(
                                  txt: 'PAY',
                                  fontSize: AppFontSize.f12,
                                  color: AppColor.white,
                                  fontWeight: FontWeight.w500,
                                  lineHeight: 13.8,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),

                    ],
                    // ** Paid Button ** //

                    if(status!.toLowerCase() == 'paid')...[
                      Container(
                        width: cw(121),
                        height: ch(20),
                        decoration: BoxDecoration(
                            color: AppColor.c35B518,
                            borderRadius: BorderRadius.circular(cw(6))
                        ),
                        child: Center(
                          child: AppText(
                            txt: 'PAID',
                            fontSize: AppFontSize.f12,
                            color: AppColor.white,
                            fontWeight: FontWeight.w500,
                            lineHeight: 13.8,
                          ),
                        ),
                      ),

                    ],

                  ],
                ),
              ),


            ],
          ),
        ),
      ],
    ),
  );

}


Widget _buildAppBar({
  required BuildContext context,
}) {


  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        CustomAppBar(

          backButton: AppBarBackButton(
              onPressed: (){
                Navigator.pushNamed(context, Routes.dashboardWithBottomNav);

              }
          ),
          title: 'Appointment',
          searchIcon: AppBarSearchIcon(
              onPressed: (){}
          ),

        ),

      ]
  );
}






// import 'package:flutter/material.dart';
//
// class AppointmentCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         width: double.infinity,
//         padding: EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: Colors.blueAccent, width: 1),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Appointment Date Row
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // Date and Time Info
//                 Row(
//                   children: [
//                     Icon(Icons.access_time, color: Colors.blueAccent),
//                     SizedBox(width: 5),
//                     Text(
//                       '10-Jun-2024',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.blueAccent,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     SizedBox(width: 5),
//                     Icon(Icons.circle, size: 5, color: Colors.grey),
//                     SizedBox(width: 5),
//                     Text(
//                       '16:00 CST',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.blueAccent,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//                 // Status and Action Titles
//                 Row(
//                   children: [
//                     Text(
//                       'Status',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     SizedBox(width: 5),
//                     Icon(Icons.circle, size: 5, color: Colors.grey),
//                     SizedBox(width: 5),
//                     Text(
//                       'Action',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),
//             Divider(color: Colors.grey.shade300, thickness: 1),
//             SizedBox(height: 10),
//
//             // Doctor Info Row
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // Doctor Info
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 24,
//                       backgroundImage: NetworkImage(
//                           'https://via.placeholder.com/150'), // Replace with the actual image URL
//                     ),
//                     SizedBox(width: 10),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Dr. Ana',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                         Text(
//                           'Appointment ID',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.grey,
//                           ),
//                         ),
//                         Text(
//                           'UAP-438628',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//
//                 // Status and Pay Button
//                 Row(
//                   children: [
//                     // Status Badge
//                     Container(
//                       padding:
//                       EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                       decoration: BoxDecoration(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Text(
//                         'UNPAID',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     // Pay Button
//                     ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.blueAccent, // Button color
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       child: Text('PAY'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
