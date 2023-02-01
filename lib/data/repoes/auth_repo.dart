import 'package:elmokhtasar/core/network/remote/dio_helper.dart';
import 'package:elmokhtasar/core/network/remote/end_points.dart';
import 'package:elmokhtasar/core/utils/app_constants.dart';

class AuthRepositories {
  static Future<Map<String, dynamic>> authRegister(
      {Map<String, dynamic>? query}) async {
    var res = await DioHelper.postData(
      url: ApiEndPoints.register,
      data: query,
    );
    return res.data;
  }

  //===================login=======================
  static Future<Map<String, dynamic>> authLogin(
      {Map<String, dynamic>? query}) async {
    var res = await DioHelper.postData(
      url: ApiEndPoints.login,
      data: query,
    );
    return res.data;
  }

  //===============verification=====================
  static Future<Map<String, dynamic>> authVerification({
    Map<String, dynamic>? query,
  }) async {
    var res = await DioHelper.postData(
        url: ApiEndPoints.verify,
        data: query,
        token: 'Bearer ${Constants.tokenValue}');
    return res.data;
  }

  //termsandconditions

  static Future<Map<String, dynamic>> getTermesData() async {
    var res = await DioHelper.getData(
      url: ApiEndPoints.terms,
    );
    return res.data;
  }
}
