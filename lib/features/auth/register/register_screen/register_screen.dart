import 'package:easy_localization/easy_localization.dart';
import 'package:elmokhtasar/core/app_cubit/app_cubit.dart';
import 'package:elmokhtasar/core/components/animation_for_screen.dart';
import 'package:elmokhtasar/core/components/app_text.dart';
import 'package:elmokhtasar/core/utils/app_constants.dart';
import 'package:elmokhtasar/core/utils/app_resources.dart';
import 'package:elmokhtasar/features/auth/register/register_screen/basic_info.dart';
import 'package:elmokhtasar/features/auth/register/register_screen/complete_info.dart';
import 'package:elmokhtasar/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: AppUi.colors.whiteColor,
          body: AppSlideAnimation(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8.h,
                  horizontal: 5.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              if (cubit.currentInfoIndex == 0) {
                                Navigator.pop(context);
                              } else {
                                cubit.changeIndex(0, context);
                              }
                            },
                            icon: const Icon(Icons.arrow_back)),
                        AppText(
                          LocaleKeys.Auth_Create_Account.tr(),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: Stack(
                        alignment: AlignmentDirectional.centerStart,
                        children: [
                          Container(
                            width: Constants.getwidth(context),
                            height: .5.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppUi.colors.borderColor),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 600),
                            width: cubit.animatedWidth ??
                                Constants.getwidth(context) / 2 - 5.w,
                            height: .5.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppUi.colors.mainColor),
                          )
                        ],
                      ),
                    ),
                    cubit.currentInfoIndex == 0
                        ? BasicInfoScreen()
                        : const CompleteInfoScreen()
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
