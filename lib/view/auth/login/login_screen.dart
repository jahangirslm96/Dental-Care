import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uhcs_dental_app/ui/molecules/app_text/app_text.dart';
import 'package:uhcs_dental_app/ui/molecules/textfields/textfield.dart';
import 'package:uhcs_dental_app/utils/app_dismiss_keyboard.dart';
import 'package:uhcs_dental_app/view/auth/register/register_screen.dart';

import '../../../ui/molecules/app_text/app_rich_text.dart';
import '../../../ui/molecules/bottom_navigation/custom_bottom_navigation.dart';
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
import '../../../utils/routes.dart';
import '../../../view_model/auth/login/login_viewModel.dart';
import '../../dashboard/dashboard_main_view/dashboard_main_view.dart';
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppDismissKeyboard(
        child: Container(
            height: 100.h,
            width: 100.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetUtils.bg),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // *** Main Body *** //
                _buildBody(context: context),
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
  buildCounter++;
  print('Build count: $buildCounter');  // Using read() to avoid rebuilds of the entire widget
  final model = context.read<LoginViewModel>();

  return Expanded(
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: cw(35)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: ch(24)),
            SizedBox(height: ch(61.74)),

            SvgPicture.asset(
              AssetUtils.uhcsDentalMainLogo,
              width: cw(164),
              height: ch(87.51),
              fit: BoxFit.contain,
            ),

            SizedBox(height: ch(33.75)),

            AppText(
              txt: 'Welcome back',
              color: AppColor.c082755,
              fontSize: AppFontSize.f25,
              fontWeight: FontWeight.w500,
              letterspacing: cw(-0.3),
              lineHeight: 28.44,
            ),

        SizedBox(height: ch(6)),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: cw(58-35)),
              child: AppText(
                txt: 'Dentistry has never been this easy',
                color: AppColor.c677294,
                fontSize: AppFontSize.f14,
                fontWeight: FontWeight.w400,
                letterspacing: cw(-0.3),
                // lineHeight: 1.5,
                lineHeight: 23.18,
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: ch(80)),

            AppTextField(
              controller: model.usernameController,
              hintText: 'Username',
              textInputAction: TextInputAction.next,
              suffixIcon: UnconstrainedBox(
                child: Padding(
                  padding: EdgeInsets.only(bottom: ch(10), right: cw(0)),
                  child: SvgPicture.asset(
                    AssetUtils.tick,
                    width: cw(15),
                    height: ch(11),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            SizedBox(height: ch(20)),

            // Use context.watch<LoginViewModel>() only where rebuild is needed
            Consumer<LoginViewModel>(
              builder: (context, loginModel, _) {
                return AppTextField(
                  controller: loginModel.passwordController,
                  hintText: 'Password',
                  textInputAction: TextInputAction.done,
                  obscureText: loginModel.obscureText,
                  suffixIcon: GestureDetector(
                    onTap: loginModel.togglePasswordVisibility,
                    child: UnconstrainedBox(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: ch(10), right: cw(0)),
                        child: SvgPicture.asset(
                          loginModel.obscureText ?
                          AssetUtils.eyeHidden : AssetUtils.eyeHidden,
                          width: cw(16.21),
                          height: ch(14),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),



            SizedBox(height: ch(32)),



            Center(
              child: AppButton(
                text: 'Login',
                fontSize: AppFontSize.f18,
                fontWeight: FontWeight.w500,
                onPressed: () {

                  Navigator.pushNamed(context, Routes.dashboardWithBottomNav);


                },
              ),
            ),

            SizedBox(height: ch(19)),

            AppTextButton(
              text: 'Forgot password',
              textStyle: TextStyle(
                color: AppColor.c082755,
                fontSize: AppFontSize.f14,
                fontWeight: FontWeight.w400,
                letterSpacing: cw(-0.3),
                // lineHeight: 1.5,
                // textAlign: TextAlign.center,
              ),
              onPressed: (){
                mainBottomsheet(
                  context: context,
                  modalContent: forgotPasswordBottomSheet(
                    title: 'Forgot Your Password?',
                    descriptionText: "Not to Worry. Just enter your email address below and we'll send you an instruction email for recovery",
                    context: context,
                    sheetHeight: ch(363),
                    textfieldController: model.emailController,
                    closeBtnHandler: () {
                      Navigator.pop(context);
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    onPressHandler: (value) {
                      Navigator.pop(context);
                      FocusManager.instance.primaryFocus?.unfocus();
                      // Additional handling...
                    },
                  ),
                );
              },

            ),

            SizedBox(height: ch(143)),

            AppRichText(
              textAlign: TextAlign.center,
              childtxt: <TextSpan>[
                TextSpan(
                  text: 'Don’t have an account?',
                  style: TextStyle(
                    fontSize: AppFontSize.f14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.c082755,
                    fontFamily: "Poppins",
                  ),
                ),
                TextSpan(
                  text: " Join us",
                  style: TextStyle(
                    fontSize: AppFontSize.f14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.c082755,
                    fontFamily: "Poppins",
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {

                      Navigator.pushNamed(context, Routes.register);

                    },
                ),
              ],
            ),

            SizedBox(height: ch(26)),
          ],
        ),
      ),
    ),
  );
}
void _showStaticBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Allows the bottom sheet to be scrollable
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Takes minimum space
          children: [
            Text(
              'Static Bottom Sheet',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20), // Spacing
            Text(
              'This is a simple static bottom sheet.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20), // Spacing
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the bottom sheet
              },
              child: Text('Close'),
            ),
          ],
        ),
      );
    },
  );
}



