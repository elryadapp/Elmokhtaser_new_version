import 'package:easy_localization/easy_localization.dart';
import 'package:elmokhtasar/app.dart';
import 'package:elmokhtasar/core/network/local/local.dart';
import 'package:elmokhtasar/core/network/remote/dio_helper.dart';
import 'package:elmokhtasar/core/utils/app_constants.dart';
import 'package:elmokhtasar/firebase_options.dart';
import 'package:elmokhtasar/generated/codegen_loader.g.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await CacheHelper.init();
  await DioHelper.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations',
      startLocale: Locale(Constants.lang),
      saveLocale: true,
      useOnlyLangCode: true,
      assetLoader: const CodegenLoader(),
      child: const ElmokhtasarApp()));
}
