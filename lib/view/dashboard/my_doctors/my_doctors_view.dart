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


import '../../../ui/molecules/app_text/app_rich_text.dart';
import '../../../ui/molecules/app_text/app_text.dart';
import '../../../ui/molecules/appbar/appbar.dart';
import '../../../ui/molecules/buttons/app_primary_button.dart';
import '../../../utils/asset_utils.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/font_size.dart';
import '../../../view_model/dashboard/my_doctors/my_doctors_view_model.dart';


class MyDoctorsView extends StatelessWidget {
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
              height: ch(8),
            ),
      
      
            ListView.builder(
              // padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: myDoctorsInfo.length,
              physics:  const BouncingScrollPhysics(),
              itemBuilder: ((context, index) {
                final isLastItemIndex = index == myDoctorsInfo.length - 1;

                final time = myDoctorsInfo[index]['time'];
                final name = myDoctorsInfo[index]['name'];
                final appointmentId = myDoctorsInfo[index]['appointmentId'];
                final drImage = myDoctorsInfo[index]['drImage'];
                final day = myDoctorsInfo[index]['day'];
                final dentistType = myDoctorsInfo[index]['dentistType'];
                final experience = myDoctorsInfo[index]['experience'];
                final available = myDoctorsInfo[index]['available'];

                return  _drInfoCard(
                  context: context,
                  time: time,
                  name: name,
                  appointmentId:appointmentId ,
                  drImage: drImage,
                   day: day,
                  dentistType: dentistType,
                  experience: experience,
                  available: available,
                  isLastItemIndex : isLastItemIndex,
                );
              }),
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => BottomNavigationBarExample()),
                // );
                // Navigator.pushNamed(context, Routes.register);

              }
          ),
          title: 'My Doctors',
          searchIcon: AppBarSearchIcon(
              onPressed: (){}
          ),

        ),

      ]
  );
}


Widget _drInfoCard({
  required BuildContext context,
  required String? day,
  required String? time,
  required String? name,
  required String? dentistType,
  required String? drImage,
  required String? experience,
  required String? appointmentId,
  required String? available,
  required bool isLastItemIndex,
}){

  return Container(
    margin:  isLastItemIndex ? EdgeInsets.only(bottom: ch(50)) : EdgeInsets.only(bottom: ch(12)),
    width: cw(375),
    // height: ch(147),
    // height: ch(157),
    decoration: BoxDecoration(
      color: AppColor.white,
      borderRadius: BorderRadius.circular(cw(8)),
      border: Border.all(
        color: AppColor.c082755,
        width: cw(0.2),
      ),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0.0, 0.0),
          blurRadius: 6.0,
          spreadRadius: 0.0,
          color: AppColor.c082755.withOpacity(0.14),
        )
      ],
    ),
    child:  Padding(
      padding:  EdgeInsets.only(left: cw(20),top: ch(10),right: cw(17)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          // Dr Image , Info and Heart Icon //
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(
                children: [
                  // Doctor Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(cw(4)),
                    child: Image.asset(
                      drImage ?? "",
                      width: cw(92),
                      height: cw(87),
                      filterQuality: FilterQuality.high,
                    ),
                  ),

                  SizedBox(width: cw(14)),
                  // Doctor Info
                  Padding(
                    padding:  EdgeInsets.only(bottom: ch(25)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppText(
                          txt: name ?? "",
                          color: AppColor.c082755,
                          fontSize: AppFontSize.f18,
                          fontWeight: FontWeight.w500,
                          letterspacing: cw(-0.3),
                          lineHeight: 27,
                        ),

                        AppText(
                          txt: dentistType ?? "",
                          color: AppColor.c082755,
                          fontSize: AppFontSize.f14,
                          fontWeight: FontWeight.w400,
                          letterspacing: cw(-0.3),
                          lineHeight: 19.5,
                        ),

                        AppText(
                          txt: experience ?? "",
                          color: AppColor.c677294,
                          fontSize: AppFontSize.f13,
                          fontWeight: FontWeight.w400,
                          letterspacing: cw(-0.3),
                          lineHeight: 18,
                        ),



                      ],
                    ),
                  ),
                ],
              ),

              // Book Now Button and Heart Icon
              // Icon(
              //   Icons.favorite,
              //   color: Colors.red,
              // ),


              Consumer<MyDoctorsViewModel>(
                builder: (context, viewModel, child) {
                  bool isFavorite = viewModel.isFavorite(appointmentId!);
                  return GestureDetector(
                    onTap: (){
                      viewModel.toggleFavorite(appointmentId);
                    } ,
                    child: Icon(
                      size: cw(22),
                      viewModel.isFavorite(appointmentId) ? Icons.favorite : Icons.favorite_border,
                      color: viewModel.isFavorite(appointmentId) ? Colors.red : Colors.grey,
                    ),
                  );
                },
              ),
              // Consumer<MyDoctorsViewModel>(
              //   builder: (context, viewModel, child) {
              //     bool isFavorite = viewModel.isFavorite(appointmentId!);
              //     return IconButton(
              //       icon: Icon(
              //         viewModel.isFavorite(appointmentId) ? Icons.favorite : Icons.favorite_border,
              //         color: viewModel.isFavorite(appointmentId) ? Colors.red : Colors.grey,
              //       ),
              //       onPressed: () {
              //         viewModel.toggleFavorite(appointmentId);
              //       },
              //     );
              //   },
              // ),

            ],
          ),


          SizedBox(
            height: ch(5),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              // Next Available and time //
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(
                    txt: available ?? "",
                    color: AppColor.c082755,
                    fontSize: AppFontSize.f16,
                    fontWeight: FontWeight.w500,
                    letterspacing: cw(-0.3),
                    lineHeight: 19.5,
                    textAlign: TextAlign.center,
                  ),


                  SizedBox(
                    height: ch(3),
                  ),
                  Row(
                    children: [

                      AppText(
                        txt: time ?? "",
                        fontSize: AppFontSize.f14,
                        fontWeight: FontWeight.w500,
                        color: AppColor.c677294 ,
                        fontFamily: "Poppins",
                        lineHeight: 18,
                      ),
                      SizedBox(
                        width: cw(4),
                      ),
                      AppText(
                        txt: day ?? "",
                        fontSize: AppFontSize.f15,
                        fontWeight: FontWeight.w500,
                        color: AppColor.c677294 ,
                        fontFamily: "Poppins",
                        lineHeight: 18,
                      ),
                    ],
                  ),





                ],
              ),

              AppButton(
                width: cw(112),
                height: ch(34),
                borderRadius: cw(4),
                textStyle: TextStyle(
                    fontSize: AppFontSize.f13,
                    color: AppColor.white,
                    fontWeight: FontWeight.w500,
                    decoration:  TextDecoration.none,
                    fontFamily: "Poppins",
                    height: 1.3
                ),
                text: 'Book Now',
                onPressed: () {

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => BottomNavigationBarExample()),
                  // );

                },
              ),

            ],
          ),

          SizedBox(
            height: ch(12),
          ),
        ],
      ),
    ),
  );

}





