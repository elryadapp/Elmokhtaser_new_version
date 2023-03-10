
import 'package:dio/dio.dart';
import 'package:elmokhtasar/core/network/remote/end_points.dart';
import 'package:elmokhtasar/core/utils/app_constants.dart';




class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        followRedirects: false,
          validateStatus: (status) {
              return status! < 500;
            },
            
          baseUrl: ApiEndPoints.baseUrl,
          receiveDataWhenStatusError: true,
          headers: {
           'Content-Type': 'application/json',
            'lang': Constants.lang
          
          }),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? lang,
    String? token,
  }) async {
    dio!.options.headers = {
      
      'lang': lang ?? Constants.lang,
      'Authorization': token ?? '',

    };
    var res = await dio!.get(url, queryParameters: query);

    return res;
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    String? lang,
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang ?? Constants.lang,
      'Authorization': token ?? '',
    };
    var res = await dio!.delete(url, queryParameters: query);

    return res;
  }

  static Future<Response> postData({
    required String url,
    dynamic data,
    String? lang,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
       'lang': lang ?? Constants.lang,
      'Authorization': token ?? '',
    };
    try{
      var res = await dio!.post(
      url,
      data: data,
      queryParameters: query,
    );

    return res;
    }
  catch(e){
      rethrow;
    }
  }

}


