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


import '../../../ui/molecules/app_text/app_rich_text.dart';
import '../../../ui/molecules/app_text/app_text.dart';
import '../../../ui/molecules/appbar/appbar.dart';
import '../../../ui/molecules/buttons/app_primary_button.dart';
import '../../../utils/asset_utils.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/font_size.dart';
import '../../../utils/routes.dart';


class PrivacyAndPolicyView extends StatelessWidget {
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
Widget _buildBody({
  required BuildContext context,
}) {

  List<Map<String, String>> privacyAndPoliciesList = [
    {
      "title":AppStrings.introduction,
      "subtitle": AppStrings.uhcsText,
      "descriptiveText":AppStrings.introductionPrivacyPolicy,

    },

    {
      "title":AppStrings.collectingAndUsingInformation,
      "subtitle": AppStrings.collectingAndUsingInformationSubTitle,
      "descriptiveText":AppStrings.collectingAndUsingInformationDescriptiveText,

    },

  ];

  return  Expanded(
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: cw(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            SizedBox(
              height: ch(8),
            ),

            AppText(
              txt: AppStrings.privacyPolicy,
              fontSize: AppFontSize.f31,
              color: AppColor.c082755,
              fontWeight: FontWeight.w700,
              lineHeight: 47.81,
            ),

            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: privacyAndPoliciesList.length,
              physics:  const BouncingScrollPhysics(),
              itemBuilder: ((context, index) {
                final isLastItemIndex = index == privacyAndPoliciesList.length - 1;

                final title = privacyAndPoliciesList[index]['title'];
                final subtitle = privacyAndPoliciesList[index]['subtitle'];
                final descriptiveText = privacyAndPoliciesList[index]['descriptiveText'];

                return  _privacyAndPolicies(
                  title: title,
                  subtitle: subtitle,
                  descriptiveText: descriptiveText,
                  isLastItemIndex: isLastItemIndex,

                );
              }),
            ),



          ]
        ),
      ),
    ),
  );
}

Widget _privacyAndPolicies({
  required String? title,
  required String? subtitle,
  required String? descriptiveText,
  required bool isLastItemIndex,
}){
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


        SizedBox(
          height: ch(6.27),
        ),

        AppText(
          txt: title ?? "",
          fontSize: AppFontSize.f18,
          color: AppColor.c082755,
          fontWeight: FontWeight.w600,
          lineHeight: 24,
        ),


        SizedBox(
          height: ch(12.43),
        ),

        Container(
          width: cw(375),
          // height: ch(255.37),
          decoration: BoxDecoration(
            color: AppColor.c1573FE.withOpacity(0.1),
            borderRadius: BorderRadius.circular(cw(10)),
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: cw(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                SizedBox(
                  height: ch(17.62),
                ),


                AppText(
                  txt: subtitle ?? "",
                  fontSize: 13,
                  color: AppColor.c082755,
                  fontWeight: FontWeight.w500,
                  lineHeight: 18,
                ),

                SizedBox(
                  height: ch(4),
                ),


                AppText(
                  txt: descriptiveText ?? "",
                  fontSize: 13,
                  color: AppColor.c082755,
                  fontWeight: FontWeight.w400,
                  lineHeight: 18,
                ),


                SizedBox(
                  height: ch(22.95),
                ),

              ],
            ),
          ),
        ),

        SizedBox(
          height: ch(16.93),
        ),

        if(isLastItemIndex)...[

          SizedBox(
            height: ch(40),
          ),

        ]

      ]
  );
}


Widget _buildAppBar({
  required BuildContext context,
}) {


  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        SizedBox(
          height: ch(24 + 25),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: cw(20)),
          child: GestureDetector(
            onTap: (){

              Navigator.pushNamed(context, Routes.dashboardWithBottomNav);

            },
            child: SvgPicture.asset(
              AssetUtils.blueBackArrow,
              width: cw(22.95),
              height: ch(22.95),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ]
  );
}







