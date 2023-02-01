import 'package:easy_localization/easy_localization.dart';
import 'package:elmokhtasar/generated/locale_keys.g.dart';

class AppValidations {
  static bool emailRegExp(email) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  static emailValidation(String email) => email.isEmpty
      ? LocaleKeys.Auth_PleaseEnterEmail.tr()
      : !emailRegExp(email)
          ? LocaleKeys.Auth_PleaseEnterValidEmail.tr()
          : null;
  static nameValidation(String name) => name.isEmpty
      ? LocaleKeys.Auth_FullName.tr()
      : !RegExp(r"^[a-zA-Z0-9-\u0621-\u064A0]").hasMatch(name)
          ? LocaleKeys.Auth_PleaseValidName.tr()
          : null;

  static password(String password) => password.isEmpty
      ? LocaleKeys.Auth_PleaseEnterPassword.tr()
      : password.length < 8
          ? LocaleKeys.Auth_pleaseEnterValidPassword.tr()
          : null;
  static confirmPasswordvalidation(String password, String confirmPassword) =>
      confirmPassword.isEmpty
          ? LocaleKeys.Auth_pleaseEnterConfirmPassword.tr()
          : password != confirmPassword
              ? LocaleKeys.Auth_password_error_msg.tr()
              : null;
  static phoneValidation(String phone) {
    // String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    // RegExp regExp = RegExp(patttern);
    if (phone.isEmpty) {
      return LocaleKeys.Auth_PleaseEnterPhone.tr();
    }
  }
}
