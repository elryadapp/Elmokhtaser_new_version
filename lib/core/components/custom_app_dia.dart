import 'package:elmokhtasar/core/components/app_btn.dart';
import 'package:elmokhtasar/core/components/app_text.dart';
import 'package:elmokhtasar/core/utils/app_resources.dart';
import 'package:elmokhtasar/core/utils/app_utilities.dart';
import 'package:elmokhtasar/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomAppDia extends StatelessWidget {
  final List<String> contentList;
  final String? errorMsg;
  final Function()? onConfirm;

  const CustomAppDia(
      {Key? key, required this.contentList, this.onConfirm, this.errorMsg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String selectedVal = '';
    return StatefulBuilder(builder: (context, changeState) {
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...contentList.map((e) => RadioListTile(
                value: e,
                title: AppText(
                  e,
                ),
                groupValue: selectedVal,
                onChanged: (val) {
                  changeState(() {
                    selectedVal = val.toString();
                  });
                })),
            Padding(
              padding: EdgeInsets.all(1.2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppButton(
                    height: 4.h,
                    width: 20.w,
                    color: AppUi.colors.buttonColor,
                    title: LocaleKeys.cancel.tr(),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  AppButton(
                    height: 4.h,
                    width: 20.w,
                    title: LocaleKeys.Auth_confirm.tr(),
                    onTap: () {
                      if (selectedVal != '') {
                        Navigator.pop(context, selectedVal);
                      } else {
                        AppUtil.flushbarNotification(errorMsg ??
                            'please_select_your_education_level_first'.tr());
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
