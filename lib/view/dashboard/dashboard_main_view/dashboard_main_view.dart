import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uhcs_dental_app/ui/molecules/app_text/app_text.dart';
import 'package:uhcs_dental_app/ui/molecules/appbar/widgets/app_bar_back_button.dart';
import 'package:uhcs_dental_app/ui/molecules/appbar/widgets/app_bar_search_icon.dart';
import 'package:uhcs_dental_app/ui/molecules/textfields/textfield.dart';
import 'package:uhcs_dental_app/utils/app_dismiss_keyboard.dart';
import 'package:uhcs_dental_app/utils/app_strings.dart';
import 'package:uhcs_dental_app/view/auth/login/login_screen.dart';
import 'package:uhcs_dental_app/view/auth/register/register_screen.dart';
import 'package:uhcs_dental_app/view/dashboard/notifications/notifications_view.dart';
import 'package:uhcs_dental_app/view_model/auth/register/register_viewModel.dart';
import 'package:uhcs_dental_app/view_model/dashboard/dashboard_main/dashboard_main_viewModel.dart';

import '../../../providers/api_integration_provider.dart';
import '../../../ui/molecules/app_text/app_rich_text.dart';
import '../../../ui/molecules/appbar/appbar.dart';
import '../../../ui/molecules/bottom_sheets/forgot_password_bottomsheet.dart';
import '../../../ui/molecules/bottom_sheets/main_bottomsheet.dart';
import '../../../ui/molecules/buttons/app_primary_button.dart';
import '../../../ui/molecules/buttons/app_text_button.dart';
import '../../../ui/molecules/checkbox/checkbox.dart';
import '../../../ui/molecules/drawer/main_drawer.dart';
import '../../../ui/molecules/dropdowns/custom_primary_dropdown.dart';
import '../../../ui/molecules/slider/slider.dart';
import '../../../ui/molecules/textfields/app_textfield.dart';
import '../../../ui/molecules/textfields/disabled_textfield.dart';
import '../../../ui/molecules/textfields/search_textfield.dart';
import '../../../ui/molecules/textfields/secondary_textfield.dart';
import '../../../utils/asset_utils.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/font_size.dart';
import '../../../utils/helpers/app_layout_helpers.dart';
import '../../../utils/helpers/flow_keys.dart';
import '../../../utils/routes.dart';
import '../../../view_model/auth/login/login_viewModel.dart';
import '../../e_visit/online_intake_specialist/online_intake_specialist_view.dart';

class DashboardMainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            drawer: MainDrawer(),
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
  buildCounter++;
  print('Build count: $buildCounter');  // Using read() to avoid rebuilds of the entire widget

  List<Map<String, String>> servicesItems = [
    {
      "image": AssetUtils.dentalPain,
      "text": "Dental Pain",
    },
    {
      "image": AssetUtils.gumDisease,
      "text": "Gum Disease",
    },
    {
      "image": AssetUtils.fillings,
      "text": "Fillings",
    },
    {
      "image": AssetUtils.dentalPain,
      "text": "Jaw Injury",
    },

  ];

  return Expanded(
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: ch(19.26)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: cw(0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // ** Upper Body ** //
                // State and search ///

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: cw(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ** Current State ** //
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
                          CustomPrimaryDropdown<DashboardMainViewModel>(
                            dropdownItem: {}, // Pass the required data
                            onPressHandler: null, // Handle tap if needed
                            selectedState: (provider) => provider.selectedState, // Get state
                            onStateSelected: (provider, newState) => provider.setSelectedState(newState), // Set state
                          ),
                        ],
                      ),
                      SizedBox(height: ch(21)),


                      // *** Search TextField using Consumer *** //
                      Consumer<DashboardMainViewModel>(
                        builder: (context, searchProvider, child) {
                          return SearchTextField<DashboardMainViewModel>(
                            hintText: AppStrings.searchByDoctor,
                            provider: searchProvider,
                            getSearchQuery: (provider) => provider.searchQuery,
                            updateSearchQuery: (provider, query) {
                              provider.updateSearchQuery(query);
                            },
                            clearSearchQuery: (provider) {
                              provider.clearSearchQuery();
                            },
                            controller: searchProvider.searchController, // Pass the controller here
                          );
                        },
                      ),

                      SizedBox(
                        height: ch(20.16),
                      ),
                    ],
                  ),
                ),

                CarouselSliderWidget(
                  images: const [
                    AssetUtils.promotion2,
                    AssetUtils.promotion1,
                    AssetUtils.promotion3,

                  ],
                ),


              // ** Lower body ** //
                // evisit banner and services //
              Padding(
                padding: EdgeInsets.symmetric(horizontal: cw(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [



                    SizedBox(
                      height: ch(19.83),
                    ),


                    //** E Visit Container **//
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, Routes.onlineIntakeSpecialist);

                      },
                      child: Container(
                        width: cw(375),
                        // height: ch(129.64),
                        decoration:  BoxDecoration(
                            // color: AppColor.cdfe7f1,
                            borderRadius: BorderRadius.circular(cw(12))
                        ),

                        child: Column(
                          children: [

                            Image.asset(
                              AssetUtils.eVisitBanner,
                              filterQuality: FilterQuality.high,
                            ),

                          ],
                        ),
                      ),
                    ),


                    SizedBox(
                      height: ch(20.08),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          txt: AppStrings.services,
                          fontSize: AppFontSize.f15,
                          color: AppColor.c082755,
                          fontWeight: FontWeight.w400,
                          lineHeight: 21,
                        ),


                        // ** See all ** //
                        GestureDetector(
                          onTap: (){

                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => WalkthroughView()),
                            // );

                          },
                          child: Row(
                            children: [
                              AppText(
                                txt: 'See all',
                                fontSize: AppFontSize.f14,
                                color: AppColor.c082755,
                                fontWeight: FontWeight.w400,
                                lineHeight: 16.92,
                              ),

                              SizedBox(
                                width: cw(5.29),
                              ),

                              SvgPicture.asset(
                                AssetUtils.forwardDarkBlueArrow,
                                width: cw(7),
                                height: ch(11),
                                fit: BoxFit.contain,
                              ),



                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: ch(5),
                    ),



                  ],
                ),
              ),

                //** Servives Sliders **//
                // Container(
                //   height: ch(98.5),
                //   padding: EdgeInsets.only(left: cw(16)),
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     // padding: EdgeInsets.zero,
                //     shrinkWrap: true,
                //     itemCount: servicesItems.length,
                //     // physics: const NeverScrollableScrollPhysics(),
                //     itemBuilder: ((context, index) {
                //       // final isLastItemIndex = index == businessLineList.length - 1;
                //
                //       final image = servicesItems[index]['image'];
                //       final textTitle = servicesItems[index]['text'];
                //
                //       return Column(
                //         mainAxisAlignment: MainAxisAlignment.end,
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //
                //
                //           Container(
                //             width: cw(88.66),
                //             // height: ch(70.25),
                //             height: ch(71),
                //             margin:EdgeInsets.only(right: cw(8.27)),
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(cw(6)),
                //               // color: AppColor.cA7C1E666,
                //               gradient: const LinearGradient(
                //                 begin: Alignment.centerLeft,
                //                 end: Alignment.centerRight,
                //                 colors: [
                //                   Color.fromRGBO(187, 200, 209, 0.4),
                //                   Color.fromRGBO(167, 193, 230, 0.4),
                //                 ],
                //               ),
                //             ),
                //             child: Column(
                //               mainAxisAlignment: MainAxisAlignment.end,
                //
                //               children: [
                //                 Align(
                //                   alignment:Alignment.bottomCenter,
                //                   child: Image.asset(
                //                     image!,
                //                     filterQuality: FilterQuality.high,
                //                     fit: BoxFit.cover,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //
                //           SizedBox(
                //             height: ch(11.38),
                //           ),
                //
                //           Padding(
                //             padding:  EdgeInsets.only(right: cw(6)),
                //             child: AppText(
                //               txt: textTitle!,
                //               fontSize: AppFontSize.f14,
                //               color: AppColor.c082755,
                //               fontWeight: FontWeight.w500,
                //               lineHeight: 15,
                //             ),
                //           ),
                //
                //         ],
                //       );
                //     }),
                //   ),
                // ),



                Container(
                  // height: ch(98.5),
                  height: ch(110),
                  padding: EdgeInsets.only(left: cw(16)),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: servicesItems.length,
                    itemBuilder: (context, index) {
                      final isLastItemIndex = index == servicesItems.length - 1;

                      final image = servicesItems[index]['image'];
                      final textTitle = servicesItems[index]['text'];

                      return Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: cw(88.66),
                                height: ch(72),
                                margin: EdgeInsets.only(right: cw(8.27)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(cw(6)),
                                  gradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color.fromRGBO(187, 200, 209, 0.4),
                                      Color.fromRGBO(167, 193, 230, 0.4),
                                    ],
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Flexible(
                                      child: Image.asset(
                                        image!,
                                        filterQuality: FilterQuality.high,
                                        fit: BoxFit.contain, // Ensures the image scales properly
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: ch(11.38)),
                              Padding(
                                padding: EdgeInsets.only(right: cw(6)),
                                child: AppText(
                                  txt: textTitle!,
                                  fontSize: AppFontSize.f12,
                                  color: AppColor.c082755,
                                  fontWeight: FontWeight.w500,
                                  lineHeight: 15,
                                ),
                              ),
                              
                              SizedBox(
                                height: ch(5),
                              ),
                            ],
                          ),

                          if(isLastItemIndex)...[

                            SizedBox(width: cw(16),),
                          ]
                        ],
                      );
                    },
                  ),
                )

              ],
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


      SizedBox(
        height: ch(24),
      ),

      //** App Bar ** //

      Container(
        height: ch(60),
        width: cw(375),
        decoration: BoxDecoration(
          color: AppColor.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0.0, 4.0),
              blurRadius: 4.0,
              spreadRadius: 0.0,
              color: AppColor.c082755.withOpacity(0.30),
            ),
          ],
        ),

        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: cw(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [


              /// change into dynamic image later
              // Profile Image
              Builder(
              builder: (BuildContext innerContext) {
                return GestureDetector(
                  onTap: () {
                    // Scaffold.of(innerContext).openDrawer();
                    Scaffold.of(context).openDrawer();
                  },
                  child: Image.asset(
                    AssetUtils.avatar,
                    width: cw(39),
                    height: cw(39),
                    filterQuality: FilterQuality.high,
                  ),
                );
              }),

              SvgPicture.asset(
                AssetUtils.uhcsDentalMainLogo,
                width: cw(75.11),
                height: ch(38.83),
                fit: BoxFit.contain,
              ),

                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, Routes.notifications);

                          },
                          child: SvgPicture.asset(
                            AssetUtils.newBellIcon,
                            width: cw(20.6),
                            height: ch(23.64),
                            fit: BoxFit.contain,
                          ),
                        ),





            ],
          ),
        ),
      ),

    ],
  );
}


// *** Search Beneficiary TextField **** //
Widget _buildSearchBeneficiaryTextField() {
  return Center(
    child: Container(
      width: cw(327),
      height: ch(52.55),
      color: Colors.red,
      child: AppTextField(
        controller: TextEditingController(),
        labelText: 'hello world',
        borderRadius: cw(16),
        hintText: "",
        hintStyle: TextStyle(
          color: AppColor.cB5B5B5,
          fontFamily: 'Nunito',
          fontSize: AppFontSize.f14,
          fontWeight: FontWeight.w400,
          height: 1.4,
        ),
        suffixIcon: Container(
          padding: EdgeInsets.only(right: 8.w),
          child: GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              AssetUtils.forwardBlueArrow,
              width: 5.06.w,
              height: 5.06.w,
            ),
          ),
        ),
        onChanged: (val) {},
      ),
    ),
  );
}






