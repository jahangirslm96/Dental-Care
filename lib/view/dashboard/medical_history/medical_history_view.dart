import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uhcs_dental_app/ui/molecules/appbar/widgets/app_bar_back_button.dart';
import 'package:uhcs_dental_app/ui/molecules/appbar/widgets/app_bar_search_icon.dart';
import 'package:uhcs_dental_app/ui/molecules/bottom_navigation/custom_bottom_navigation.dart';
import 'package:uhcs_dental_app/utils/app_dismiss_keyboard.dart';
import 'package:uhcs_dental_app/utils/font_size.dart';
import 'package:uhcs_dental_app/utils/helpers/app_layout_helpers.dart';
import 'package:uhcs_dental_app/view/dashboard/payment_method/payment_method_view.dart';
import 'package:uhcs_dental_app/view/dashboard/profile/my_profile/widgets/activities_view.dart';
import 'package:uhcs_dental_app/view/dashboard/profile/my_profile/widgets/personal_info_view.dart';


import '../../../../ui/molecules/app_text/app_text.dart';
import '../../../../utils/asset_utils.dart';
import '../../../../utils/color_utils.dart';
import '../../../ui/molecules/app_text/app_rich_text.dart';
import '../../../ui/molecules/bottom_sheets/medical_history_bottomsheets/add_medical_conditions_bottomsheet.dart';
import '../../../ui/molecules/bottom_sheets/medical_history_bottomsheets/family_details_bottomsheet.dart';
import '../../../ui/molecules/buttons/app_primary_button.dart';
import '../../../ui/molecules/textfields/secondary_textfield.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/file_picker.dart';
import '../../../view_model/dashboard/medical_history/medical_history_view_model.dart';


class MedicalHistoryView extends StatefulWidget {
  @override
  _MedicalHistoryViewState createState() => _MedicalHistoryViewState();
}

