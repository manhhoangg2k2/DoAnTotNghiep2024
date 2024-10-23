import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/response/api_response.dart';
import '../models/response/authen/sign_up_res.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'http://localhost:3000')
abstract class ApiClient{
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST("/api/account/login")
  Future<APIResponse> login(@Body() Map<String, dynamic> body);

  @POST("/api/account/signUp")
  Future<APIResponse<SignUpRes>> signUp(@Body() Map<String, dynamic> body);

  @POST("/api/account/setPasscode")
  Future<APIResponse> setPasscode(@Body() Map<String, dynamic> body);
}