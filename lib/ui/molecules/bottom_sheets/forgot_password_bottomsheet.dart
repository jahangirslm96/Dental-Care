
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/asset_utils.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/font_size.dart';
import '../../../utils/helpers/app_layout_helpers.dart';
import '../app_text/app_text.dart';
import '../buttons/app_primary_button.dart';
import '../textfields/app_textfield.dart';



Widget forgotPasswordBottomSheet({
  required BuildContext context,
  required double sheetHeight,
  List? data,
  required Function onPressHandler,
  required VoidCallback closeBtnHandler,
  String? title,
  String? descriptionText,
  bool isSearchableModel = false,
  Function? searchInputHandler,
  String? screenViewModelOrDropdownName,
  String? searchInputLabel,
  required textfieldController,
}) {
  // final delegate = S.of(context);

  return Container(
    height: sheetHeight,
    width: 100.w,
    color: Colors.white,
    child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: cw(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: ch(9),
          ),
      
          // *** Tab Icon *** //
          Center(
            child: Container(
              width: cw(130),
              height: ch(5),
              decoration: BoxDecoration(
                color: AppColor.cC4C4C4,
                borderRadius: BorderRadius.circular(
                  cw(6),
                ),
              ),
            ),
          ),
      
          SizedBox(
            height: ch(50),
          ),
      
          // *** Title and Close Button *** //
          // Padding(
          //   padding: EdgeInsets.only(left: cw(22), right: cw(24)),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       AppText(
          //         // txt: title ?? delegate.selectPeriod,
          //         txt: title ?? 'select period',
          //         color: AppColor.c383838,
          //         fontSize: AppFontSize.f16,
          //         fontWeight: FontWeight.w700,
          //       ),
          //       GestureDetector(
          //         onTap: () {
          //           closeBtnHandler();
          //           if (isSearchableModel) {
          //             searchInputHandler!("");
          //           }
          //         },
          //         child: Container(
          //           width: cw(30),
          //           height: cw(30),
          //           color: AppColor.transparent,
          //           child: UnconstrainedBox(
          //             child: SvgPicture.asset(
          //               AssetUtils.eyeHidden,
          //               width: cw(18),
          //               height: cw(18),
          //               fit: BoxFit.contain,
          //             ),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
      
      
          AppText(
                    txt: title ?? 'title',
                    color: AppColor.c082755,
                    fontSize: AppFontSize.f24,
                    fontWeight: FontWeight.w500,
            lineHeight: 28.44,
            letterspacing: cw(-0.3),
                  ),
          SizedBox(
            height: ch(12),
          ),


          AppText(
            txt: descriptionText ?? 'descriptionText',
            color: AppColor.c677294,
            fontSize: AppFontSize.f13,
            fontWeight: FontWeight.w400,
            lineHeight: 19.5,
          ),

          SizedBox(
            height: ch(35-19.5),
          ),

          AppTextField(
            controller: textfieldController,
            hintText: 'Email',
          ),

          SizedBox(height: ch(32)),

          Center(
            child: AppButton(
              text: 'Submit',
              onPressed: () {
              },
            ),
          ),
      
          if (isSearchableModel) ...[
            // *** Search TextField *** //
            Padding(
              padding: EdgeInsets.symmetric(horizontal: cw(24)),
              child: TextFormField(
                // controller: TextEditingController(),
      
                style: TextStyle(
                  color: AppColor.c101010,
                  fontSize: AppFontSize.f14,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Nunito",
                ),
                decoration: InputDecoration(
                    counterText: "",
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColor.cDDDDDD),
                      borderRadius: BorderRadius.circular(cw(16)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColor.cDDDDDD),
                      borderRadius: BorderRadius.circular(cw(16)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColor.c101010),
                      borderRadius: BorderRadius.circular(cw(16)),
                    ),
                    hintText: searchInputLabel,
                    hintStyle: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: AppFontSize.f14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.cB5B5B5,
                    ),
                    prefixIconConstraints: const BoxConstraints(),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: cw(16),
                      vertical: ch(16),
                    ),
                    // prefixIcon: prefixIcon,
                    suffixIcon: UnconstrainedBox(
                      child: Padding(
                        padding: EdgeInsets.only(right: cw(16)),
                        child: SvgPicture.asset(
                          AssetUtils.eyeHidden,
                          width: cw(20),
                          height: cw(20),
                          color: AppColor.c101010,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    suffixIconConstraints: const BoxConstraints()),
                // if want to validate on text change use below onChanged handler
                onChanged: searchInputHandler == null
                    ? (val) {}
                    : (val) {
                  searchInputHandler(val);
                },
              ),
            ),
            SizedBox(
              height: ch(20),
            ),
          ],
      
          // *** Periods List *** //
          // Consumer(builder: (context, ref, _) {
          //   var _viewModelProvider;
          //   var _dropdownList = data;
          //
          //   if (isSearchableModel) {
          //      if (screenViewModelOrDropdownName ==
          //         "businessLocation") {
          //       _viewModelProvider = ref.watch(leadsGenerationMainModelProvider);
          //       _dropdownList =
          //           _viewModelProvider.filteredBusinessLocationList;
          //     }
          //   }
          //   return Expanded(
          //     child: ListView.builder(
          //         itemCount: _dropdownList.length,
          //         shrinkWrap: true,
          //         padding: EdgeInsets.zero,
          //         itemBuilder: ((context, index) {
          //           final item = _dropdownList[index];
          //           final isLastItem = (_dropdownList.length - 1) == index;
          //
          //           return GestureDetector(
          //             behavior: HitTestBehavior.translucent,
          //             onTap: () => onPressHandler(item),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               mainAxisAlignment: MainAxisAlignment.start,
          //               children: [
          //                 if (index == 0) ...[
          //                   Container(
          //                     height: ch(1),
          //                     color: AppColor.cDDDDDD,
          //                   )
          //                 ],
          //
          //                 SizedBox(
          //                   height: ch(16),
          //                 ),
          //
          //                 // *** title *** //
          //                 Padding(
          //                   padding: EdgeInsets.symmetric(horizontal: cw(24)),
          //                   child: AppText(
          //                     txt: item["title"],
          //                     color: AppColor.c101010,
          //                     fontWeight: FontWeight.w500,
          //                     fontSize: AppFontSize.f14,
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   height: ch(16),
          //                 ),
          //
          //                 if (!isLastItem) ...[
          //                   Container(
          //                     height: ch(1),
          //                     color: AppColor.cDDDDDD,
          //                   )
          //                 ],
          //               ],
          //             ),
          //           );
          //         })),
          //   );
          // })
        ],
      ),
    ),
  );
}
