import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uhcs_dental_app/ui/molecules/appbar/widgets/app_bar_back_button.dart';
import 'package:uhcs_dental_app/ui/molecules/appbar/widgets/app_bar_search_icon.dart';
import 'package:uhcs_dental_app/ui/molecules/bottom_navigation/custom_bottom_navigation.dart';
import 'package:uhcs_dental_app/utils/app_dismiss_keyboard.dart';
import 'package:uhcs_dental_app/utils/app_strings.dart';
import 'package:uhcs_dental_app/utils/helpers/app_layout_helpers.dart';
import 'package:uhcs_dental_app/view/dashboard/payment_method/payment_method_view.dart';
import 'package:uhcs_dental_app/view_model/dashboard/all_sessions/all_sessions_view_model.dart';


import '../../../ui/molecules/app_text/app_text.dart';
import '../../../ui/molecules/appbar/appbar.dart';
import '../../../ui/molecules/textfields/secondary_search_textfield.dart';
import '../../../utils/asset_utils.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/font_size.dart';
import '../../../utils/routes.dart';


class AllSessionsView extends StatelessWidget {
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
Widget _buildBody({
  required BuildContext context,
}) {

  List<Map<String, String>> drInfoCardList = [
    {
      "date": "6-Jun-2024",
      "startTime": "04:07 PM",
      "endTime": "04:18",
      "name":"Dr. Jenna",
      "appointmentId":"UAP-4386656",
      "drImage":AssetUtils.drAvatar,
      "cost":"\$85.00",
    },
    {
      "date": "10-Jun-2024",
      "startTime": "04:07 PM",
      "endTime": "04:18",
      "name":"Dr. Ana",
      "appointmentId":"UAP-4029",
      "drImage":AssetUtils.drAvatar,
      "cost":"\$95.00",
    },


    

  ];



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
              height: ch(25.26),
            ),


            Consumer<AllSessionsViewModel>(
              builder: (context, searchProvider, child) {
                return SecondarySearchTextField<AllSessionsViewModel>(
                  hintText: 'Search Here By ID(Only Numeric Value)',
                  provider: searchProvider,
                  getSearchQuery: (provider) => provider.searchQuery,
                  updateSearchQuery: (provider, query) {
                    provider.updateSearchQuery(query);
                  },
                  clearSearchQuery: (provider) {
                    provider.clearSearchQuery();
                  },
                  controller: searchProvider.searchController, // Pass the controller here
                );
              },
            ),

            SizedBox(
              height: ch(10),
            ),

            Consumer<AllSessionsViewModel>(
              builder: (context, searchProvider, child) {
                return SecondarySearchTextField<AllSessionsViewModel>(
                  hintText: 'Filter Session Records By Date-Range ',
                  provider: searchProvider,
                  getSearchQuery: (provider) => provider.searchQuery,
                  updateSearchQuery: (provider, query) {
                    provider.updateSearchQuery(query);
                  },
                  clearSearchQuery: (provider) {
                    provider.clearSearchQuery();
                  },
                  controller: searchProvider.searchController1, // Pass the controller here
                );
              },
            ),
            
            SizedBox(
              height: ch(8),
            ),

            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: drInfoCardList.length,
              physics:  const BouncingScrollPhysics(),
              itemBuilder: ((context, index) {
                final isLastItemIndex = index == drInfoCardList.length - 1;

                final date = drInfoCardList[index]['date'];
                final startTime = drInfoCardList[index]['startTime'];
                final endTime = drInfoCardList[index]['endTime'];
                final name = drInfoCardList[index]['name'];
                final appointmentId = drInfoCardList[index]['appointmentId'];
                final drImage = drInfoCardList[index]['drImage'];
                final cost = drInfoCardList[index]['cost'];

                return  _allSessionsDrInfoCard(
                  context: context,
                  date: date,
                  startTime: startTime,
                  endTime: endTime,
                  name: name,
                  appointmentId:appointmentId ,
                  drImage: drImage,
                  cost: cost,
                    isLastItemIndex:isLastItemIndex,
                );
              }),
            ),
      
      
      
      
          ]
        ),
      ),
    ),
  );
}

