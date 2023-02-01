import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:elmokhtasar/config/routes/app_routes.dart';
import 'package:elmokhtasar/core/app_cubit/app_cubit.dart';
import 'package:elmokhtasar/core/components/animation_for_screen.dart';
import 'package:elmokhtasar/core/components/app_btn.dart';
import 'package:elmokhtasar/core/components/app_text.dart';
import 'package:elmokhtasar/core/components/app_text_form.dart';
import 'package:elmokhtasar/core/utils/app_resources.dart';
import 'package:elmokhtasar/core/utils/app_utilities.dart';
import 'package:elmokhtasar/core/utils/icons_borken.dart';
import 'package:elmokhtasar/core/validators/validations.dart';
import 'package:elmokhtasar/features/auth/login/login_cubit/login_cubit.dart';
import 'package:elmokhtasar/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var appcubit = AppCubit.get(context);
        return BlocBuilder<LoginCubit, LoginState>(
          builder: (_, state) {
            var loginCubit = LoginCubit.get(context);
            return Scaffold(
              backgroundColor: AppUi.colors.whiteColor,
              body: Form(
                key: appcubit.loginFormKey,
                child: AppSlideAnimation(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 5.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            LocaleKeys.Auth_Login.tr(),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 1.5.h, top: 5.h),
                            child: AppText(
                              LocaleKeys.Auth_E_mail.tr(),
                            ),
                          ),
                          AppTextFormFeild(
                            validator: (email) =>
                                AppValidations.emailValidation(email!),
                            hint: LocaleKeys.Auth_E_mail.tr(),
                            textInputType: TextInputType.emailAddress,
                            controller: loginCubit.loginEmailController,
                            prefixIcon: Icon(
                              IconBroken.Message,
                              size: 6.w,
                              color: AppUi.colors.subTitleColor.withOpacity(.5),
                            ),
                            filledColor: AppUi.colors.bgColor,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.5.h),
                            child: AppText(
                              LocaleKeys.Auth_Password.tr(),
                            ),
                          ),
                          AppTextFormFeild(
                            hint: LocaleKeys.Auth_Password.tr(),
                            controller: loginCubit.loginPasswordController,
                            prefixIcon: Icon(
                              IconBroken.Lock,
                              size: 6.w,
                              color: AppUi.colors.subTitleColor.withOpacity(.5),
                            ),
                            validation: true,
                            filledColor: AppUi.colors.bgColor,
                            validator: (password) =>
                                AppValidations.password(password!),
                            isFilled: true,
                            suffixIcon: InkWell(
                              onTap: () {
                                appcubit.loginChangeVisibility();
                              },
                              child: Icon(appcubit.loginVisibilityIcon),
                            ),
                            obscureText: appcubit.loginVisibality,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 3.h),
                            child: Row(
                              children: [
                                AppText(
                                  LocaleKeys.Auth_Forget_Password.tr(),
                                  color: AppUi.colors.mainColor,
                                ),
                              ],
                            ),
                          ),
                          ConditionalBuilder(
                              condition:
                                  state.loginStatus == LoginStatus.loading,
                              builder: (context) =>
                                  AppUtil.appLoader(height: 14.h),
                              fallback: (context) {
                                return AppButton(
                                  title: LocaleKeys.Auth_Login.tr(),
                                  onTap: () {
                                    if (appcubit.loginFormKey.currentState!
                                        .validate()) {
                                      loginCubit.login(context);
                                    } else {
                                      return;
                                      // AppUtil.flushbarNotification(
                                      //     LocaleKeys.Auth_info_alert.tr());
                                    }
                                  },
                                );
                              }),
                          SizedBox(
                            height: 2.h,
                          ),
                          AppButton(
                            title: LocaleKeys.Auth_Create_New_Account.tr(),
                            color: AppUi.colors.btnBgColor,
                            titleColor: AppUi.colors.titleColor,
                            onTap: () =>
                                Navigator.pushNamed(context, Routes.register),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 3.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      color: AppUi.colors.subTitleColor,
                                      height: 1.2,
                                      width: 7.w),
                                  AppText(
                                    'or'.tr(),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Container(
                                      color: AppUi.colors.subTitleColor,
                                      height: 1.2,
                                      width: 7.w),
                                ],
                              )),
                          Center(
                            child: InkWell(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, Routes.layout);
                              },
                              child: AppText(LocaleKeys.visitor_login.tr(),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  textDecoration: TextDecoration.underline,
                                  decorationColor: AppUi.colors.mainColor,
                                  color: AppUi.colors.mainColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
