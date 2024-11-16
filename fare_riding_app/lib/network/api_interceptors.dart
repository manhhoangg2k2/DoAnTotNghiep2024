import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fare_riding_app/ui/pages/Authentication/log_in/view/authentication_screen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

import '../database/secure_storage_helper.dart';
import '../di/app_module.dart';
import '../repository/auth_repository.dart';
import '../utlis/logger.dart';


class ApiInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final method = options.method;
    final uri = options.uri;
    final data = options.data;
    String? accessToken;
    final isRequiredToken = options.headers["Required-Token"] ?? true;
    if (isRequiredToken) {
      accessToken = await loadAccessToken();
    }
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    if (method == 'GET') {
      logger.log(
          "✈️ REQUEST[$method] => PATH: $uri \n Token: ${options.headers}",
          printFullText: true);
    } else {
      try {
        logger.log(
            "✈️ REQUEST[$method] => PATH: $uri \n Token: $accessToken \n DATA: ${jsonEncode(data)}",
            printFullText: true);
      } catch (e) {
        logger.log(
            "✈️ REQUEST[$method] => PATH: $uri \n Token: $accessToken \n DATA: $data",
            printFullText: true);
      }
    }

    options.headers.remove("Required-Token");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final statusCode = response.statusCode;
    final uri = response.requestOptions.uri;
    final data = jsonEncode(response.data);
    logger.log("✅ RESPONSE[$statusCode] => PATH: $uri\n DATA: $data");
    //Handle section expired
    if (response.statusCode == 401) {
      SecureStorageHelper.instance.removeToken();
      Get.off(const AuthenticationScreen());
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;
    final uri = err.requestOptions.path;
    var data = "";
    try {
      data = jsonEncode(err.response?.data);
    } catch (e, s) {
      logger.e(e, stackTrace: s);
    }
    logger.log("⚠️ ERROR[$statusCode] => PATH: $uri\n DATA: $data");
    super.onError(err, handler);
  }

  bool tokenHasExpired(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return true;

    try {
      DateTime dateTime = DateTime.parse(dateTimeString);
      return DateTime.now().isAfter(dateTime.toLocal());
    } catch (e) {
      return true;
    }
  }


  Future<String?> loadAccessToken() async {
    final AuthRepository authRepository = getIt.get<AuthRepository>();
    final loginRes = await authRepository.getToken();
    final accessToken = loginRes?.token;
    // final refreshToken = loginRes?.refresh;
    if (accessToken != null && !tokenHasExpired(loginRes?.expired)) {
      return accessToken;
    }
    // if (!tokenHasExpired(refreshToken?.expires) &&
    //     refreshToken?.token != null) {
    //   final result = await authRepository.refreshToken(refreshToken!.token);
    //   await authRepository.saveToken(result);
    //   return result.access?.token;
    // }
    return null;
  }
}
