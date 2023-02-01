import 'package:elmokhtasar/config/routes/app_routes.dart';
import 'package:elmokhtasar/core/components/animation_for_screen.dart';
import 'package:elmokhtasar/core/components/app_btn.dart';
import 'package:elmokhtasar/core/components/app_text.dart';
import 'package:elmokhtasar/core/utils/app_resources.dart';
import 'package:elmokhtasar/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppUi.assets.onBoarding),
            SizedBox(
              height: 7.h,
            ),
            AppSlideAnimation(
              verticalOffset: 0,
              horizontalOffset: 80,
              child: AppText(
                LocaleKeys.Auth_elmokhtaser.tr(),
                fontWeight: FontWeight.bold,
                color: AppUi.colors.titleColor,
                fontSize: 16.sp,
              ),
            ),
            AppSlideAnimation(
              verticalOffset: 0,
              horizontalOffset: -80,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                child: AppText(
                  LocaleKeys.Auth_hint.tr(),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 4.w),
              child: AppButton(
                title: LocaleKeys.Auth_start_now.tr(),
                onTap: () =>
                    Navigator.pushReplacementNamed(context, Routes.login),
              ),
            )
          ],
        ),
      ),
    );
  }
}