class _MedicalHistoryViewState extends State<MedicalHistoryView> with SingleTickerProviderStateMixin {

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
              _buildAppBar(context),
              _buildBody(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: cw(12)),
          child: Consumer<MedicalHistoryViewModel>(
            builder: (context , provider,child){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  SizedBox(
                    height: ch(15.73),
                  ),

                  AppText(
                    txt: AppStrings.allYourMedical,
                    fontSize: AppFontSize.f19,
                    color: AppColor.c082755,
                    fontWeight: FontWeight.w600,
                    lineHeight: 24,
                  ),

                  SizedBox(
                    height: ch(15.73),
                  ),

                  // ** All Type of allergies ** //
                  _blueContainer(
                    width: cw(375),
                    // height: ch(112),
                    height: null,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: cw(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SizedBox(
                            height: ch(10.32),
                          ),


                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: cw(10)),
                            child: AppText(
                              txt: 'All Types of Allergies',
                              fontSize: AppFontSize.f14,
                              color: AppColor.c082755,
                              fontWeight: FontWeight.w600,
                              lineHeight: 18,
                            ),
                          ),

                          SizedBox(
                            height: ch(10),
                          ),

                          Divider(
                            height: 0,
                            thickness: ch(1),
                            color: AppColor.c082755,
                          ),

                          SizedBox(
                            height: ch(15.61),
                          ),

                          SecondaryTextField(
                            controller: TextEditingController(),
                            hintText: 'dental cement, latex gloves',
                          ),

                          SizedBox(
                            height: ch(24),
                          ),

                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: ch(12),
                  ),

                  // ** Any Type of allergies ** //
                  _blueContainer(
                    width: cw(375),
                    // height: ch(112),
                    height: null,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: cw(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SizedBox(
                            height: ch(10.32),
                          ),


                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: cw(10)),
                            child: AppText(
                              txt: 'Any Types of Allergies',
                              fontSize: AppFontSize.f14,
                              color: AppColor.c082755,
                              fontWeight: FontWeight.w600,
                              lineHeight: 18,
                            ),
                          ),

                          SizedBox(
                            height: ch(10),
                          ),

                          Divider(
                            height: 0,
                            thickness: ch(1),
                            color: AppColor.c082755,
                          ),

                          SizedBox(
                            height: ch(15.61),
                          ),

                          SecondaryTextField(
                            controller: TextEditingController(),
                            hintText: 'Wisdom tooth removal',
                          ),

                          SizedBox(
                            height: ch(24),
                          ),

                        ],
                      ),
                    ),
                  ),


                  SizedBox(
                    height: ch(19),
                  ),


                  // For Medical Conditions //
                  provider.conditions.isEmpty
                      ? Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            txt: 'Medical Conditions',
                            fontSize: AppFontSize.f16,
                            color: AppColor.c082755,
                            fontWeight: FontWeight.w700,
                            lineHeight: 21,
                          ),

                          AppButton(
                            width: cw(63),
                              height: ch(21),
                              text: 'Add',
                              fontSize: AppFontSize.f11,
                              fontWeight: FontWeight.w500,
                              borderRadius: cw(7),
                              onPressed: () => showModalBottomSheet(
                            context: context,
                            builder: (context) => AddMedicalConditionsBottomSheet(),
                            ),
                          ),
                        ],
                      ) : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        txt: 'Medical Conditions',
                        fontSize: AppFontSize.f16,
                        color: AppColor.c082755,
                        fontWeight: FontWeight.w700,
                        lineHeight: 21,
                      ),
                      SizedBox(
                        height: ch(12),
                      ),
                      _blueContainer(
                        height: null,
                        width: cw(375),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: cw(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: ch(10.32)),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: cw(10)),
                                child: AppText(
                                  txt: 'Disease',
                                  fontSize: AppFontSize.f14,
                                  color: AppColor.c082755,
                                  fontWeight: FontWeight.w600,
                                  lineHeight: 18,
                                ),
                              ),
                              SizedBox(height: ch(10)),
                              Divider(
                                height: 0,
                                thickness: ch(1),
                                color: AppColor.c082755,
                              ),
                              SizedBox(height: ch(15.61)),

                              Column(
                                children: List.generate(provider.conditions.length, (index) {
                                  return Column(
                                    children: [
                                      SecondaryTextField(
                                        width: cw(375),
                                        controller: TextEditingController(),
                                        hintText: provider.conditions[index].condition,
                                      ),
                                      SizedBox(height: index == provider.conditions.length - 1 ? ch(12) : ch(10)),
                                    ],
                                  );
                                }),
                              ),


                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: ch(19),
                  ),


                  // For Immunization History //
                  if (provider.conditions.isEmpty) Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            txt: 'Immunization History',
                            fontSize: AppFontSize.f16,
                            color: AppColor.c082755,
                            fontWeight: FontWeight.w700,
                            lineHeight: 21,
                          ),

                          AppButton(
                            width: cw(63),
                              height: ch(21),
                              text: 'Add',
                              fontSize: AppFontSize.f11,
                              fontWeight: FontWeight.w500,
                              borderRadius: cw(7),
                              onPressed: () => showModalBottomSheet(
                            context: context,
                            builder: (context) => AddMedicalConditionsBottomSheet(),
                            ),
                          ),
                        ],
                      ) else Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      AppText(
                        txt: 'Immunization History',
                        fontSize: AppFontSize.f16,
                        color: AppColor.c082755,
                        fontWeight: FontWeight.w700,
                        lineHeight: 21,
                      ),
                      SizedBox(
                        height: ch(12),
                      ),
                      _blueContainer(
                        height: null,
                        width: cw(375),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: cw(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: ch(10.32)),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: cw(10)),
                                child: AppText(
                                  txt: 'Immunization History',
                                  fontSize: AppFontSize.f14,
                                  color: AppColor.c082755,
                                  fontWeight: FontWeight.w600,
                                  lineHeight: 18,
                                ),
                              ),
                              SizedBox(height: ch(10)),
                              Divider(
                                height: 0,
                                thickness: ch(1),
                                color: AppColor.c082755,
                              ),
                              SizedBox(height: ch(15.61)),

                              Column(
                                children: List.generate(provider.conditions.length, (index) {
                                  return Column(
                                    children: [
                                      SecondaryTextField(
                                        width: cw(375),
                                        controller: TextEditingController(),
                                        hintText: provider.conditions[index].condition,
                                      ),
                                      SizedBox(height: index == provider.conditions.length - 1 ? ch(12) : ch(10)),
                                    ],
                                  );
                                }),
                              ),


                            ],
                          ),
                        ),
                      ),
                    ],
                  ),


                  SizedBox(
                    height: ch(19),
                  ),


                  // For Family Details  //
                  if (provider.conditions.isEmpty) Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              txt: 'Family Details',
                              fontSize: AppFontSize.f16,
                              color: AppColor.c082755,
                              fontWeight: FontWeight.w700,
                              lineHeight: 21,
                            ),

                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: cw(10)),
                              child: AppText(
                                txt: 'Has any of your family member (including parents, grandparents, and siblings)  ever had the following',
                                fontSize: AppFontSize.f10,
                                color: AppColor.c082755,
                                fontWeight: FontWeight.w400,
                                lineHeight: 12,
                              ),
                            ),
                          ],
                        ),
                      ),

                      AppButton(
                        width: cw(63),
                        height: ch(21),
                        text: 'Add',
                        fontSize: AppFontSize.f11,
                        fontWeight: FontWeight.w500,
                        borderRadius: cw(7),
                        onPressed: () => showModalBottomSheet(
                          context: context,
                          builder: (context) => FamilyDetailsBottomSheet(),
                        ),
                      ),
                    ],
                  ) else Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              // Title
              AppText(
              txt: 'Family Details',
              fontSize: AppFontSize.f16,
              color: AppColor.c082755,
              fontWeight: FontWeight.w700,
              lineHeight: 21,
              ),
              SizedBox(height: ch(12)),

              // Family History Section
              _blueContainer(
              height: null,
              width: cw(375),
              child: Padding(
              padding: EdgeInsets.symmetric(horizontal: cw(10)),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SizedBox(height: ch(10.32)),

              // Section Header
              AppText(
              txt: 'Family History',
              fontSize: AppFontSize.f14,
              color: AppColor.c082755,
              fontWeight: FontWeight.w600,
              lineHeight: 18,
              ),
              SizedBox(height: ch(10)),
              Divider(
              height: 0,
              thickness: ch(1),
              color: AppColor.c082755,
              ),
              SizedBox(height: ch(15.61)),

              // Condition List
              Column(
              children: List.generate(provider.conditions.length, (index) {
              final condition = provider.conditions[index];
              return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              // Condition Name
              SecondaryTextField(
              width: cw(375),
              controller: TextEditingController(),
              hintText: condition.condition,
              ),
              SizedBox(height: ch(8)),

              // Age Field (Read-Only)
              SecondaryTextField(
              isDisabled: true,
              width: cw(375),
              controller: TextEditingController(),
              hintText: condition.age?.toString() ?? 'N/A',
              ),
              SizedBox(height: ch(8)),

              // Family Member Count Field (Read-Only)
              SecondaryTextField(
              isDisabled: true,
              width: cw(375),
              controller: TextEditingController(),
              hintText: condition.familyMemberCount?.toString() ?? 'N/A',
              ),

              // Additional Info: Relationship & Severity
              if (condition.relationship != null || condition.severity != null)
              Padding(
              padding: EdgeInsets.only(top: ch(8)),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              if (condition.relationship != null)
              AppText(
              txt: 'Relationship: ${condition.relationship}',
              fontSize: AppFontSize.f12,
              color: AppColor.c677294,
              fontWeight: FontWeight.w400,
              ),
              if (condition.severity != null)
              AppText(
              txt: 'Severity: ${condition.severity}',
              fontSize: AppFontSize.f12,
              color: AppColor.c677294,
              fontWeight: FontWeight.w400,
              ),
              ],
              ),
              ),

              // Space between conditions
              SizedBox(height: index == provider.conditions.length - 1 ? ch(12) : ch(10)),
              ],
              );
              }),
              ),
              ],
              ),
              ),
              ),
              ],
              ),

              //   Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //
                  //     AppText(
                  //       txt: 'Family Details',
                  //       fontSize: AppFontSize.f16,
                  //       color: AppColor.c082755,
                  //       fontWeight: FontWeight.w700,
                  //       lineHeight: 21,
                  //     ),
                  //     SizedBox(
                  //       height: ch(12),
                  //     ),
                  //     _blueContainer(
                  //       height: null,
                  //       width: cw(375),
                  //       child: Padding(
                  //         padding: EdgeInsets.symmetric(horizontal: cw(10)),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             SizedBox(height: ch(10.32)),
                  //             Padding(
                  //               padding: EdgeInsets.symmetric(horizontal: cw(10)),
                  //               child: AppText(
                  //                 txt: 'Family History',
                  //                 fontSize: AppFontSize.f14,
                  //                 color: AppColor.c082755,
                  //                 fontWeight: FontWeight.w600,
                  //                 lineHeight: 18,
                  //               ),
                  //             ),
                  //             SizedBox(height: ch(10)),
                  //             Divider(
                  //               height: 0,
                  //               thickness: ch(1),
                  //               color: AppColor.c082755,
                  //             ),
                  //             SizedBox(height: ch(15.61)),
                  //
                  //             Column(
                  //               children: List.generate(provider.conditions.length, (index) {
                  //                 return Column(
                  //                   children: [
                  //                     SecondaryTextField(
                  //                       width: cw(375),
                  //                       controller: TextEditingController(),
                  //                       hintText: provider.conditions[index].condition,
                  //                     ),
                  //                     SizedBox(height: index == provider.conditions.length - 1 ? ch(12) : ch(10)),
                  //                   ],
                  //                 );
                  //               }),
                  //             ),
                  //
                  //
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),

                ],
              );
            },
          ),
        ),
      ),
    );
  }


  // Widget _buildBody(BuildContext context) {
  //   return Expanded(
  //     child: SingleChildScrollView(
  //       child: Padding(
  //         padding:  EdgeInsets.symmetric(horizontal: cw(12)),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: [
  //
  //             SizedBox(
  //               height: ch(15.73),
  //             ),
  //
  //             AppText(
  //               txt: AppStrings.allYourMedical,
  //               fontSize: AppFontSize.f19,
  //               color: AppColor.c082755,
  //               fontWeight: FontWeight.w600,
  //               lineHeight: 24,
  //             ),
  //
  //             SizedBox(
  //               height: ch(15.73),
  //             ),
  //
  //             // ** All Type of allergies ** //
  //             x(
  //               width: cw(375),
  //               // height: ch(112),
  //               height: null,
  //               child: Padding(
  //                 padding:  EdgeInsets.symmetric(horizontal: cw(10)),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //
  //                     SizedBox(
  //                       height: ch(10.32),
  //                     ),
  //
  //
  //                     Padding(
  //                       padding:  EdgeInsets.symmetric(horizontal: cw(10)),
  //                       child: AppText(
  //                         txt: 'All Types of Allergies',
  //                         fontSize: AppFontSize.f14,
  //                         color: AppColor.c082755,
  //                         fontWeight: FontWeight.w600,
  //                         lineHeight: 18,
  //                       ),
  //                     ),
  //
  //                     SizedBox(
  //                       height: ch(10),
  //                     ),
  //
  //                     Divider(
  //                       height: 0,
  //                       thickness: ch(1),
  //                       color: AppColor.c082755,
  //                     ),
  //
  //                     SizedBox(
  //                       height: ch(15.61),
  //                     ),
  //
  //                     SecondaryTextField(
  //                       controller: TextEditingController(),
  //                       hintText: 'dental cement, latex gloves',
  //                     ),
  //
  //                     SizedBox(
  //                       height: ch(24),
  //                     ),
  //
  //                   ],
  //                 ),
  //               ),
  //             ),
  //
  //             SizedBox(
  //               height: ch(12),
  //             ),
  //
  //             // ** Any Type of allergies ** //
  //             _blueContainer(
  //               width: cw(375),
  //               // height: ch(112),
  //               height: null,
  //               child: Padding(
  //                 padding:  EdgeInsets.symmetric(horizontal: cw(10)),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //
  //                     SizedBox(
  //                       height: ch(10.32),
  //                     ),
  //
  //
  //                     Padding(
  //                       padding:  EdgeInsets.symmetric(horizontal: cw(10)),
  //                       child: AppText(
  //                         txt: 'Any Types of Allergies',
  //                         fontSize: AppFontSize.f14,
  //                         color: AppColor.c082755,
  //                         fontWeight: FontWeight.w600,
  //                         lineHeight: 18,
  //                       ),
  //                     ),
  //
  //                     SizedBox(
  //                       height: ch(10),
  //                     ),
  //
  //                     Divider(
  //                       height: 0,
  //                       thickness: ch(1),
  //                       color: AppColor.c082755,
  //                     ),
  //
  //                     SizedBox(
  //                       height: ch(15.61),
  //                     ),
  //
  //                     SecondaryTextField(
  //                       controller: TextEditingController(),
  //                       hintText: 'Wisdom tooth removal',
  //                     ),
  //
  //                     SizedBox(
  //                       height: ch(24),
  //                     ),
  //
  //                   ],
  //                 ),
  //               ),
  //             ),
  //
  //
  //             SizedBox(
  //               height: ch(19),
  //             ),
  //
  //
  //
  //
  //             // Text Fields for allergies and surgeries
  //             TextField(
  //               decoration: InputDecoration(
  //                 labelText: 'All Types of Allergies',
  //                 hintText: 'Enter your allergies here',
  //               ),
  //             ),
  //             SizedBox(height: 10),
  //             TextField(
  //               decoration: InputDecoration(
  //                 labelText: 'Any Types of Surgeries',
  //                 hintText: 'Enter your surgeries and operations',
  //               ),
  //             ),
  //             SizedBox(height: 20),
  //
  //             // Displaying the list of medical conditions
  //             Consumer<MedicalHistoryViewModel>(
  //               builder: (context, provider, child) {
  //                 return Container(
  //                   height: ch(200),
  //                   color: Colors.red,
  //                   child: ListView(
  //                     children: provider.conditions
  //                         .map((condition) => ListTile(
  //                       title: Text(condition.condition),
  //                     ))
  //                         .toList(),
  //                   ),
  //                 );
  //               },
  //             ),
  //
  //             // Button to add a new medical condition
  //             ElevatedButton(
  //               onPressed: () => showModalBottomSheet(
  //                 context: context,
  //                 builder: (context) => AddMedicalConditionsBottomSheet(),
  //               ),
  //               child: Text('Add Medical Condition'),
  //             ),
  //
  //
  //             AppText(
  //               txt: '---------------------------------------------------',
  //               fontSize: AppFontSize.f16,
  //               color: AppColor.c082755,
  //               fontWeight: FontWeight.w700,
  //               lineHeight: 21,
  //             ),
  //
  //             AppText(
  //               txt: 'Medical Conditions',
  //               fontSize: AppFontSize.f16,
  //               color: AppColor.c082755,
  //               fontWeight: FontWeight.w700,
  //               lineHeight: 21,
  //             ),
  //
  //
  //
  //             SizedBox(
  //               height: ch(19),
  //             ),
  //
  //
  //             // ** Medical Conditions ** //
  //             _blueContainer(
  //               width: cw(375),
  //               height: null,
  //               child: Padding(
  //                 padding:  EdgeInsets.symmetric(horizontal: cw(10)),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //
  //                     SizedBox(
  //                       height: ch(10.32),
  //                     ),
  //
  //
  //                     Padding(
  //                       padding:  EdgeInsets.symmetric(horizontal: cw(10)),
  //                       child: AppText(
  //                         txt: 'Disease',
  //                         fontSize: AppFontSize.f14,
  //                         color: AppColor.c082755,
  //                         fontWeight: FontWeight.w600,
  //                         lineHeight: 18,
  //                       ),
  //                     ),
  //
  //                     SizedBox(
  //                       height: ch(10),
  //                     ),
  //
  //                     Divider(
  //                       height: 0,
  //                       thickness: ch(1),
  //                       color: AppColor.c082755,
  //                     ),
  //
  //                     SizedBox(
  //                       height: ch(15.61),
  //                     ),
  //
  //
  //                     Consumer<MedicalHistoryViewModel>(
  //                       builder: (context, provider, child) {
  //                         return Container(
  //                           height: ch(200),
  //                           color: Colors.red,
  //                           child: ListView(
  //                             children: provider.conditions
  //                                 .map((condition) => ListTile(
  //                               title:SecondaryTextField(
  //                                 controller: TextEditingController(),
  //                                 hintText: condition.condition,
  //                               ),
  //                               // Text(condition.condition),
  //                             ))
  //                                 .toList(),
  //                           ),
  //                         );
  //                       },
  //                     ),
  //
  //                     SizedBox(
  //                       height: ch(13),
  //                     ),
  //
  //                   ],
  //                 ),
  //               ),
  //             ),
  //
  //             SizedBox(
  //               height: ch(14),
  //             ),
  //
  //             AppText(
  //               txt: 'Immunization History',
  //               fontSize: AppFontSize.f16,
  //               color: AppColor.c082755,
  //               fontWeight: FontWeight.w700,
  //               lineHeight: 21,
  //             ),
  //
  //
  //             SizedBox(
  //               height: ch(9),
  //             ),
  //
  //             // ** Immunization History ** //
  //             _blueContainer(
  //               width: cw(375),
  //               // height: ch(112),
  //               height: null,
  //               child: Padding(
  //                 padding:  EdgeInsets.symmetric(horizontal: cw(10)),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //
  //                     SizedBox(
  //                       height: ch(10.32),
  //                     ),
  //
  //
  //                     Padding(
  //                       padding:  EdgeInsets.symmetric(horizontal: cw(10)),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           AppText(
  //                             txt: 'Vaccination',
  //                             fontSize: AppFontSize.f14,
  //                             color: AppColor.c082755,
  //                             fontWeight: FontWeight.w600,
  //                             lineHeight: 18,
  //                           ),
  //
  //                           Padding(
  //                             padding:  EdgeInsets.only(right: cw(45)),
  //                             child: AppText(
  //                               txt: 'Yes/No',
  //                               fontSize: AppFontSize.f14,
  //                               color: AppColor.c082755,
  //                               fontWeight: FontWeight.w600,
  //                               lineHeight: 18,
  //                             ),
  //                           ),
  //
  //                           AppText(
  //                             txt: 'When',
  //                             fontSize: AppFontSize.f14,
  //                             color: AppColor.c082755,
  //                             fontWeight: FontWeight.w600,
  //                             lineHeight: 18,
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //
  //                     SizedBox(
  //                       height: ch(10),
  //                     ),
  //
  //                     Divider(
  //                       height: 0,
  //                       thickness: ch(1),
  //                       color: AppColor.c082755,
  //                     ),
  //
  //                     SizedBox(
  //                       height: ch(16.91),
  //                     ),
  //
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         SecondaryTextField(
  //                           width:cw(100),
  //                           controller: TextEditingController(),
  //                           hintText: 'Acne',
  //                         ),
  //
  //                         SecondaryTextField(
  //                           width:cw(100),
  //                           controller: TextEditingController(),
  //                           hintText: 'Acne',
  //                         ),
  //
  //                         SecondaryTextField(
  //                           width:cw(100),
  //                           controller: TextEditingController(),
  //                           hintText: 'Acne',
  //                         ),
  //                       ],
  //                     ),
  //
  //
  //                     SizedBox(
  //                       height: ch(19),
  //                     ),
  //
  //                   ],
  //                 ),
  //               ),
  //             ),
  //
  //
  //             SizedBox(
  //               height: ch(14),
  //             ),
  //
  //             AppText(
  //               txt: 'Family Details',
  //               fontSize: AppFontSize.f16,
  //               color: AppColor.c082755,
  //               fontWeight: FontWeight.w700,
  //               lineHeight: 21,
  //             ),
  //
  //             SizedBox(
  //               height: ch(2),
  //             ),
  //
  //             Padding(
  //               padding:  EdgeInsets.symmetric(horizontal: cw(10)),
  //               child: AppText(
  //                 txt: 'Has any of your family member (including parents, grandparents, and siblings)  ever had the following',
  //                 fontSize: AppFontSize.f10,
  //                 color: AppColor.c082755,
  //                 fontWeight: FontWeight.w400,
  //                 lineHeight: 12,
  //               ),
  //             ),
  //
  //
  //             SizedBox(
  //               height: ch(12),
  //             ),
  //
  //              // ** Family Details ** //
  //             _blueContainer(
  //               width: cw(375),
  //             // height: ch(112),
  //             height: null,
  //             child: Padding(
  //               padding:  EdgeInsets.symmetric(horizontal: cw(10)),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //
  //                   SizedBox(
  //                     height: ch(10.32),
  //                   ),
  //
  //
  //                   Padding(
  //                     padding:  EdgeInsets.symmetric(horizontal: cw(10)),
  //                     child: AppText(
  //                       txt: 'Disease',
  //                       fontSize: AppFontSize.f14,
  //                       color: AppColor.c082755,
  //                       fontWeight: FontWeight.w600,
  //                       lineHeight: 18,
  //                     ),
  //                   ),
  //
  //                   SizedBox(
  //                     height: ch(10),
  //                   ),
  //
  //                   Divider(
  //                     height: 0,
  //                     thickness: ch(1),
  //                     color: AppColor.c082755,
  //                   ),
  //
  //                   SizedBox(
  //                     height: ch(15.61),
  //                   ),
  //
  //                   SecondaryTextField(
  //                     controller: TextEditingController(),
  //                     hintText: 'Acne',
  //                   ),
  //
  //                   SizedBox(
  //                     height: ch(9),
  //                   ),
  //
  //                   Padding(
  //                     padding:  EdgeInsets.symmetric(horizontal: cw(10)),
  //                     child: AppText(
  //                       txt: 'Family Member',
  //                       fontSize: AppFontSize.f14,
  //                       color: AppColor.c082755,
  //                       fontWeight: FontWeight.w600,
  //                       lineHeight: 18,
  //                     ),
  //                   ),
  //
  //                   SizedBox(
  //                     height: ch(10),
  //                   ),
  //
  //                   Divider(
  //                     height: 0,
  //                     thickness: ch(1),
  //                     color: AppColor.c082755,
  //                   ),
  //
  //                   SizedBox(
  //                     height: ch(15.61),
  //                   ),
  //
  //                   SecondaryTextField(
  //                     controller: TextEditingController(),
  //                     hintText: '6',
  //                   ),
  //
  //
  //                   SizedBox(
  //                     height: ch(9),
  //                   ),
  //
  //
  //                   Padding(
  //                     padding:  EdgeInsets.symmetric(horizontal: cw(10)),
  //                     child: AppText(
  //                       txt: 'Approx. Age',
  //                       fontSize: AppFontSize.f14,
  //                       color: AppColor.c082755,
  //                       fontWeight: FontWeight.w600,
  //                       lineHeight: 18,
  //                     ),
  //                   ),
  //
  //                   SizedBox(
  //                     height: ch(10),
  //                   ),
  //
  //                   Divider(
  //                     height: 0,
  //                     thickness: ch(1),
  //                     color: AppColor.c082755,
  //                   ),
  //
  //                   SizedBox(
  //                     height: ch(15.61),
  //                   ),
  //
  //                   SecondaryTextField(
  //                     controller: TextEditingController(),
  //                     hintText: '21',
  //                   ),
  //
  //
  //                   SizedBox(
  //                     height: ch(22),
  //                   ),
  //
  //                 ],
  //               ),
  //             ),
  //           ),
  //
  //
  //
  //             SizedBox(
  //               height: ch(15),
  //             ),
  //
  //             AppText(
  //               txt: 'Medication History',
  //               fontSize: AppFontSize.f16,
  //               color: AppColor.c082755,
  //               fontWeight: FontWeight.w700,
  //               lineHeight: 21,
  //             ),
  //
  //
  //             SizedBox(
  //               height: ch(12),
  //             ),
  //
  //             // ** Medication History ** //
  //             _blueContainer(
  //               width: cw(375),
  //               height: null,
  //               child: Padding(
  //                 padding:  EdgeInsets.symmetric(horizontal: cw(10)),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //
  //                     SizedBox(
  //                       height: ch(10.32),
  //                     ),
  //
  //
  //                     Padding(
  //                       padding:  EdgeInsets.symmetric(horizontal: cw(10)),
  //                       child: AppText(
  //                         txt: 'Medication',
  //                         fontSize: AppFontSize.f14,
  //                         color: AppColor.c082755,
  //                         fontWeight: FontWeight.w600,
  //                         lineHeight: 18,
  //                       ),
  //                     ),
  //
  //                     SizedBox(
  //                       height: ch(10),
  //                     ),
  //
  //                     Divider(
  //                       height: 0,
  //                       thickness: ch(1),
  //                       color: AppColor.c082755,
  //                     ),
  //
  //                     SizedBox(
  //                       height: ch(15.61),
  //                     ),
  //
  //                     SecondaryTextField(
  //                       controller: TextEditingController(),
  //                       hintText: 'Acne',
  //                     ),
  //
  //                     SizedBox(
  //                       height: ch(9),
  //                     ),
  //
  //                     Padding(
  //                       padding:  EdgeInsets.symmetric(horizontal: cw(10)),
  //                       child: AppText(
  //                         txt: 'Dosage',
  //                         fontSize: AppFontSize.f14,
  //                         color: AppColor.c082755,
  //                         fontWeight: FontWeight.w600,
  //                         lineHeight: 18,
  //                       ),
  //                     ),
  //
  //                     SizedBox(
  //                       height: ch(10),
  //                     ),
  //
  //                     Divider(
  //                       height: 0,
  //                       thickness: ch(1),
  //                       color: AppColor.c082755,
  //                     ),
  //
  //                     SizedBox(
  //                       height: ch(15.61),
  //                     ),
  //
  //                     SecondaryTextField(
  //                       controller: TextEditingController(),
  //                       hintText: 'Acute lymphoblastic leukaemia',
  //                     ),
  //
  //
  //
  //                     SizedBox(
  //                       height: ch(15),
  //                     ),
  //
  //                   ],
  //                 ),
  //               ),
  //             ),
  //
  //             SizedBox(
  //               height: ch(12),
  //             ),
  //             AppText(
  //               txt: 'Medical Record',
  //               fontSize: AppFontSize.f16,
  //               color: AppColor.c082755,
  //               fontWeight: FontWeight.w700,
  //               lineHeight: 21,
  //             ),
  //
  //
  //             SizedBox(
  //               height: ch(5),
  //             ),
  //
  //
  //             AppText(
  //               txt: 'view_file',
  //               fontSize: AppFontSize.f16,
  //               color: AppColor.c082755,
  //               fontWeight: FontWeight.w700,
  //               lineHeight: 21,
  //             ),
  //
  //             Consumer<FilePickerProvider>(
  //               builder: (context, filePickerProvider, child) {
  //                 return ElevatedButton(
  //                   onPressed: () {
  //                     filePickerProvider.pickFile();
  //                   },
  //                   child: Text('Pick a File on Another Screen'),
  //                 );
  //               },
  //             ),
  //             SizedBox(height: 20),
  //             Consumer<FilePickerProvider>(
  //               builder: (context, filePickerProvider, child) {
  //                 return filePickerProvider.selectedFilePath != null
  //                     ? Text(
  //                   'Selected File: ${filePickerProvider.selectedFilePath}',
  //                   style: TextStyle(fontSize: 16, color: Colors.black),
  //                 )
  //                     : Text(
  //                   'No file selected',
  //                   style: TextStyle(fontSize: 16, color: Colors.grey),
  //                 );
  //               },
  //             ),
  //
  //
  //             SizedBox(
  //               height: ch(56),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _blueContainer({
        required Widget child,
        required double? height,
        required double width,
  }) {
    return Container(
      width: width,
      height: height,
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
      child: child, // Use the passed child here
    );
  }


  Widget _buildAppBar(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: ch(24)),
        Stack(

          children: [

            Image.asset(
              AssetUtils.profileBg,
              width: 100.w,
              // height: ch(195.54),
              height: ch(195.54 - 25),
              fit: BoxFit.fill,
              color: AppColor.c082755,
              filterQuality: FilterQuality.high,
            ),


            // ** Edit icon ** //
            Positioned(
              top: ch(19.09),
              right: cw(17.22),
              child: Column(
                children: [
                  SvgPicture.asset(
                    AssetUtils.editIcon,
                    width: cw(23.27),
                    height: ch(22.41),
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: ch(2),
                  ),

                  AppText(
                    txt: AppStrings.editMedicalHistory,
                    fontSize: AppFontSize.f10,
                    color: AppColor.white,
                    fontWeight: FontWeight.w400,
                    lineHeight: 12,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),


            // ** Edit icon ** //
            Positioned(
              top: ch(25.61),
              left: cw(23),
              child: SvgPicture.asset(
                AssetUtils.blueBackArrow,
                width: cw(23.27),
                height: ch(22.41),
                fit: BoxFit.contain,
                color: AppColor.white,
              ),
            ),

            //** Name **//
            Positioned(
              top: ch(65.19),
              left: cw(58),
              right: cw(58),
              child:  AppRichText(
                textAlign: TextAlign.center,
                childtxt: <TextSpan>[
                  TextSpan(
                    text: 'Medical'.toUpperCase(),
                    style: TextStyle(
                      fontSize: AppFontSize.f28,
                      fontWeight: FontWeight.w500,
                      color: AppColor.white,
                      fontFamily: "Poppins",
                    ),
                  ),
                  TextSpan(
                    text: "  History".toUpperCase(),
                    style: TextStyle(
                      fontSize: AppFontSize.f28,
                      fontWeight: FontWeight.w700,
                      color: AppColor.white,
                      fontFamily: "Poppins",
                    ),
                  ),
                ],
              ),
            ),



          ],
        ),
      ],
    );
  }
}






