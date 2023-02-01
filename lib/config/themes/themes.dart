import 'package:elmokhtasar/core/utils/app_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemes {
  static Map<int, Color> color = {
    50: const Color(0xff29B4E3),
    100: const Color(0xff29B4E3),
    200: const Color(0xff29B4E3),
    300: const Color(0xff29B4E3),
    400: const Color(0xff29B4E3),
    500: const Color(0xff29B4E3),
    600: const Color(0xff29B4E3),
    700: const Color(0xff29B4E3),
    800: const Color(0xff29B4E3),
    900: const Color(0xff29B4E3),
  };

  static ThemeData get lightTheme => ThemeData(
        primarySwatch: MaterialColor(0xff29B4E3, color),
        scaffoldBackgroundColor: AppUi.colors.bgColor,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          elevation: 20,
          selectedItemColor: AppUi.colors.mainColor,
        ),
        appBarTheme: AppBarTheme(
            titleSpacing: 20,
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: AppUi.colors.whiteColor,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: AppUi.colors.mainColor,
                statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.dark),
            backgroundColor: AppUi.colors.mainColor,
            elevation: 0,
            iconTheme: IconThemeData(color: AppUi.colors.whiteColor)),
      );
}
