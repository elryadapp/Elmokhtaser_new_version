import 'package:elmokhtasar/core/network/local/local.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Constants {
  static double getHeight(context) => MediaQuery.of(context).size.height;
  static double getwidth(context) => MediaQuery.of(context).size.width;
  static String tokenValue = CacheHelper.getData(key: tokenKey) ?? '';
  static String userName = CacheHelper.getData(key: 'user_name') ?? '';
  static String lang = CacheHelper.getData(key: 'lang') ?? 'ar';
  static String tokenKey = "token";
  static String usernameKay = 'user_name';
  // static String userVerificationCode ="";
  // static String userphone="";
}
