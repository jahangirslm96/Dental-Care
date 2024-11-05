import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uhcs_dental_app/ui/molecules/appbar/widgets/app_bar_back_button.dart';
import 'package:uhcs_dental_app/ui/molecules/appbar/widgets/app_bar_search_icon.dart';
import 'package:uhcs_dental_app/ui/molecules/bottom_navigation/custom_bottom_navigation.dart';
import 'package:uhcs_dental_app/ui/molecules/textfields/secondary_textfield.dart';
import 'package:uhcs_dental_app/utils/app_dismiss_keyboard.dart';
import 'package:uhcs_dental_app/utils/helpers/app_layout_helpers.dart';
import 'package:uhcs_dental_app/view/dashboard/payment_method/payment_method_view.dart';
import 'package:uhcs_dental_app/view_model/dashboard/payment_method/payment_method_view_model.dart';


import '../../../ui/molecules/app_text/app_text.dart';
import '../../../ui/molecules/appbar/appbar.dart';
import '../../../ui/molecules/buttons/app_primary_button.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/asset_utils.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/font_size.dart';
import '../../../utils/routes.dart';


class CardDetailsView extends StatelessWidget {
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
                _buildBody(context: context),

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



  return  Expanded(
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: cw(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            
            SizedBox(height: ch(27.26),),

            // ** Payment Details and Total Amount ** //
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: cw(27 - 16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    txt: AppStrings.paymentDetails,
                    fontSize: AppFontSize.f20,
                    color: AppColor.c082755,
                    fontWeight: FontWeight.w700,
                    lineHeight: 30,
                  ),
              
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: ch(5),
                      ),
                      AppText(
                        txt: '\$85',
                        fontSize: AppFontSize.f16,
                        color: AppColor.c082755,
                        fontWeight: FontWeight.w700,
                        lineHeight: 18,
                      ),
              
                      AppText(
                        txt: AppStrings.totalAmount,
                        fontSize: AppFontSize.f16,
                        color: AppColor.c082755,
                        fontWeight: FontWeight.w700,
                        lineHeight: 18,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(
              height: ch(15),
            ),


            // ** Personal Information ** //
            _personalInformationCard(
              context: context
            ),

            SizedBox(
              height:ch(17),
            ),

            // ** Payment Methods ** //
            _paymentMethodsCard(
              context: context
            ),

            SizedBox(
              height: ch(26),
            ),


            // Process Payment Button ** //
            Center(
              child: AppButton(
                text: AppStrings.processPayment,
                onPressed: () {

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => LoginScreen()),
                  // );

                },
              ),
            ),

            SizedBox(
              height: ch(25),
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
                Navigator.pushNamed(context, Routes.paymentMethod);

              }
          ),
          title: 'Card Details',
          searchIcon: AppBarSearchIcon(
              onPressed: (){}
          ),

        ),

      ]
  );
}

Widget _paymentMethodsCard({required BuildContext context}){
  return Container(
    width: cw(375),
    decoration: BoxDecoration(
      color: AppColor.c1573FE.withOpacity(0.2),
      borderRadius: BorderRadius.circular(cw(12)),
      // boxShadow: [
      //   BoxShadow(
      //     offset: const Offset(0.0, 0.0),
      //     blurRadius: 4.0,
      //     spreadRadius: 0.0,
      //     color: AppColor.c082755.withOpacity(0.30),
      //   )
      // ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(
          height: ch(10),
        ),

        Padding(
          padding:  EdgeInsets.symmetric(horizontal: cw(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              AppText(
                txt: AppStrings.paymentMethods,
                fontSize: AppFontSize.f15,
                color: AppColor.c082755,
                fontWeight: FontWeight.w700,
                lineHeight: 21,
              ),

              SizedBox(
                height: ch(6.39),
              ),

              Divider(
                height: 0,
                thickness: ch(1),
                color: AppColor.c082755,
              ),

              SizedBox(
                height: ch(11.05),
              ),


              Row(
                children: [

                  Image.asset(
                    AssetUtils.bigDotP,
                    width: cw(10.16),
                    height: cw(10.16),
                    fit: BoxFit.contain,
                  ),


                  SizedBox(
                    width: cw(9.45),
                  ),

                  AppText(
                    txt: AppStrings.creditOrDebit,
                    fontSize: AppFontSize.f13,
                    color: AppColor.c082755,
                    fontWeight: FontWeight.w700,
                    lineHeight: 18,
                  ),
                ],
              ),


              SizedBox(
                height: ch(16.84),
              ),
            ],
          ),
        ),

        Padding(
          padding:  EdgeInsets.symmetric(horizontal: cw(11)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ** Card Number ** //
              SecondaryTextField(
                controller: TextEditingController(),
                hintText: 'Card Number',
                suffixIcon: Image.asset(
                  AssetUtils.masterCardp,
                  width: cw(27),
                  height: cw(27),
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                ),
              ),

              SizedBox(
                height: ch(12.24),
              ),

              // ** EXP date and CVC ** //
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  SecondaryTextField(
                    controller: TextEditingController(),
                    hintText: 'EXP Date',
                    width: cw(97.22),
                  ),


                  SizedBox(
                    width: cw(12.37),
                  ),

                  SecondaryTextField(
                    controller: TextEditingController(),
                    hintText: 'CVC',
                    width: cw(97.22),
                    maxLength: 3,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),

              SizedBox(
                height: ch(16.73),
              ),
            ],
          ),
        ),

      ],
    ),
  );
}

