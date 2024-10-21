// import 'dart:convert';
//
// import 'package:dio/dio.dart';
//
// import '../repository/auth_repository.dart';
//
//
// class ApiInterceptors extends InterceptorsWrapper {
//   @override
//   void onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     final method = options.method;
//     final uri = options.uri;
//     final data = options.data;
//     String? accessToken;
//     final isRequiredToken = options.headers["Required-Token"] ?? true;
//     if (isRequiredToken) {
//       accessToken = await loadAccessToken();
//     }
//     if (accessToken != null) {
//       options.headers['Authorization'] = 'Bearer $accessToken';
//     }
//     if (method == 'GET') {
//       logger.log(
//           "✈️ REQUEST[$method] => PATH: $uri \n Token: ${options.headers}",
//           printFullText: true);
//     } else {
//       try {
//         logger.log(
//             "✈️ REQUEST[$method] => PATH: $uri \n Token: $accessToken \n DATA: ${jsonEncode(data)}",
//             printFullText: true);
//       } catch (e) {
//         logger.log(
//             "✈️ REQUEST[$method] => PATH: $uri \n Token: $accessToken \n DATA: $data",
//             printFullText: true);
//       }
//     }
//
//     options.headers.remove("Required-Token");
//     super.onRequest(options, handler);
//   }
//
//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     final statusCode = response.statusCode;
//     final uri = response.requestOptions.uri;
//     final data = jsonEncode(response.data);
//     logger.log("✅ RESPONSE[$statusCode] => PATH: $uri\n DATA: $data");
//     //Handle section expired
//     if (response.statusCode == 401) {
//       SecureStorageHelper.instance.removeToken();
//       Get.off(const SignInScreen());
//     }
//     super.onResponse(response, handler);
//   }
//
//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//     final statusCode = err.response?.statusCode;
//     final uri = err.requestOptions.path;
//     var data = "";
//     try {
//       data = jsonEncode(err.response?.data);
//     } catch (e, s) {
//       logger.e(e, stackTrace: s);
//     }
//     logger.log("⚠️ ERROR[$statusCode] => PATH: $uri\n DATA: $data");
//     super.onError(err, handler);
//   }
//
//   bool tokenHasExpired(DateTime? dateTime) {
//     if (dateTime == null) return true;
//     return DateTime.now().isAfter(dateTime.toLocal());
//   }
//
//   Future<String?> loadAccessToken() async {
//     final AuthRepository authRepository = getIt.get<AuthRepository>();
//     final loginRes = await authRepository.getToken();
//     final accessToken = loginRes?.access;
//     final refreshToken = loginRes?.refresh;
//     if (accessToken != null && !tokenHasExpired(accessToken.expires)) {
//       return accessToken.token;
//     }
//     if (!tokenHasExpired(refreshToken?.expires) &&
//         refreshToken?.token != null) {
//       final result = await authRepository.refreshToken(refreshToken!.token);
//       await authRepository.saveToken(result);
//       return result.access?.token;
//     }
//     return null;
//   }
// }
