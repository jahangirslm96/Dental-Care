import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uhcs_dental_app/ui/molecules/appbar/widgets/app_bar_back_button.dart';
import 'package:uhcs_dental_app/ui/molecules/appbar/widgets/app_bar_search_icon.dart';
import 'package:uhcs_dental_app/ui/molecules/bottom_navigation/custom_bottom_navigation.dart';
import 'package:uhcs_dental_app/utils/app_dismiss_keyboard.dart';
import 'package:uhcs_dental_app/utils/helpers/app_layout_helpers.dart';
import 'package:uhcs_dental_app/view/dashboard/payment_method/payment_method_view.dart';
import 'package:uhcs_dental_app/view/e_visit/doctor_details/doctor_details_view.dart';


import '../../../ui/molecules/app_text/app_rich_text.dart';
import '../../../ui/molecules/app_text/app_text.dart';
import '../../../ui/molecules/appbar/appbar.dart';
import '../../../ui/molecules/buttons/app_primary_button.dart';
import '../../../ui/molecules/dropdowns/custom_primary_dropdown.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/asset_utils.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/font_size.dart';
import '../../../utils/routes.dart';
import '../../../view_model/dashboard/my_doctors/my_doctors_view_model.dart';
import '../../../view_model/e_visit/online_intake_specialist/online_intake_specialist_view_model.dart';


class OnlineIntakeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
    );
  }
}
int buildCounter = 0;
Widget _buildBody({
  required BuildContext context,
}) {

  List<Map<String, String>> myDoctorsInfo = [
    {
      "appointmentId":"1",
      "time": "10 AM",
      "day" :"tomorrow",
      "name":"Dr. Tranquilli",
      "dentistType":"Specialist Dentist",
      "experience":"6 Years experience",
      "drImage":AssetUtils.myDoctor1,
      "available":"Next Available",
    },
    {
      "appointmentId":"2",
      "time": "12 AM",
      "day" :"tomorrow",
      "name":"Dr. Bonebrake",
      "dentistType":"Specialist Dentist",
      "experience":"8 Years experience",
      "drImage":AssetUtils.myDoctor2,
      "available":"Next Available",
    },
    {
      "appointmentId":"3",
      "time": "11 AM",
      "day" :"tomorrow",
      "name":"Dr. Luke Whitesell",
      "dentistType":"Specialist Dentist",
      "experience":"7 Years experience",
      "drImage":AssetUtils.myDoctor3,
      "available":"Next Available",
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
              height: ch(18.26),
            ),


            // ** Current State Dropdown ** //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  txt: AppStrings.currentState,
                  fontSize: AppFontSize.f15,
                  color: AppColor.c082755,
                  fontWeight: FontWeight.w400,
                  lineHeight: 21,
                ),
                CustomPrimaryDropdown<OnlineIntakeViewModel>(
                  dropdownItem: {
                    
                  }, // Pass the required data
                  onPressHandler: null, // Handle tap if needed
                  selectedState: (provider) => provider.selectedState, // Get state
                  onStateSelected: (provider, newState) => provider.setSelectedState(newState), // Set state
                ),
              ],
            ),



            SizedBox(
              height: ch(13),
            ),

            Container(
              height: ch(400),
              // color: Colors.red,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  childAspectRatio: 1, // Aspect ratio of each item
                  crossAxisSpacing: ch(12), // Spacing between columns
                  mainAxisSpacing: ch(12), // Spacing between rows
                ),
                itemCount: 4, // Number of items
                itemBuilder: (BuildContext context, int index) {
                  return  Container(
                    // width: cw(148),
                    width: cw(158),
                    // height: ch(165),
                    // height: ch(185),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(cw(12)),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0.0, 4.0),
                          blurRadius: 4.0,
                          spreadRadius: 0.0,
                          color: AppColor.c082755.withOpacity(0.10),
                        )
                      ],
                    ),
                    child: Stack(
                      children: [

                        // ** Background blue ** //
                        Container(
                          width: cw(375),
                          height: ch(62),
                          decoration: BoxDecoration(
                            color: AppColor.c082755,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(cw(12)) , topRight: Radius.circular(cw(12)),
                            ),
                          ),

                        ),


                        //** Avatar ** //
                        Positioned(
                          left: cw(43),
                          right: cw(43),
                          top: ch(16),
                          child: Container(
                            width: cw(62),
                            height: cw(62),
                            decoration: BoxDecoration(
                                color: AppColor.c082755,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppColor.c082755,
                                    width: cw(2.1)
                                )
                            ),

                            child: Image.asset(
                              AssetUtils.drShoImage,
                              // width: cw(62),
                              // height: cw(62),
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ),


                        Positioned(
                          // top: ch(76),
                          top: ch(82),
                          left: cw(29),
                          right: cw(29),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [


                              AppText(
                                txt: 'Dr Shouey',
                                fontSize: AppFontSize.f14,
                                color: AppColor.c082755,
                                fontWeight: FontWeight.w600,
                                lineHeight: 21,
                                letterspacing: cw(-0.3),
                              ),

                              SizedBox(
                                height: ch(0),
                              ),
                              AppText(
                                txt: '${AppStrings.initialPrice} \$85',
                                fontSize: AppFontSize.f9,
                                color: AppColor.c1573FE,
                                fontWeight: FontWeight.w500,
                                lineHeight: 9,
                                letterspacing: cw(-0.3),
                              ),

                              SizedBox(
                                height: ch(4),
                              ),
                              AppText(
                                txt: '${AppStrings.followUpPrice} \$85',
                                fontSize: AppFontSize.f9,
                                color: AppColor.c1573FE,
                                fontWeight: FontWeight.w500,
                                lineHeight: 9,
                                letterspacing: cw(-0.3),
                              ),

                              SizedBox(
                                height: ch(5.86),
                              ),

                              RatingBar(
                                alignment: Alignment.center,
                                emptyColor: AppColor.grey,
                                filledColor: AppColor.cF6D060,
                                size: ch(18),
                                filledIcon: Icons.star,
                                emptyIcon: Icons.star_border,
                                onRatingChanged: (value) => debugPrint('$value'),
                                initialRating: 4,
                                maxRating: 5,
                              ),

                              SizedBox(
                                height: ch(8.5),
                              ),


                            ],
                          ),
                        ),

                        Positioned(
                          bottom: ch(9),
                          left: cw(7),
                          right: cw(6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              AppButton(
                                width:cw(65),
                                height: ch(21),
                                text: 'View Profile',
                                textStyle: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: AppFontSize.f10,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.white
                                ),
                                borderRadius: cw(5),
                                onPressed: (){

                                  Navigator.pushNamed(context, Routes.doctorDetails);

                                },
                              ),

                              SizedBox(
                                width: cw(5),
                              ),


                              AppButton(
                                width:cw(65),
                                height: ch(21),
                                text: 'Talk to Doctor',
                                textStyle: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: AppFontSize.f10,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.white
                                ),
                                borderRadius: cw(5),
                                onPressed: (){},
                              ),

                            ],
                          ),
                        ),


                      ],
                    ),
                  );
                },
              ),
            ),

          ]
        ),
      ),
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
          title: 'Online Intake Specialist',
          searchIcon: AppBarSearchIcon(
              onPressed: (){}
          ),

        ),

      ]
  );
}







