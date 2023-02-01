import 'package:buildcondition/buildcondition.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:elmokhtasar/config/routes/app_routes.dart';
import 'package:elmokhtasar/core/app_cubit/app_cubit.dart';
import 'package:elmokhtasar/core/components/animation_for_screen.dart';
import 'package:elmokhtasar/core/components/app_btn.dart';
import 'package:elmokhtasar/core/components/app_text.dart';
import 'package:elmokhtasar/core/components/app_text_form.dart';
import 'package:elmokhtasar/core/components/custom_app_dia.dart';
import 'package:elmokhtasar/core/utils/app_resources.dart';
import 'package:elmokhtasar/core/utils/app_utilities.dart';
import 'package:elmokhtasar/features/auth/register/register_cubit/register_cubit.dart';
import 'package:elmokhtasar/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CompleteInfoScreen extends StatelessWidget {
  const CompleteInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        var appCubit = AppCubit.get(context);

        return BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {},
          builder: (context, state) {
            var registerCubit = RegisterCubit.get(context);

            return AppSlideAnimation(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 1.2.h, top: 2.h),
                  child: AppText(
                    LocaleKeys.Auth_education_level.tr(),
                  ),
                ),
                InkWell(
                  onTap: () {
                    AppUtil.appDialoge(
                            context: context,
                            title: LocaleKeys.Auth_select_education_level.tr(),
                            content: CustomAppDia(
                                contentList: registerCubit.educationLevelList))
                        .then((value) {
                      registerCubit.registerEducationalLevelController.text =
                          value ?? '';
                      registerCubit.getLevelList(value);
                    });
                  },
                  child: AppTextFormFeild(
                    filledColor: AppUi.colors.bgColor,
                    isFilled: true,
                    hint: LocaleKeys.Auth_select_education_level.tr(),
                    isEnable: false,
                    controller:
                        registerCubit.registerEducationalLevelController,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 1.2.h, top: 2.h),
                  child: AppText(
                    LocaleKeys.Auth_level.tr(),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (registerCubit.levelsList.isNotEmpty) {
                      AppUtil.appDialoge(
                              context: context,
                              title: registerCubit
                                          .registerEducationalLevelController
                                          .text ==
                                      LocaleKeys.Auth_University_stage.tr()
                                  ? LocaleKeys.Auth_University_stage.tr()
                                  : LocaleKeys.Auth_select_your_level.tr(),
                              content: CustomAppDia(
                                  contentList: registerCubit.levelsList))
                          .then((value) {
                        registerCubit.registerLevelController.text =
                            value ?? '';
                      });
                    } else {
                      AppUtil.flushbarNotification(
                          LocaleKeys.Auth_level_alert.tr());
                    }
                  },
                  child: AppTextFormFeild(
                    filledColor: AppUi.colors.bgColor,
                    isFilled: true,
                    hint: LocaleKeys.Auth_level.tr(),
                    isEnable: false,
                    controller: registerCubit.registerLevelController,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Column(
                  children: [
                    BlocBuilder<AppCubit, AppStates>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Theme(
                                data: ThemeData(
                                    unselectedWidgetColor:
                                        AppUi.colors.borderColor),
                                child: Checkbox(
                                    activeColor: AppUi.colors.mainColor,
                                    checkColor: AppUi.colors.whiteColor,
                                    value: appCubit.termsState,
                                    onChanged: (val) {
                                      appCubit.onChangeConditionsAgrree(val);
                                    })),
                            AppText(
                              LocaleKeys.Auth_Agree_to.tr(),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            InkWell(
                              child: AppText(
                                LocaleKeys.Auth_Terms_and_Condtions.tr(),
                                color: AppUi.colors.mainColor,
                                textDecoration: TextDecoration.underline,
                              ),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.termsAndConditions);
                              },
                            )
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    BuildCondition(
                        condition:
                            state.registerStatus == RegisterStatus.loading,
                        builder: (context) => AppUtil.appLoader(height: 14.h),
                        fallback: (context) {
                          return AppButton(
                              title: LocaleKeys.Auth_Create_Account.tr(),
                              onTap: () {
                                if (appCubit.termsState &&
                                    registerCubit
                                            .registerLevelController.text !=
                                        '' &&
                                    registerCubit
                                            .registerEducationalLevelController
                                            .text !=
                                        '') {
                                  registerCubit.authRegistration(context);
                                } else {
                                  if (registerCubit
                                          .registerEducationalLevelController
                                          .text ==
                                      '') {
                                    AppUtil.flushbarNotification(
                                        LocaleKeys.Auth_level_error.tr());
                                  } else if (registerCubit
                                          .registerLevelController.text ==
                                      '') {
                                    AppUtil.flushbarNotification(
                                        LocaleKeys.Auth_level_year.tr());
                                  } else {
                                    AppUtil.flushbarNotification(
                                        LocaleKeys.Auth_terms_error.tr());
                                  }
                                }
                              });
                        }),
                  ],
                ),
              ],
            ));
          },
        );
      },
    );
  }
}
