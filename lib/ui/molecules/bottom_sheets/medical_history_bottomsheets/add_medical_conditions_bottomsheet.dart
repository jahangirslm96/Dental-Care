import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_strings.dart';
import '../../../../utils/asset_utils.dart';
import '../../../../utils/color_utils.dart';
import '../../../../utils/font_size.dart';
import '../../../../utils/helpers/app_layout_helpers.dart';
import '../../../../view_model/dashboard/medical_history/medical_history_view_model.dart';
import '../../app_text/app_text.dart';
import '../../buttons/app_primary_button.dart';

class AddMedicalConditionsBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MedicalHistoryViewModel>(
      builder: (context, provider, child) {
        return Container(
          height: ch(363),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(cw(12)),
              topLeft: Radius.circular(cw(12)),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: ch(77),
                width: cw(375),
                decoration: BoxDecoration(
                  color: AppColor.c082755,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(cw(12)),
                    topLeft: Radius.circular(cw(12)),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: ch(13)),
                    Center(
                      child: Container(
                        width: cw(130),
                        height: ch(5),
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(cw(6)),
                        ),
                      ),
                    ),
                    SizedBox(height: ch(12)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: cw(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            txt: AppStrings.addMedicalConditions,
                            fontSize: AppFontSize.f22,
                            color: AppColor.white,
                            fontWeight: FontWeight.w500,
                            lineHeight: 27.07,
                            letterspacing: cw(-0.3),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset(
                              AssetUtils.cancelBtnBottomsheet,
                              width: cw(27),
                              height: cw(27),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: ch(22)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: cw(28)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        provider.clearSearch();
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return Container(
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).viewInsets.bottom,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          labelText: 'Search Conditions',
                                          prefixIcon: Icon(Icons.search),
                                        ),
                                        onChanged: (value) {
                                          provider.setSearchQuery(value);
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: ch(200),
                                      child: Consumer<MedicalHistoryViewModel>(
                                        builder: (context, provider, child) {
                                          return ListView.builder(
                                            itemCount: provider.filteredConditions.length,
                                            itemBuilder: (context, index) {
                                              final condition = provider.filteredConditions[index];
                                              return ListTile(
                                                title: Text(condition),
                                                onTap: () {
                                                  provider.addSelectedCondition(condition);
                                                  provider.setSelectedCondition(condition);
                                                  Navigator.pop(context);
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: ch(17), vertical: ch(10)),
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColor.black, width: cw(0.2)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              txt: provider.selectedCondition ?? 'Search',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColor.c677294,
                            ),
                            SvgPicture.asset(
                              AssetUtils.searchIcon,
                              width: cw(19.43),
                              height: ch(19.43),
                              fit: BoxFit.cover,
                              color: AppColor.c082755,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: ch(10)),
                    Wrap(
                      spacing: cw(5),
                      runSpacing: ch(5),
                      children: provider.selectedConditions.map((condition) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: cw(10), vertical: ch(5)),
                          decoration: BoxDecoration(
                            color: AppColor.c082755,
                            borderRadius: BorderRadius.circular(cw(10)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AppText(
                                txt: condition,
                                fontSize: AppFontSize.f16,
                                color: AppColor.white,
                                fontWeight: FontWeight.w300,
                              ),
                              SizedBox(width: cw(8)),
                              GestureDetector(
                                onTap: () {
                                  provider.removeCondition(condition);
                                },
                                child: SvgPicture.asset(
                                  AssetUtils.cancelBtnBottomsheet,
                                  width: cw(15),
                                  height: cw(15),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    if (provider.selectedConditions.isNotEmpty) ...[
                      SizedBox(height: ch(8)),
                      Divider(
                        height: 0,
                        thickness: ch(1),
                        color: AppColor.cCAC4D0,
                      ),
                    ],
                    SizedBox(height: ch(27)),
                    Center(
                      child: AppButton(
                        onPressed: provider.selectedConditions.isNotEmpty
                            ? () {
                          provider.addAllConditions();
                          provider.clearSearch();
                          Navigator.pop(context);
                        }
                            : null,
                        text: 'Add',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
