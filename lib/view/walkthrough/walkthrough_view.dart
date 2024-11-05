import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uhcs_dental_app/ui/molecules/app_text/app_text.dart';
import 'package:uhcs_dental_app/ui/molecules/textfields/textfield.dart';
import 'package:uhcs_dental_app/utils/app_dismiss_keyboard.dart';
import 'package:uhcs_dental_app/view/auth/login/login_screen.dart';
import 'package:uhcs_dental_app/view/auth/register/register_screen.dart';
import '../../../ui/molecules/app_text/app_rich_text.dart';
import '../../../ui/molecules/bottom_sheets/forgot_password_bottomsheet.dart';
import '../../../ui/molecules/bottom_sheets/main_bottomsheet.dart';
import '../../../ui/molecules/buttons/app_primary_button.dart';
import '../../../ui/molecules/buttons/app_text_button.dart';
import '../../../ui/molecules/textfields/app_textfield.dart';
import '../../../ui/molecules/textfields/secondary_textfield.dart';
import '../../../utils/asset_utils.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/font_size.dart';
import '../../../utils/helpers/app_layout_helpers.dart';
import '../../../view_model/auth/login/login_viewModel.dart';
import '../../ui/molecules/bottom_navigation/custom_bottom_navigation.dart';
import '../../utils/routes.dart';
import '../dashboard/dashboard_main_view/dashboard_main_view.dart';
class WalkthroughView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 100.h,
          width: 100.w,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetUtils.bg),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              // SizedBox(
              //   height: ch(24),
              // ),

              Padding(
                padding:  EdgeInsets.only(right: cw(19)),
                child: Image.asset(
                  AssetUtils.getStartedImage,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),


              Padding(
                padding:  EdgeInsets.symmetric(horizontal: cw(40)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    SizedBox(
                      height: ch(51),
                    ),

                    AppText(
                      txt: 'Find Trusted Doctors',
                      fontSize: AppFontSize.f22,
                      color: AppColor.c082755,
                      fontWeight: FontWeight.w600,
                      lineHeight: 42,
                      letterspacing: cw(-0.3),
                      textAlign: TextAlign.center ,
                    ),
                    SizedBox(
                      height: ch(3),
                    ),

                    AppText(
                      txt: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
                      fontSize: AppFontSize.f16,
                      color: AppColor.c082755.withOpacity(0.71),
                      fontWeight: FontWeight.w500,
                      lineHeight: 23.18,
                      letterspacing: cw(-0.3),
                      textAlign: TextAlign.center ,
                    ),


                    SizedBox(
                      height: ch(65),
                    ),

                    Center(
                      child: AppButton(
                        text: 'Get Started',
                        fontSize: AppFontSize.f18,
                        fontWeight: FontWeight.w500,
                        onPressed: () {

                          Navigator.pushNamed(context, Routes.logIn);


                        },
                      ),
                    ),

                    SizedBox(
                      height: ch(14),
                    ),

                    AppTextButton(
                      text: 'Skip',
                      textStyle: TextStyle(
                        color: AppColor.c677294,
                        fontSize: AppFontSize.f16,
                        fontWeight: FontWeight.w400,
                        letterSpacing: cw(-0.3),
                        height: 1.3,

                      ),
                      onPressed: (){

                        Navigator.pushNamed(context, Routes.dashboardWithBottomNav);


                      },

                    ),


                  ],
                ),
              ),



            ],
          )
      ),
    );
  }
}






