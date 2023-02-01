import 'package:buildcondition/buildcondition.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:elmokhtasar/core/components/animation_for_screen.dart';
import 'package:elmokhtasar/core/components/app_app_bar.dart';
import 'package:elmokhtasar/core/components/app_text.dart';
import 'package:elmokhtasar/core/utils/app_resources.dart';
import 'package:elmokhtasar/core/utils/app_utilities.dart';
import 'package:elmokhtasar/features/auth/terms_and_conditions/cubit/terms_cubit.dart';
import 'package:elmokhtasar/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:sizer/sizer.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  void initState() {
    TermsCubit.get(context).getTermesData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var termsCubit = TermsCubit.get(context);
    return BlocConsumer<TermsCubit, TermsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: ElmoktaserAppbar(
            context,
            titleText: LocaleKeys.Auth_Terms_and_Condtions.tr(),
          ),
          body: BuildCondition(
              condition: state.termsStatus == TermsStatus.loading,
              builder: (context) => AppUtil.appLoader(),
              fallback: (context) {
                return AppSlideAnimation(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 3.h, horizontal: 4.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...termsCubit.termesList.map((e) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    e.title ?? '',
                                    color: AppUi.colors.mainColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  HtmlWidget(e.content!)
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
