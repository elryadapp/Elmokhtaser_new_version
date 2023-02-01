import 'package:buildcondition/buildcondition.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:elmokhtasar/core/components/app_btn.dart';
import 'package:elmokhtasar/core/components/app_text.dart';
import 'package:elmokhtasar/core/components/app_text_form.dart';
import 'package:elmokhtasar/core/utils/app_resources.dart';
import 'package:elmokhtasar/core/utils/app_utilities.dart';
import 'package:elmokhtasar/features/auth/register/register_cubit/register_cubit.dart';
import 'package:elmokhtasar/features/auth/verification/verification_cubit/verification_cubit.dart';
import 'package:elmokhtasar/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8.h,
        horizontal: 5.w,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
              AppText(
                LocaleKeys.Auth_Confirm_Account.tr(),
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 6.h,
              bottom: 1.h,
            ),
            child: SizedBox(
              width: 60.w,
              child: AppText(
                LocaleKeys.Auth_confirm_alert.tr(),
                maxLines: 2,
                height: 1.9,
                fontSize: 14.sp,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                ...VerificationCubit.get(context)
                    .codeControllers
                    .asMap()
                    .entries
                    .map(
                  (e) {
                    e.value.text =
                        RegisterCubit.get(context).verificationCode![e.key];
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: AppTextFormFeild(
                          controller: e.value,
                          borderColor: AppUi.colors.mainColor,
                          isFilled: false,
                          textInputType: TextInputType.number,
                          radius: 5.0,
                          onChange: (value) {
                            if (value.length == 1 && e.key != 4) {
                              FocusScope.of(context).nextFocus();
                            } else {
                              FocusScope.of(context).unfocus();
                            }
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          BlocBuilder<VerificationCubit, VerificationState>(
            builder: (context, state) {
              return BuildCondition(
                  condition:
                      state.verificationStatus == VerificationStatus.loading,
                  builder: (context) => AppUtil.appLoader(),
                  fallback: (context) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.5.h),
                      child: AppButton(
                        title: LocaleKeys.Auth_confirm.tr(),
                        onTap: () {
                          VerificationCubit.get(context).authVerify(context);
                        },
                      ),
                    );
                  });
            },
          ),
          AppText(
            LocaleKeys.Auth_reSend.tr(),
            fontSize: 14.sp,
            color: AppUi.colors.mainColor,
          )
        ],
      ),
    ));
  }
}
