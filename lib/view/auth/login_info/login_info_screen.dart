import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uhcs_dental_app/ui/molecules/app_text/app_text.dart';
import 'package:uhcs_dental_app/ui/molecules/bottom_navigation/custom_bottom_navigation.dart';
import 'package:uhcs_dental_app/ui/molecules/textfields/textfield.dart';
import 'package:uhcs_dental_app/utils/app_dismiss_keyboard.dart';
import 'package:uhcs_dental_app/view/auth/login/login_screen.dart';
import 'package:uhcs_dental_app/view/auth/register/register_screen.dart';
import 'package:uhcs_dental_app/view_model/auth/register/register_viewModel.dart';

import '../../../providers/api_integration_provider.dart';
import '../../../ui/molecules/app_text/app_rich_text.dart';
import '../../../ui/molecules/bottom_sheets/forgot_password_bottomsheet.dart';
import '../../../ui/molecules/bottom_sheets/main_bottomsheet.dart';
import '../../../ui/molecules/buttons/app_primary_button.dart';
import '../../../ui/molecules/buttons/app_text_button.dart';
import '../../../ui/molecules/checkbox/checkbox.dart';
import '../../../ui/molecules/textfields/app_textfield.dart';
import '../../../ui/molecules/textfields/disabled_textfield.dart';
import '../../../ui/molecules/textfields/secondary_textfield.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/asset_utils.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/font_size.dart';
import '../../../utils/helpers/app_layout_helpers.dart';
import '../../../utils/helpers/flow_keys.dart';
import '../../../utils/routes.dart';
import '../../../view_model/auth/login/login_viewModel.dart';

class LoginInfoScreen extends StatelessWidget {
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
  final model = context.read<RegisterViewModel>();

  final apiHandler = context.read<ApiIntegrationHandler>();

  // Retrieve the saved data and cast it to Map<String, dynamic>
  final registerData = apiHandler.getFlow(FlowKeys.registerFlow);
  print('Data Retreved : $registerData');

  final String firstName = registerData!['firstName'] ?? '';
  final String lastName = registerData!['lastName'] ?? '';
  final String gender = registerData!['gender'] ?? '';
  final String dob = registerData!['dob'] ?? '';
  final String phoneNumber = registerData!['phoneNumber'] ?? '';
  final String zipCode = registerData!['zipCode'] ?? '';
  final String state = registerData!['state'] ?? '';
  final String city = registerData!['city'] ?? '';
  final String address = registerData!['address'] ?? '';
  final String email = registerData!['email'] ?? '';
  final String username = registerData!['username'] ?? '';
  final String password = registerData!['password'] ?? '';
  final String confirmPassword = registerData!['confirmPassword'] ?? '';