Widget _allSessionsDrInfoCard({
  required BuildContext context,
  required String? date,
  required String? startTime,
  required String? endTime,
  required String? name,
  required String? appointmentId,
  required String? drImage,
  required String? cost,
  required bool isLastItemIndex,
}){

  return Container(
    margin: isLastItemIndex ? EdgeInsets.only(bottom: ch(40)) : EdgeInsets.only(bottom: ch(10)),
    width: cw(375),
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
    child: Column(
      children: [
        SizedBox(
          height: ch(13),
        ),
        Row(
          children: [
            // ** Blue Divider ** //
            SizedBox(
              height: ch(142),
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
                  
                  // Doctor info row
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: cw(12.1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
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

                            SizedBox(width: cw(13)),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                AppText(
                                  txt: name ?? "",
                                  fontSize: AppFontSize.f15,
                                  color: AppColor.c082755,
                                  fontWeight: FontWeight.w600,
                                  lineHeight: 22.5,
                                ),

                                AppText(
                                  txt: AppStrings.sessionID,
                                  fontSize: AppFontSize.f13,
                                  color: AppColor.c082755,
                                  fontWeight: FontWeight.w500,
                                  lineHeight: 13.8,
                                ),

                                SizedBox(
                                  height: ch(3),
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


                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            AppText(
                              txt:AppStrings.cost,
                              fontSize: AppFontSize.f18,
                              color: AppColor.c082755,
                              fontWeight: FontWeight.w600,
                              lineHeight: 24,
                            ),

                            SizedBox(
                              height: ch(5),
                            ),

                            AppText(
                              txt: cost ?? "",
                              fontSize: AppFontSize.f20,
                              color: AppColor.c082755,
                              fontWeight: FontWeight.w700,
                              lineHeight: 27,
                            ),

                          ],
                        ),


                      ],
                    ),
                  ),


                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(
                       height: ch(5),
                     ),
                     // Divider without padding
                     SizedBox(
                       width: cw(340),
                       child: Divider(
                         height: ch(0.43),
                         thickness: ch(0.43),
                         color: AppColor.c677294,
                       ),
                     ),

                     SizedBox(
                       height: ch(8.07),
                     ),

                     // Appointment Info (Date, Start Time , End Time)
                     Padding(
                       padding:  EdgeInsets.symmetric(horizontal: cw(5)),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           SvgPicture.asset(
                             AssetUtils.appointTimer,
                             width: cw(14.6),
                             height: cw(14.6),
                             fit: BoxFit.contain,
                           ),

                           SizedBox(width: cw(5.06)),

                           AppText(
                             txt: AppStrings.datee,
                             fontSize : AppFontSize.f11,
                             color: AppColor.c082755,
                             fontWeight: FontWeight.w500,
                             lineHeight: 12.6,
                           ),

                           SizedBox(
                             width: cw(2),
                           ),

                           AppText(
                             txt: date ?? "",
                             fontSize : AppFontSize.f11,
                             color: AppColor.c082755,
                             fontWeight: FontWeight.w700,
                             lineHeight: 12.6,
                           ),

                           SizedBox(
                             width: cw(5),
                           ),


                           //** Vertical Divider **//
                           Container(
                             width: cw(2),
                             height: ch(15),
                             color: AppColor.c082755,
                           ),

                           SizedBox(
                             width: cw(5),
                           ),


                           AppText(
                             txt: AppStrings.startTime,
                             fontSize : AppFontSize.f11,
                             color: AppColor.c082755,
                             fontWeight: FontWeight.w500,
                             lineHeight: 12.6,
                           ),

                           SizedBox(
                             width: cw(2),
                           ),

                           AppText(
                             txt: startTime ?? "",
                             fontSize : AppFontSize.f11,
                             color: AppColor.c082755,
                             fontWeight: FontWeight.w700,
                             lineHeight: 12.6,
                           ),

                           //endtime

                           SizedBox(
                             width: cw(5),
                           ),


                           //** Vertical Divider **//
                           Container(
                             width: cw(2),
                             height: ch(15),
                             color: AppColor.c082755,
                           ),

                           SizedBox(
                             width: cw(5),
                           ),


                           AppText(
                             txt: AppStrings.endTime,
                             fontSize : AppFontSize.f11,
                             color: AppColor.c082755,
                             fontWeight: FontWeight.w500,
                             lineHeight: 12.6,
                           ),

                           SizedBox(
                             width: cw(2),
                           ),

                           Flexible(
                             child: AppText(
                               txt: endTime ?? "",
                               fontSize : AppFontSize.f11,
                               color: AppColor.c082755,
                               fontWeight: FontWeight.w700,
                               lineHeight: 12.6,
                             ),
                           ),

                         ],
                       ),
                     ),


                     SizedBox(
                       height: ch(6.5),
                     ),


                     SizedBox(
                       width: cw(340),
                       child: Divider(
                         height: ch(0.43),
                         thickness: ch(0.43),
                         color: AppColor.c677294,
                       ),
                     ),


                     SizedBox(
                       height: ch(5.5),
                     ),


                     //** Diagnosis **//
                     Padding(
                       padding:  EdgeInsets.symmetric(horizontal: cw(5)),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [


                           AppText(
                             txt: AppStrings.diagnosis,
                             fontSize : AppFontSize.f12,
                             color: AppColor.c082755,
                             fontWeight: FontWeight.w700,
                             lineHeight: 16,
                           ),

                           SizedBox(
                             width: cw(2),
                           ),

                           /// diagnosis text will be here
                           //
                           // AppText(
                           //   txt: date ?? "",
                           //   fontSize : 11,
                           //   color: AppColor.c082755,
                           //   fontWeight: FontWeight.w700,
                           //   lineHeight: 12.6,
                           // ),

                         ],
                       ),
                     ),


                     SizedBox(
                       height: ch(18),
                     ),


                     SizedBox(
                       width: cw(340),
                       child: Divider(
                         height: ch(0.43),
                         thickness: ch(0.43),
                         color: AppColor.c677294,
                       ),
                     ),


                     SizedBox(
                       height: ch(5.5),
                     ),

                     //** Provider Note **//
                     Padding(
                       padding:  EdgeInsets.symmetric(horizontal: cw(5)),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [


                           AppText(
                             txt: AppStrings.providerNote,
                             fontSize : AppFontSize.f12,
                             color: AppColor.c082755,
                             fontWeight: FontWeight.w700,
                             lineHeight: 16,
                           ),

                           SizedBox(
                             width: cw(2),
                           ),

                           /// diagnosis text will be here
                           //
                           // AppText(
                           //   txt: date ?? "",
                           //   fontSize : 11,
                           //   color: AppColor.c082755,
                           //   fontWeight: FontWeight.w700,
                           //   lineHeight: 12.6,
                           // ),

                         ],
                       ),
                     ),

                     SizedBox(
                       height: ch(10),
                     ),


                   ],
                 ),



                ],
              ),
            ),
          ],
        ),

        SizedBox(
          height: ch(10),
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
          title: 'All Sessions',
          searchIcon: SizedBox(width: 8.w,),

        ),

      ]
  );
}