/// without filter
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// // Model for Medical Condition
// class MedicalCondition {
//   String condition;
//   MedicalCondition(this.condition);
// }
//
// // Provider for managing medical conditions
// class MedicalHistoryViewModel with ChangeNotifier {
//   List<MedicalCondition> _conditions = [];
//
//   List<MedicalCondition> get conditions => _conditions;
//
//   void addCondition(MedicalCondition condition) {
//     _conditions.add(condition);
//     notifyListeners();
//   }
// }
//
// // Main Screen with form fields and the "Add Medical Condition" button
// class MedicalScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Medical Details")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Text Fields for allergies and surgeries
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'All Types of Allergies',
//                 hintText: 'Enter your allergies here',
//               ),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Any Types of Surgeries',
//                 hintText: 'Enter your surgeries and operations',
//               ),
//             ),
//             SizedBox(height: 20),
//
//             // Displaying the list of medical conditions
//             Expanded(
//               child: Consumer<MedicalHistoryViewModel>(
//                 builder: (context, provider, child) {
//                   return ListView(
//                     children: provider.conditions
//                         .map((condition) => ListTile(
//                       title: Text(condition.condition),
//                     ))
//                         .toList(),
//                   );
//                 },
//               ),
//             ),
//
//             // Button to add a new medical condition
//             ElevatedButton(
//               onPressed: () => showModalBottomSheet(
//                 context: context,
//                 builder: (context) => AddMedicalConditionsBottomSheet(),
//               ),
//               child: Text('Add Medical Condition'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // Bottom Sheet to add medical conditions
// class AddMedicalConditionsBottomSheet extends StatefulWidget {
//   @override
//   _AddMedicalConditionsBottomSheetState createState() =>
//       _AddMedicalConditionsBottomSheetState();
// }
//
// class _AddMedicalConditionsBottomSheetState extends State<AddMedicalConditionsBottomSheet> {
//   String? selectedCondition;
//   final List<String> conditionsList = ['Acne', 'Diabetes', 'Heart Disease'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           // Dropdown to select a medical condition
//           DropdownButton<String>(
//             hint: Text('Select a Condition'),
//             value: selectedCondition,
//             onChanged: (value) {
//               setState(() {
//                 selectedCondition = value;
//               });
//             },
//             items: conditionsList.map((String condition) {
//               return DropdownMenuItem<String>(
//                 value: condition,
//                 child: Text(condition),
//               );
//             }).toList(),
//           ),
//           SizedBox(height: 20),
//
//           // Button to add the selected condition
//           ElevatedButton(
//             onPressed: () {
//               if (selectedCondition != null) {
//                 Provider.of<MedicalHistoryViewModel>(context, listen: false)
//                     .addCondition(MedicalCondition(selectedCondition!));
//                 Navigator.pop(context);
//               }
//             },
//             child: Text('Add'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
//



