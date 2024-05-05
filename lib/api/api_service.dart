import 'dart:developer';

import 'app_config.dart';
import 'package:dio/dio.dart';

class ApiService {
  static const String urlEncodedType = 'multipart/form-data';
  static const String jsonType = 'application/json';
  static const int unAuthorizedCode = 401;
  static const int internalServerErrorCode = 500;
  static const String authorizationParameter = 'Authorization';
  static const String bearer = 'Bearer';

  static Future<Response<T>?> getApi<T>(
    String path, {
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
  }) async {
    log(path);
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.getAppBaseUrl(),
      ),
    );
    final Response<T> response = await dio.get(
      path,
      queryParameters: queryParameters,
      options: Options(
        validateStatus: (int? status) {
          if (status != null) return status < internalServerErrorCode;
          return false;
        },
      ),
    );
    return response;
  }

}
