import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uhcs_dental_app/ui/molecules/appbar/widgets/app_bar_back_button.dart';
import 'package:uhcs_dental_app/ui/molecules/appbar/widgets/app_bar_search_icon.dart';
import 'package:uhcs_dental_app/ui/molecules/bottom_navigation/custom_bottom_navigation.dart';
import 'package:uhcs_dental_app/utils/app_dismiss_keyboard.dart';
import 'package:uhcs_dental_app/utils/app_strings.dart';
import 'package:uhcs_dental_app/utils/helpers/app_layout_helpers.dart';
import 'package:uhcs_dental_app/view/dashboard/card_details/card_details_view.dart';
import 'package:uhcs_dental_app/view_model/dashboard/payment_method/payment_method_view_model.dart';


import '../../../ui/molecules/app_text/app_text.dart';
import '../../../ui/molecules/appbar/appbar.dart';
import '../../../ui/molecules/buttons/app_primary_button.dart';
import '../../../utils/asset_utils.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/font_size.dart';
import '../../../utils/routes.dart';


class PaymentMethodView extends StatelessWidget {
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
int buildCounter = 0;
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


  buildCounter++;
  print('Build count: $buildCounter');  // Using read() to avoid rebuilds of the entire widget

  return  Expanded(
    child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: cw(25)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [


          SizedBox(
            height: ch(30.26),
          ),
          AppText(
            txt: AppStrings.paymentMethodPleaseSelect,
            fontSize: AppFontSize.f14,
            color: AppColor.c082755,
            fontWeight: FontWeight.w600,
            lineHeight: 15,
          ),


          SizedBox(
            height: ch(10),
          ),

          AppText(
            txt: AppStrings.yourSavedCards,
            fontSize: AppFontSize.f14,
            color: AppColor.c082755,
            fontWeight: FontWeight.w700,
            lineHeight: 21,
          ),

          Divider(
              thickness: cw(1),
            color: AppColor.c082755,
          ),

          SizedBox(
            height: ch(10),
          ),
          Flexible(
            child: Consumer<PaymentMethodViewModel>(
              builder: (context, cardProvider, child) {
                return Container(
                  // color: Colors.red,
                  child: ListView.builder(
                    itemCount: cardProvider.savedCards.length,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var card = cardProvider.savedCards[index];

                      return Container(
                        // height: ch(50),
                        width: cw(375),
                        margin: EdgeInsets.only(bottom: ch(10)),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.c082755,width: cw(0.2)),
                          borderRadius: BorderRadius.circular(8),
                          color: AppColor.white,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 4.0,
                              spreadRadius: 0.0,
                              color: AppColor.c082755.withOpacity(0.30),
                            )
                          ],
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: cw(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    AssetUtils.masterCardp,
                                    width: cw(27),
                                    height: cw(27),
                                    fit: BoxFit.contain,
                                    filterQuality: FilterQuality.high,
                                  ),


                                  SizedBox(
                                    width: cw(10),
                                  ),

                                  AppText(
                                    txt: '************113123',
                                    color: AppColor.c677294,
                                    fontSize: AppFontSize.f22,
                                    fontWeight: FontWeight.w500,
                                    lineHeight: 33,
                                  ),
                                ],
                              ),

                              Radio<String>(
                                toggleable: true,
                                activeColor: AppColor.c082755,
                                value: card['cardNumber']!,
                                groupValue: cardProvider.selectedCard,
                                onChanged: (String? value) {
                                  cardProvider.selectCard(value!);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),

          SizedBox(
            height: ch(10),
          ),


          // ** Payment Details  ** //
          _paymentDetailsCard(
            context: context
          ),

          SizedBox(
            height: ch(16),
          ),

          // ** Add new Card button ** //
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: cw(0)),
            child: Center(
              child: AppButton(
                width: cw(375),
                text: AppStrings.addNewCard,
                onPressed: () {

                  Navigator.pushNamed(context, Routes.cardDetails);


                },
              ),
            ),
          ),


        ],
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
          title: 'Payment Method',
          searchIcon: AppBarSearchIcon(
              onPressed: (){}
          ),

        ),

      ]
  );
}

Widget _paymentDetailsCard({required BuildContext context}){
  return Container(
    width: cw(375),
    // height: ch(207),
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
          blurRadius: 4.0,
          spreadRadius: 0.0,
          color: AppColor.c082755.withOpacity(0.30),
        )
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


        // Payment details , amount and logos //
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: cw(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                height: ch(7),
              ),

              AppText(
                txt: AppStrings.paymentDetails,
                fontSize: AppFontSize.f17,
                color: AppColor.c082755,
                fontWeight: FontWeight.w700,
                lineHeight: 25.5,
              ),
              SizedBox(
                height: ch(12),
              ),

              AppText(
                txt: '\$85',
                fontSize: AppFontSize.f18,
                color: AppColor.c082755,
                fontWeight: FontWeight.w700,
                lineHeight: 18,
              ),

              SizedBox(
                height: ch(7),
              ),

              AppText(
                txt: 'Total Amount',
                fontSize: AppFontSize.f16,
                color: AppColor.c082755,
                fontWeight: FontWeight.w600,
                lineHeight: 18,
              ),


              // All transactions logos
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Image.asset(
                    AssetUtils.visa,
                    width: cw(61.62),
                    height: cw(61.62),
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                  Image.asset(
                    AssetUtils.masterCardp,
                    width: cw(61.62),
                    height: cw(61.62),
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                  Image.asset(
                    AssetUtils.discover,
                    width: cw(61.62),
                    height: cw(61.62),
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                  Image.asset(
                    AssetUtils.americanExpress,
                    width: cw(61.62),
                    height: cw(61.62),
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),



                ],
              ),

              SizedBox(
                height: ch(10),
              ),
            ],
          ),
        ),

        Padding(
          padding:  EdgeInsets.symmetric(horizontal: cw(9)),
          child: Center(
            child: AppButton(
              width: cw(375),
              text: AppStrings.processPayment,
              onPressed: () {
              },
            ),
          ),
        ),

        SizedBox(
          height: ch(13),
        ),

      ],
    ),
  );
}




