import 'package:dio/dio.dart';
import 'package:fare_riding_app/models/response/authen/login_res.dart';
import 'package:fare_riding_app/models/response/coupon/coupon_res.dart';
import 'package:fare_riding_app/models/response/fare/calculation_res.dart';
import 'package:fare_riding_app/models/response/transaction/transaction_res.dart';
import 'package:retrofit/retrofit.dart';

import '../models/response/api_response.dart';
import '../models/response/authen/sign_up_res.dart';
import '../models/response/fare/ride_history_res.dart';
import '../models/response/user/user_info_res.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'http://localhost:3000')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/api/app/getListCoupon")
  Future<APIResponse<CouponRes>> getListCoupon();

  @POST("/api/account/authentication")
  Future<APIResponse<LoginRes>> login(@Body() Map<String, dynamic> body);

  @POST("/api/account/signUp")
  Future<APIResponse<SignUpRes>> signUp(@Body() Map<String, dynamic> body);

  @GET("/api/account/getUserInfo")
  Future<APIResponse<UserInfoRes>> getUserInfo();

  @GET("/api/account/getRideHistory")
  Future<APIResponse<List<RideHistoryRes>>> getRideHistory({
    @Header('history-filter') required String historyFilter,
  });

  @GET("/api/account/getTransactionHistory")
  Future<APIResponse<List<TransactionRes>>> getTransactionHistory({
    @Header('history-filter') required String historyFilter,
  });

  @POST("/api/account/setPasscode")
  Future<APIResponse> setPasscode(@Body() Map<String, dynamic> body);

  @POST("/api/booking/getDirection")
  Future<APIResponse<List<CalculationRes>>> getBookingCalculation(
      @Body() Map<String, dynamic> body);

  @POST("/api/booking/requestRide")
  Future<APIResponse> requestRide(@Body() Map<String, dynamic> body);

  @POST("/api/ride/cancelRequestRide")
  Future<APIResponse> cancelRequestRide(@Body() Map<String, dynamic> body);

  @POST("/api/ride/updateRideStatus")
  Future<APIResponse> updateRideStatus(@Body() Map<String, dynamic> body);

  @POST("/api/ride/updateDropOffTime")
  Future<APIResponse> updateDropOffTime(@Body() Map<String, dynamic> body);

  @POST("/api/ride/updatePickUpTime")
  Future<APIResponse> updatePickUpTime(@Body() Map<String, dynamic> body);

  @POST("/api/ride/updateRideNote")
  Future<APIResponse> updateRideNote(@Body() Map<String, dynamic> body);

  @POST("/api/ride/getRideById")
  Future<APIResponse<RideHistoryRes>> getRideById(
      @Body() Map<String, dynamic> body);

  @POST("/api/ride/addReview")
  Future<APIResponse> addReview(
      @Body() Map<String, dynamic> body);

  @POST("/api/ride/finishRide")
  Future<APIResponse> finishRide(
      @Body() Map<String, dynamic> body);

  @POST("/api/account/requestDeposit")
  Future<APIResponse> requestDeposit(
      @Body() Map<String, dynamic> body);
}
