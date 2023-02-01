import 'package:easy_localization/easy_localization.dart';
import 'package:elmokhtasar/core/app_cubit/app_cubit.dart';
import 'package:elmokhtasar/core/components/app_btn.dart';
import 'package:elmokhtasar/core/components/app_text.dart';
import 'package:elmokhtasar/core/components/app_text_form.dart';
import 'package:elmokhtasar/core/utils/app_resources.dart';
import 'package:elmokhtasar/core/utils/icons_borken.dart';
import 'package:elmokhtasar/core/validators/validations.dart';
import 'package:elmokhtasar/features/auth/register/register_cubit/register_cubit.dart';
import 'package:elmokhtasar/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class BasicInfoScreen extends StatelessWidget {
  const BasicInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var appCubit = AppCubit.get(context);
        return BlocBuilder<RegisterCubit, RegisterState>(
          builder: (_, state) {
            var registerCubit = RegisterCubit.get(context);
            return Form(
              key: registerCubit.registerBasicInfoFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 2.h, bottom: 1.2.h),
                    child: AppText(
                      LocaleKeys.Auth_Name.tr(),
                    ),
                  ),
                  AppTextFormFeild(
                    filledColor: AppUi.colors.bgColor,
                    controller: registerCubit.registerNameController,
                    isFilled: true,
                    hint: LocaleKeys.Auth_user_name.tr(),
                    validation: true,
                    validator: (name) => AppValidations.nameValidation(name!),
                    prefixIcon: Icon(
                      IconBroken.User,
                      color: AppUi.colors.subTitleColor.withOpacity(.5),
                      size: 6.w,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 1.2.h, top: 2.h),
                    child: AppText(
                      LocaleKeys.Auth_E_mail.tr(),
                    ),
                  ),
                  AppTextFormFeild(
                    filledColor: AppUi.colors.bgColor,
                    isFilled: true,
                    hint: 'example@gmail.com',
                    textInputType: TextInputType.emailAddress,
                    controller: registerCubit.registerEmailController,
                    validator: (email) =>
                        AppValidations.emailValidation(email!),
                    prefixIcon: Icon(
                      IconBroken.Message,
                      size: 6.w,
                      color: AppUi.colors.subTitleColor.withOpacity(.5),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 1.2.h, top: 2.h),
                    child: AppText(
                      LocaleKeys.Auth_Phone.tr(),
                    ),
                  ),
                  AppTextFormFeild(
                      filledColor: AppUi.colors.bgColor,
                      isFilled: true,
                      hint: LocaleKeys.Auth_Phone.tr(),
                      maxLength: 9,
                      validator: (phone) =>
                          AppValidations.phoneValidation(phone!),
                      controller: registerCubit.registerPhoneNumberController,
                      textInputType: TextInputType.phone,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              IconBroken.Call,
                              size: 6.w,
                              color: AppUi.colors.subTitleColor.withOpacity(.5),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            const AppText('+966'),
                          ],
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: 1.2.h, top: 2.h),
                    child: AppText(
                      LocaleKeys.Auth_Password.tr(),
                    ),
                  ),
                  AppTextFormFeild(
                    filledColor: AppUi.colors.bgColor,
                    isFilled: true,
                    hint: LocaleKeys.Auth_Password.tr(),
                    validator: (password) => AppValidations.password(password!),
                    suffixIcon: InkWell(
                      onTap: () {
                        appCubit.registerChangeVisibilityp();
                      },
                      child: Icon(appCubit.registerVisibilityIconp),
                    ),
                    obscureText: appCubit.registerVisibilityp,
                    controller: registerCubit.registerPasswordController,
                    prefixIcon: Icon(
                      IconBroken.Lock,
                      size: 6.w,
                      color: AppUi.colors.subTitleColor.withOpacity(.5),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 1.2.h, top: 2.h),
                    child: AppText(
                      LocaleKeys.Auth_password_confiremation.tr(),
                    ),
                  ),
                  AppTextFormFeild(
                    filledColor: AppUi.colors.bgColor,
                    isFilled: true,
                    validator: (confirmpassword) =>
                        AppValidations.confirmPasswordvalidation(
                            registerCubit.registerPasswordController.text,
                            confirmpassword!),
                    suffixIcon: InkWell(
                      onTap: () {
                        appCubit.registerChangeVisibility();
                      },
                      child: Icon(appCubit.registerVisibilityIcon),
                    ),
                    obscureText: appCubit.registerVisibility,
                    hint: LocaleKeys.Auth_password_confiremation.tr(),
                    controller: registerCubit.registerPasswordConfirmController,
                    prefixIcon: Icon(
                      IconBroken.Lock,
                      size: 6.w,
                      color: AppUi.colors.subTitleColor.withOpacity(.5),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  AppButton(
                    title: LocaleKeys.Auth_Next.tr(),
                    onTap: () {
                      if (registerCubit.registerBasicInfoFormKey.currentState!
                          .validate()) {
                        appCubit.changeIndex(1, context);
                      } else {
                        return;
                      }
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
