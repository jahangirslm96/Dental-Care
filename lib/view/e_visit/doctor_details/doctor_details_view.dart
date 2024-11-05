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
import 'package:uhcs_dental_app/view/e_visit/online_intake_specialist/online_intake_specialist_view.dart';


import '../../../ui/molecules/app_text/app_rich_text.dart';
import '../../../ui/molecules/app_text/app_text.dart';
import '../../../ui/molecules/appbar/appbar.dart';
import '../../../ui/molecules/buttons/app_primary_button.dart';
import '../../../ui/molecules/dropdowns/custom_primary_dropdown.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/asset_utils.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/font_size.dart';
import '../../../view_model/dashboard/my_doctors/my_doctors_view_model.dart';


class DoctorDetailsView extends StatelessWidget {
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
        padding:  EdgeInsets.symmetric(horizontal: cw(11)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            SizedBox(
              height: ch(20),
            ),

            // ** Dr details Card **//
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: cw(2)),
              child: Container(
                width: cw(375),
                // height: ch(170),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(cw(8)),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 20.0,
                      spreadRadius: 0.0,
                      color: AppColor.black.withOpacity(0.08),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
              
                    SizedBox(
                      height: ch(6),
                    ),
              
                    
                    // ** Online Status **//
                    Padding(
                      padding:  EdgeInsets.only(right: cw(9)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
              
                          // ** Online Status ** //
                          Padding(
                            padding:  EdgeInsets.only(top: ch(1)),
                            child: Container(
                              width: cw(12),
                              height: cw(12),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.c35B518
                              ),
                            ),
                          ),
                          
                          SizedBox(
                            width: cw(7),
                          ),
                          AppText(
                            txt: 'Online',
                            fontSize: AppFontSize.f15,
                            color: AppColor.c082755,
                            fontWeight: FontWeight.w500,
                            lineHeight: 19.5,
                            letterspacing: cw(-0.3),
                          ),
                        ],
                      ),
                    ),
              
                    
                    // ** Dr info ratings cost //
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: cw(19)),
                      child: Row(
                        children: [
                          // Doctor Image
                          Image.asset(
                            AssetUtils.drShoRec,
                            width: cw(92),
                            height: cw(87),
                            filterQuality: FilterQuality.high,
                          ),
                      
                          SizedBox(width: cw(14)),
                          // Doctor Info
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(
                                txt: "Dr. Shouey",
                                color: AppColor.c082755,
                                fontSize: AppFontSize.f19,
                                fontWeight: FontWeight.w700,
                                letterspacing: cw(-0.3),
                                lineHeight: 27,
                              ),
                      
                              AppText(
                                txt: "Online Intake Specialist",
                                color: AppColor.c082755,
                                fontSize: AppFontSize.f16,
                                fontWeight: FontWeight.w300,
                                lineHeight: 28,
                              ),
                      
                              Row(
                                children: [
                                  RatingBar(
                                    alignment: Alignment.centerLeft,
                                    emptyColor: AppColor.grey,
                                    filledColor: AppColor.cF6D060,
                                    size: ch(19),
                                    filledIcon: Icons.star,
                                    emptyIcon: Icons.star_border,
                                    onRatingChanged: (value) => debugPrint('$value'),
                                    initialRating: 4,
                                    maxRating: 5,
                                  ),
                                  
                                  SizedBox(
                                    width: cw(43),
                                  ),
                      
                                  AppRichText(
                                    textAlign: TextAlign.center,
                                    childtxt: <TextSpan>[
                                      TextSpan(
                                        text: '\$',
                                        style: TextStyle(
                                          fontSize: AppFontSize.f16,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.c082755,
                                          fontFamily: "Poppins",
                                        ),
                                      ),
                                      TextSpan(
                                        text: "85.00",
                                        style: TextStyle(
                                          fontSize: AppFontSize.f16,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.c677294,
                                          fontFamily: "Poppins",
                                          letterSpacing: cw(-0.3),
                                          height: 1.4,
                                        ),
                                        recognizer: TapGestureRecognizer()
                      
                                      ),
                                    ],
                                  ),
                      
                                ],
                              ),
                      
                      
                      
                      
                      
                            ],
                          ),
                        ],
                      ),
                    ),
              
                    SizedBox(
                      height: ch(15),
                    ),
                    
                    AppButton(
                      width: cw(140),
                      height: ch(32),
                      text:'Book Now',
                      borderRadius: cw(4),
                      onPressed: (){
                      },
                    ),
                    
                    SizedBox(
                      height: ch(18),
                    ),
              
                  ],
                ),
              ),
            ),
            
            SizedBox(
              height: ch(24),
            ),

            
            // Another container
            Align(
              alignment: Alignment.center,
              child: Container(
                width: cw(305),
                height: ch(84),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(cw(10)),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 20.0,
                      spreadRadius: 0.0,
                      color: AppColor.black.withOpacity(0.08),
                    ),
                  ],
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: cw(10),vertical: ch(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(
                        width: cw(90),
                        height: ch(64),
                        decoration: BoxDecoration(
                          color: AppColor.cCBCBCB.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(cw(8)),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 20.0,
                              spreadRadius: 0.0,
                              color: AppColor.black.withOpacity(0.08),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            AppText(
                              txt: '100',
                              fontSize: AppFontSize.f18,
                              color: AppColor.c082755,
                              fontWeight: FontWeight.w500,
                              lineHeight: 27,
                              letterspacing: cw(-0.3),
                            ),

                            AppText(
                              txt: 'Runing',
                              fontSize: AppFontSize.f14,
                              color: AppColor.c677294,
                              fontWeight: FontWeight.w300,
                              lineHeight: 21,
                              letterspacing: cw(-0.3),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: cw(90),
                        height: ch(64),
                        decoration: BoxDecoration(
                          color: AppColor.cCBCBCB.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(cw(8)),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 20.0,
                              spreadRadius: 0.0,
                              color: AppColor.black.withOpacity(0.08),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            AppText(
                              txt: '500',
                              fontSize: AppFontSize.f18,
                              color: AppColor.c082755,
                              fontWeight: FontWeight.w500,
                              lineHeight: 27,
                              letterspacing: cw(-0.3),
                            ),

                            AppText(
                              txt: 'Ongoing',
                              fontSize: AppFontSize.f14,
                              color: AppColor.c677294,
                              fontWeight: FontWeight.w300,
                              lineHeight: 21,
                              letterspacing: cw(-0.3),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: cw(90),
                        height: ch(64),
                        decoration: BoxDecoration(
                          color: AppColor.cCBCBCB.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(cw(8)),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 20.0,
                              spreadRadius: 0.0,
                              color: AppColor.black.withOpacity(0.08),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            AppText(
                              txt: '700',
                              fontSize: AppFontSize.f18,
                              color: AppColor.c082755,
                              fontWeight: FontWeight.w500,
                              lineHeight: 27,
                              letterspacing: cw(-0.3),
                            ),

                            AppText(
                              txt: 'Patient',
                              fontSize: AppFontSize.f14,
                              color: AppColor.c677294,
                              fontWeight: FontWeight.w300,
                              lineHeight: 21,
                              letterspacing: cw(-0.3),
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ),

            SizedBox(
              height: ch(18),
            ),

            //** Bio Text ** //

            AppText(
              txt: 'Bio:',
              fontSize: AppFontSize.f19,
              color: AppColor.c082755,
              fontWeight: FontWeight.w500,
              lineHeight: 27,
              letterspacing: cw(-0.3),
            ),

            SizedBox(
              height: ch(11),
            ),

            Padding(
              padding:  EdgeInsets.only(left: cw(11),right: cw(11)),
              child: AppText(
                txt: 'General Physicians are highly trained specialists who provide a range of non-surgical health care to adult patients.',
                fontSize: AppFontSize.f15,
                color: AppColor.c082755,
                fontWeight: FontWeight.w500,
                lineHeight: 19.5 ,
                letterspacing: cw(-0.3),
              ),
            ),
          ],
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OnlineIntakeView()),
                );
              }
          ),
          title: 'Doctor Details',
          searchIcon: AppBarSearchIcon(
              onPressed: (){}
          ),

        ),

      ]
  );
}