/// BottomSheet with scrollable items

// class AddMedicalConditionsBottomSheet extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<MedicalHistoryViewModel>(
//       builder: (context, provider, child) {
//         return Container(
//           height: ch(363),
//           decoration: BoxDecoration(
//             color: AppColor.white,
//             borderRadius: BorderRadius.only(
//               topRight: Radius.circular(cw(12)),
//               topLeft: Radius.circular(cw(12)),
//             ),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: ch(77),
//                 width: cw(375),
//                 decoration: BoxDecoration(
//                   color: AppColor.c082755,
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(cw(12)),
//                     topLeft: Radius.circular(cw(12)),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     SizedBox(height: ch(13)),
//                     Center(
//                       child: Container(
//                         width: cw(130),
//                         height: ch(5),
//                         decoration: BoxDecoration(
//                           color: AppColor.white,
//                           borderRadius: BorderRadius.circular(cw(6)),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: ch(12)),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: cw(15)),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           AppText(
//                             txt: AppStrings.addMedicalConditions,
//                             fontSize: AppFontSize.f22,
//                             color: AppColor.white,
//                             fontWeight: FontWeight.w500,
//                             lineHeight: 27.07,
//                             letterspacing: cw(-0.3),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pop(context);
//                             },
//                             child: SvgPicture.asset(
//                               AssetUtils.cancelBtnBottomsheet,
//                               width: cw(27),
//                               height: cw(27),
//                               fit: BoxFit.contain,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: ch(22
//               )),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: cw(28)),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // // Search bar
//                     // TextField(
//                     //   decoration: InputDecoration(
//                     //     labelText: 'Search Conditions',
//                     //     prefixIcon: Icon(Icons.search),
//                     //   ),
//                     //   onChanged: (value) {
//                     //     provider.setSearchQuery(value);
//                     //   },
//                     // ),
//                     // SizedBox(height: 10),
//                     // // Dropdown for selecting a condition
//                     // DropdownButton<String>(
//                     //   isExpanded: true,
//                     //   value: provider.selectedCondition,
//                     //   hint: AppText(txt: 'Select a Condition'),
//                     //   onChanged: (String? value) {
//                     //     if (value != null) {
//                     //       provider.addSelectedCondition(value); // Add to selected conditions
//                     //       provider.setSelectedCondition(value); // Update current selected condition
//                     //     }
//                     //   },
//                     //   items: provider.filteredConditions
//                     //       .map((condition) => DropdownMenuItem<String>(
//                     //     value: condition,
//                     //     child: Text(condition),
//                     //   ))
//                     //       .toList(),
//                     // ),
//                     // Widget to display dropdown with search functionality with Stateful builder
//                     // GestureDetector(
//                     //   onTap: () {
//                     //     provider.clearSearch(); // Clear search query before opening modal
//                     //     showModalBottomSheet(
//                     //       context: context,
//                     //       isScrollControlled: true,
//                     //       builder: (context) {
//                     //         return StatefulBuilder(
//                     //           builder: (BuildContext context, StateSetter setModalState) {
//                     //             return Padding(
//                     //               padding: EdgeInsets.only(
//                     //                 bottom: MediaQuery.of(context).viewInsets.bottom,
//                     //               ),
//                     //               child: Column(
//                     //                 mainAxisSize: MainAxisSize.min,
//                     //                 children: [
//                     //                   // Search Bar inside the Dropdown Modal
//                     //                   Padding(
//                     //                     padding: const EdgeInsets.all(8.0),
//                     //                     child: TextField(
//                     //                       decoration: InputDecoration(
//                     //                         labelText: 'Search Conditions',
//                     //                         prefixIcon: Icon(Icons.search),
//                     //                       ),
//                     //                       onChanged: (value) {
//                     //                         setModalState(() {
//                     //                           provider.setSearchQuery(value);
//                     //                         });
//                     //                       },
//                     //                     ),
//                     //                   ),
//                     //                   // List of Filtered Conditions
//                     //                   SizedBox(
//                     //                     height: 200, // Adjust height as needed
//                     //                     child: ListView.builder(
//                     //                       itemCount: provider.filteredConditions.length,
//                     //                       itemBuilder: (context, index) {
//                     //                         final condition = provider.filteredConditions[index];
//                     //                         return ListTile(
//                     //                           title: Text(condition),
//                     //                           onTap: () {
//                     //                             provider.addSelectedCondition(condition); // Add to selected conditions
//                     //                             provider.setSelectedCondition(condition); // Set as selected condition
//                     //                             Navigator.pop(context); // Close modal
//                     //                           },
//                     //                         );
//                     //                       },
//                     //                     ),
//                     //                   ),
//                     //                 ],
//                     //               ),
//                     //             );
//                     //           },
//                     //         );
//                     //       },
//                     //     );
//                     //   },
//                     //   child: Container(
//                     //     padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
//                     //     decoration: BoxDecoration(
//                     //       border: Border.all(color: Colors.grey),
//                     //       borderRadius: BorderRadius.circular(5),
//                     //     ),
//                     //     child: Row(
//                     //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //       children: [
//                     //         Text(provider.selectedCondition ?? 'Select a Condition'),
//                     //         Icon(Icons.arrow_drop_down),
//                     //       ],
//                     //     ),
//                     //   ),
//                     // ),
//
//                     // Widget to display dropdown with search functionality with Consumer
//                     GestureDetector(
//                       onTap: () {
//                         provider.clearSearch(); // Clear search query before opening modal
//                         showModalBottomSheet(
//                           context: context,
//                           isScrollControlled: true,
//                           builder: (context) {
//                             return Container(
//                               decoration: BoxDecoration(
//                                 color: AppColor.white,
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: Padding(
//                                 padding: EdgeInsets.only(
//                                   bottom: MediaQuery.of(context).viewInsets.bottom,
//                                 ),
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     // Search Bar inside the Dropdown Modal
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: TextField(
//                                         decoration: InputDecoration(
//                                           labelText: 'Search Conditions',
//                                           prefixIcon: Icon(Icons.search),
//                                         ),
//                                         onChanged: (value) {
//                                           provider.setSearchQuery(value);
//                                         },
//                                       ),
//                                     ),
//                                     // List of Filtered Conditions
//                                     SizedBox(
//                                       height: ch(200), // Adjust height as needed
//                                       child: Consumer<MedicalHistoryViewModel>(
//                                         builder: (context, provider, child) {
//                                           return ListView.builder(
//                                             itemCount: provider.filteredConditions.length,
//                                             itemBuilder: (context, index) {
//                                               final condition = provider.filteredConditions[index];
//                                               return ListTile(
//                                                 title: Text(condition),
//                                                 onTap: () {
//                                                   provider.addSelectedCondition(condition); // Add to selected conditions
//                                                   provider.setSelectedCondition(condition); // Set as selected condition
//                                                   Navigator.pop(context); // Close modal
//                                                 },
//                                               );
//                                             },
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         );
//                       },
//                       child: Container(
//                         padding: EdgeInsets.symmetric( horizontal: ch(17),vertical: ch(10)),
//                           decoration: BoxDecoration(
//                             color: AppColor.white,
//                             borderRadius: BorderRadius.circular(12),
//                             border: Border.all(
//                                 color: AppColor.black,
//                                 width: cw(0.2)
//                             ),
//                           ),
//                         child:
//
//                         // Row(
//                         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         //   children: [
//                         //     Text(provider.selectedCondition ?? 'Select a Condition'),
//                         //     Icon(Icons.arrow_drop_down),
//                         //   ],
//                         // ),
//
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//
//                               AppText(
//                                 txt: provider.selectedCondition ?? 'Search',
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 14,
//                                   color: AppColor.c677294
//                               ),
//                               SvgPicture.asset(
//                                 AssetUtils.searchIcon,
//                                 width: cw(19.43),
//                                 height: ch(19.43),
//                                 fit: BoxFit.cover,
//                                 color: AppColor.c082755,
//                               ),
//                             ],
//                           )
//                       ),
//                     ),
//
//
//                     SizedBox(height: ch(10)),
//                     // List of selected conditions
//                     SizedBox(
//                       height: ch(27), // Adjust height as needed
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         shrinkWrap: true,
//                         itemCount: provider.selectedConditions.length,
//                         itemBuilder: (context, index) {
//                           return
//                           //   ListTile(
//                           //   title: Text(provider.selectedConditions[index]),
//                           //   trailing: IconButton(
//                           //     icon: Icon(Icons.remove_circle, color: Colors.red),
//                           //     onPressed: () {
//                           //       provider.removeCondition(provider.selectedConditions[index]); // Remove selected condition
//                           //     },
//                           //   ),
//                           // );
//
//                           Container(
//                             margin: EdgeInsets.only(right: cw(5)),
//                             decoration: BoxDecoration(
//                               color: AppColor.c082755,
//                               borderRadius: BorderRadius.circular(cw(10))
//                             ),
//                             child: Center(
//                               child: Padding(
//                                 padding:  EdgeInsets.only(left: cw(15),right: cw(5),top: ch(5),bottom: ch(5)),
//                                 child: Row(
//                                   children: [
//                                     AppText(
//                                       txt: provider.selectedConditions[index],
//                                       fontSize: AppFontSize.f16,
//                                       color: AppColor.white,
//                                       fontWeight: FontWeight.w300,
//                                       lineHeight: 18.96,
//                                       letterspacing: cw(-0.3),
//                                     ),
//
//                                     SizedBox(
//                                       width: cw(13),
//                                     ),
//
//                                     GestureDetector(
//                                       onTap: () {
//                                         provider.removeCondition(provider.selectedConditions[index]); // Remove selected condition
//                                       },
//                                       child: SvgPicture.asset(
//                                         AssetUtils.cancelBtnBottomsheet,
//                                         width: cw(15),
//                                         height: cw(15),
//                                         fit: BoxFit.contain,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//
//                     if(provider.selectedConditions.isNotEmpty)...[
//
//                       SizedBox(
//                         height: ch(8),
//                       ),
//
//                       Divider(
//                         height: 0,
//                         thickness: ch(1),
//                         color: AppColor.cCAC4D0,
//                       ),
//                     ],
//
//                     SizedBox(
//                       height: ch(27),
//                     ),
//
//                     // Add button to confirm the selection
//                     Center(
//                       child: AppButton(
//                         onPressed: provider.selectedConditions.isNotEmpty
//                             ? () {
//                           provider.addAllConditions(); // Add all selected conditions
//                           provider.clearSearch(); // Clear search
//                           Navigator.pop(context); // Close the bottom sheet
//                         }
//                             : null,
//                         text: 'Add',
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }


