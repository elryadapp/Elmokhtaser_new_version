// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:easy_localization/easy_localization.dart';
import 'package:elmokhtasar/config/routes/app_routes.dart';
import 'package:elmokhtasar/config/routes/route_generator.dart';
import 'package:elmokhtasar/config/themes/themes.dart';
import 'package:elmokhtasar/core/validators/bloc_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class ElmokhtasarApp extends StatelessWidget {
  const ElmokhtasarApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext, Orientation, DeviceType) {
        return MultiBlocProvider(
          providers: BlocProviders.providers(context),
          child: MaterialApp(
            onGenerateRoute: RouterGenarator.generateRoute,
            initialRoute: Routes.splash,
            debugShowCheckedModeBanner: false,
            theme: AppThemes.lightTheme,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          ),
        );
      },
    );
  }
}
