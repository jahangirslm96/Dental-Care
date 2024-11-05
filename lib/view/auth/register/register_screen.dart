import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uhcs_dental_app/ui/molecules/app_text/app_text.dart';
import 'package:uhcs_dental_app/ui/molecules/textfields/textfield.dart';
import 'package:uhcs_dental_app/utils/app_dismiss_keyboard.dart';
import 'package:uhcs_dental_app/utils/app_strings.dart';
import 'package:uhcs_dental_app/view/auth/login/login_screen.dart';
import 'package:uhcs_dental_app/view/auth/login_info/login_info_screen.dart';
import 'package:uhcs_dental_app/view_model/auth/register/register_viewModel.dart';

import '../../../providers/api_integration_provider.dart';
import '../../../ui/molecules/app_text/app_rich_text.dart';
import '../../../ui/molecules/bottom_sheets/forgot_password_bottomsheet.dart';
import '../../../ui/molecules/bottom_sheets/main_bottomsheet.dart';
import '../../../ui/molecules/buttons/app_primary_button.dart';
import '../../../ui/molecules/buttons/app_text_button.dart';
import '../../../ui/molecules/checkbox/checkbox.dart';
import '../../../ui/molecules/textfields/app_textfield.dart';
import '../../../ui/molecules/textfields/secondary_textfield.dart';
import '../../../utils/asset_utils.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/font_size.dart';
import '../../../utils/helpers/app_layout_helpers.dart';
import '../../../utils/helpers/flow_keys.dart';
import '../../../utils/routes.dart';
import '../../../view_model/auth/login/login_viewModel.dart';

class RegisterScreen extends StatelessWidget {
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
  final apiHandler = context.read<ApiIntegrationHandler>(); // No rebuild on change
  final model = context.read<RegisterViewModel>();

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

                  Navigator.pushNamed(context, Routes.logIn);


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
              txt: AppStrings.registerAsPatient,
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
                txt: AppStrings.patientDetails,
                color: AppColor.c082755,
                fontSize: AppFontSize.f18,
                fontWeight: FontWeight.w600,
                lineHeight: 27,
              ),
            ),

            SizedBox(
              height: ch(60.75 - 27),
            ),

            AppTextField(
              controller: model.firstNameController,
              hintText: 'First Name',
              textInputAction: TextInputAction.next,
            ),
            AppTextField(
              controller: model.lastNameController,
              hintText: 'Last Name',
              textInputAction: TextInputAction.next,
            ),
            AppTextField(
              controller: model.genderController,
              hintText: 'Gender',
              textInputAction: TextInputAction.next,
            ),

            AppTextField(
              controller: model.dobController,
              hintText: 'Date Of Birth',
              textInputAction: TextInputAction.next,
            ),
            AppTextField(
              controller: model.phoneNumberController,
              hintText: 'Phone Number ',
              textInputAction: TextInputAction.next,
            ),

            AppTextField(
              controller: model.zipCodeController,
              hintText: 'Zip Code',
              textInputAction: TextInputAction.next,
            ),
            AppTextField(
              controller: model.stateController,
              hintText: 'State',
              textInputAction: TextInputAction.next,
            ),

            AppTextField(
              controller: model.cityController,
              hintText: 'City',
              textInputAction: TextInputAction.next,
            ),


            AppTextField(
              controller: model.addressController,
              hintText: 'Address',
              textInputAction: TextInputAction.next,
            ),

            SizedBox(height: ch(51.5)),


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

            AppTextField(
              controller: model.emailController,
              hintText: 'Email',
              textInputAction: TextInputAction.next,
            ),
            AppTextField(
              controller: model.usernameController,
              hintText: 'UserName',
              textInputAction: TextInputAction.next,
            ),

            AppTextField(
              controller: model.passwordController,
              hintText: 'Password',
              obscureText: true,
              textInputAction: TextInputAction.next,
            ),

            AppTextField(
              controller: model.confirmPasswordController,
              obscureText: true,
              hintText: 'Confirm Password',
              textInputAction: TextInputAction.done,
            ),

            SizedBox(
              height: ch(26.75),
            ),

            Consumer<RegisterViewModel>(
              builder: (context, registerModel, _) {
                return Padding(
                  padding:  EdgeInsets.only(left: cw(10)),
                  child: _buildCheckBox(
                    context: context,
                    isChecked: model.isCompanyHoldAccount ?? false,  // Safely handle null values
                    title: 'Yes',
                    onPressHandler: () {
                      model.toggleCompanyHoldAccount();  // Toggle state using the ViewModel's method
                    },
                    isRichText: true
                  ),
                );
              },
            ),


            SizedBox(
              height: ch(49),
            ),


            Center(
              child: AppButton(
                text: 'Continue',
                fontSize: AppFontSize.f18,
                fontWeight: FontWeight.w500,
                onPressed: () {
                  apiHandler.setFlow(
                    key: FlowKeys.registerFlow,
                    data: {
                      "firstName":model.firstNameController.text,
                      "lastName":model.lastNameController.text,
                      "gender":model.genderController.text,
                      "dob":model.dobController.text,
                      "phoneNumber":model.phoneNumberController.text,
                      "zipCode":model.zipCodeController.text,
                      "state":model.stateController.text,
                      "city":model.cityController.text,
                      "address":model.addressController.text,
                      "email":model.emailController.text,
                      "username": model.usernameController.text,
                      "password": model.passwordController.text,
                      "confirmPassword": model.confirmPasswordController.text,

                    },
                  );
                  model.clearTextFields();

                  Navigator.pushNamed(context, Routes.logInInfo);


                },
              ),
            ),

            SizedBox(height: ch(45)),


            
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: ch(1),
                  width: cw(126.58),
                  decoration: BoxDecoration(
                    color: AppColor.black.withOpacity(0.5),
                  ),
                ),

                SizedBox(
                  width: cw(10.91),
                ),
                AppText(
                  txt: 'Or With',
                  color: AppColor.c082755,
                  fontSize: AppFontSize.f18,
                  fontWeight: FontWeight.w400,
                  lineHeight: 12,

                ),

                SizedBox(
                  width: cw(10.91),
                ),

                Container(
                  height: ch(1),
                  width: cw(126.58),
                  decoration: BoxDecoration(
                    color: AppColor.black.withOpacity(0.5),
                  ),
                ),

              ],
            ),


            SizedBox(height: ch(25)),

            AppRichText(
              textAlign: TextAlign.center,
              childtxt: <TextSpan>[
                TextSpan(
                  text: AppStrings.alreadyHaveAccount,
                  style: TextStyle(
                    fontSize: AppFontSize.f16,
                    fontWeight: FontWeight.w500,
                    color: AppColor.black.withOpacity(0.8),
                    fontFamily: "Poppins",
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: AppStrings.logIn,
                  style: TextStyle(
                    fontSize: AppFontSize.f16,
                    fontWeight: FontWeight.w500,
                    color: AppColor.c082755,
                    fontFamily: "Poppins",
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {

                      Navigator.pushNamed(context, Routes.logIn);


                    },
                ),
              ],
            ),

            SizedBox(height: ch(35)),
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
              // color: AppColor.blue,
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

                    Navigator.pushNamed(context, Routes.register);


                  },
              ),
            ],
          ),

        ]else...[
          Expanded(
            child: AppText(
              txt: title,
              color: color ?? AppColor.c4E5357,
              fontSize: fontSize ?? AppFontSize.f12,
              fontWeight: fontWeight ?? FontWeight.w500,
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



