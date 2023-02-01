import 'package:elmokhtasar/config/routes/app_routes.dart';
import 'package:elmokhtasar/features/auth/login/login_screen.dart';
import 'package:elmokhtasar/features/auth/register/register_screen/register_screen.dart';
import 'package:elmokhtasar/features/auth/terms_and_conditions/terms_and_conditions.dart';
import 'package:elmokhtasar/features/auth/verification/verification_screen.dart';
import 'package:elmokhtasar/features/intro/onboarding_screens/onboarding_screen.dart';
import 'package:elmokhtasar/features/intro/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class RouterGenarator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.onBoarding:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case Routes.verification:
        return MaterialPageRoute(
            builder: (context) => const VerificationScreen());
      case Routes.termsAndConditions:
        return MaterialPageRoute(
            builder: (context) => const TermsAndConditions());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) => Scaffold(body: Container()));
  }
}