  return Expanded(
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: cw(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: ch(24)),

            SizedBox(height: ch(12)),

            // ** Back Button **//
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: (){

                  Navigator.pushNamed(context, Routes.register);

                },
                child: Container(
                  width: cw(30),
                  height: cw(30),
                  decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(cw(10))
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AssetUtils.backArrow,
                      width: cw(7),
                      height: ch(12.71),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: ch(16.74)),

            SvgPicture.asset(
              AssetUtils.uhcsDentalMainLogo,
              width: cw(164),
              height: ch(87.51),
              fit: BoxFit.contain,
            ),

            SizedBox(height: ch(23.75)),

            AppText(
              txt: AppStrings.logInSuccessful,
              color: AppColor.c082755,
              fontSize: AppFontSize.f25,
              fontWeight: FontWeight.w600,
              lineHeight: 35.15,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: ch(32)),

            Align(
              alignment: Alignment.centerLeft,
              child: AppText(
                txt: AppStrings.userInformation,
                color: AppColor.c082755,
                fontSize: AppFontSize.f18,
                fontWeight: FontWeight.w600,
                lineHeight: 27,
              ),
            ),

            SizedBox(
              height: ch(0),
            ),

            DisabledTextField(
              hintText: 'First Name:',
              textInputAction: TextInputAction.next,
              suffixText: firstName,
            ),
            DisabledTextField(
              hintText: 'Last Name:',
              textInputAction: TextInputAction.next,
              suffixText: lastName,

            ),
            DisabledTextField(
              hintText: 'Gender:',
              textInputAction: TextInputAction.next,
              suffixText: gender,

            ),

            DisabledTextField(
              hintText: 'Date Of Birth:',
              textInputAction: TextInputAction.next,
              suffixText: dob,

            ),
            DisabledTextField(
              hintText: 'Phone Number:',
              textInputAction: TextInputAction.next,
              suffixText: phoneNumber,

            ),

            DisabledTextField(
              hintText: 'Zip Code:',
              textInputAction: TextInputAction.next,
              suffixText: zipCode,

            ),
            DisabledTextField(
              hintText: 'State:',
              textInputAction: TextInputAction.next,
              suffixText: state,

            ),

            DisabledTextField(
              hintText: 'City:',
              textInputAction: TextInputAction.next,
              suffixText: city,
            ),


            DisabledTextField(
              hintText: 'Address:',
              textInputAction: TextInputAction.next,
              suffixText: address,
            ),

            SizedBox(height: ch(35)),


            Align(
              alignment: Alignment.centerLeft,
              child: AppText(
                txt: AppStrings.accountInformation,
                color: AppColor.c082755,
                fontSize: AppFontSize.f18,
                fontWeight: FontWeight.w600,
                lineHeight: 27,
              ),
            ),

            SizedBox(
              height: ch(27-26.22),
            ),

            DisabledTextField(
              hintText: 'Email:',
              textInputAction: TextInputAction.next,
              suffixText: email,
            ),
            DisabledTextField(
              hintText: 'UserName:',
              textInputAction: TextInputAction.next,
              suffixText: username,

            ),

            SizedBox(height: ch(29.5)),


            // ** edit and looks great button ** //
            Row(
              children: [

                AppButton(
                  width: cw(132),
                  height: ch(41),
                  buttonColor: AppColor.c909090,
                  text: 'Edit',
                  fontSize: AppFontSize.f14,
                  fontWeight: FontWeight.w500,
                  onPressed: () {

                  },
                ),
                
                SizedBox(
                  width: cw(18),
                ),

                AppButton(
                  width: cw(187),
                  height: ch(41),
                  text: 'Looks Great!',
                  fontSize: AppFontSize.f14,
                  fontWeight: FontWeight.w500,
                  onPressed: () {

                    Navigator.pushNamed(context, Routes.dashboardWithBottomNav);


                  },
                ),

              ],

            ),

            SizedBox(height: ch(34)),

          ],
        ),
      ),
    ),
  );
}

Widget _buildCheckBox({
  required BuildContext context,
  required bool isChecked,
  required VoidCallback onPressHandler,
  required String title,
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  bool isRichText = false,
}) {
  return GestureDetector(
    onTap: onPressHandler,  // This will trigger the toggle function
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: cw(24),
          height: cw(24),
          decoration: BoxDecoration(
            border: Border.all(
              color: !isChecked ? AppColor.c767676 : AppColor.transparent,
              width: !isChecked ? 3.0 : 0.0,
            ),
            color: isChecked ? AppColor.black : AppColor.transparent,
            // shape: BoxShape.circle,
            borderRadius: BorderRadius.circular(cw(3))
          ),
          child: isChecked
              ? UnconstrainedBox(
            child: SvgPicture.asset(
              AssetUtils.tick,
              color: AppColor.c00F659,
              width: cw(16),
              height: ch(12),
              fit: BoxFit.contain,
            ),
          )
              : const SizedBox.shrink(),
        ),
        SizedBox(
          width: cw(16),
        ),

        if(isRichText)...[

          AppRichText(
            textAlign: TextAlign.center,
            childtxt: <TextSpan>[
              TextSpan(
                text: 'I agree with all',
                style: TextStyle(
                  fontSize: AppFontSize.f14,
                  fontWeight: FontWeight.w500,
                  color: AppColor.black,
                  fontFamily: "Poppins",
                ),
              ),
              TextSpan(
                text: " terms and conditions",
                style: TextStyle(
                  fontSize: AppFontSize.f14,
                  fontWeight: FontWeight.w500,
                  color: AppColor.c004EB2,
                  fontFamily: "Poppins",
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, Routes.logInInfo);


                  },
              ),
            ],
          ),

        ]else...[
          Expanded(
            child: AppText(
              txt: title,
              color: color ?? AppColor.c4E5357,
              fontSize: fontSize ?? AppFontSize.f16,
              fontWeight: fontWeight ?? FontWeight.w400,
            ),
          ),
        ],

      ],
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