Widget _personalInformationCard({required BuildContext context}){
  return Container(
    width: cw(375),
    decoration: BoxDecoration(
      color: AppColor.c1573FE.withOpacity(0.2),
      borderRadius: BorderRadius.circular(cw(12)),
      // boxShadow: [
      //   BoxShadow(
      //     offset: const Offset(0.0, 0.0),
      //     blurRadius: 4.0,
      //     spreadRadius: 0.0,
      //     color: AppColor.c082755.withOpacity(0.30),
      //   )
      // ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(
          height: ch(10),
        ),

        Padding(
          padding:  EdgeInsets.symmetric(horizontal: cw(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              AppText(
                txt: AppStrings.personalInformation,
                fontSize: AppFontSize.f15,
                color: AppColor.c082755,
                fontWeight: FontWeight.w700,
                lineHeight: 21,
              ),

              SizedBox(
                height: ch(6.39),
              ),

              Divider(
                height: 0,
                thickness: ch(1),
                color: AppColor.c082755,
              ),

              SizedBox(
                height: ch(11.61),
              ),
            ],
          ),
        ),

        Padding(
          padding:  EdgeInsets.symmetric(horizontal: cw(11)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SecondaryTextField(
                controller: TextEditingController(),
                hintText: 'Card Holder Name',
              ),

              SizedBox(
                height: ch(8),
              ),

              SecondaryTextField(
                controller: TextEditingController(),
                hintText: 'Card Holder Last Name',
              ),


              SizedBox(
                height: ch(9),
              ),

              // ** Email and Phone Number ** //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  SecondaryTextField(
                    controller: TextEditingController(),
                    hintText: 'Email',
                    width: cw(145),
                  ),


                  SizedBox(
                    width: cw(19),
                  ),

                  SecondaryTextField(
                    controller: TextEditingController(),
                    hintText: 'Phone Number',
                    width: cw(145),
                  ),
                ],
              ),


              SizedBox(
                height: ch(8),
              ),

              // ** ZipCode and State ** //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  SecondaryTextField(
                    controller: TextEditingController(),
                    hintText: 'Zipcode',
                    width: cw(145),
                  ),


                  SizedBox(
                    width: cw(19),
                  ),

                  SecondaryTextField(
                    controller: TextEditingController(),
                    hintText: 'State',
                    width: cw(145),
                  ),
                ],
              ),

              SizedBox(
                height: ch(8),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // ** City ** //
                  SecondaryTextField(
                    controller: TextEditingController(),
                    hintText: 'City',
                    width: cw(145),
                  ),
                ],
              ),


              SizedBox(
                height: ch(8),
              ),

              // ** Billing Address ** //
              SecondaryTextField(
                controller: TextEditingController(),
                hintText: 'Billing Address',
              ),

              SizedBox(
                height: ch(12),
              ),
            ],
          ),
        ),

      ],
    ),
  );

}



