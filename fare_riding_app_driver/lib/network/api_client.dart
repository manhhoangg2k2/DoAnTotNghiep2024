import 'package:dio/dio.dart';
import 'package:fare_riding_app/models/entities/location.dart';
import 'package:fare_riding_app/models/response/authen/login_res.dart';
import 'package:fare_riding_app/models/response/fare/calculation_res.dart';
import 'package:fare_riding_app/models/response/fare/coordinates_res.dart';
import 'package:fare_riding_app/models/response/fare/request_rides_res.dart';
import 'package:fare_riding_app/models/response/fare/ride_history_res.dart';
import 'package:fare_riding_app/models/response/fare/ride_res.dart';
import 'package:retrofit/retrofit.dart';

import '../models/response/api_response.dart';
import '../models/response/authen/sign_up_res.dart';
import '../models/response/user/user_info_res.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'http://localhost:3000')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST("/api/driver/authentication")
  Future<APIResponse<LoginRes>> login(@Body() Map<String, dynamic> body);

  @POST("/api/driver/signUp")
  Future<APIResponse<SignUpRes>> signUp(@Body() Map<String, dynamic> body);

  @GET("/api/driver/getDriverInfo")
  Future<APIResponse<UserInfoRes>> getUserInfo();

  @GET("/api/driver/getListRequestRide")
  Future<APIResponse<RequestRidesRes>> getListRequestRides();

  @POST("/api/driver/setPasscode")
  Future<APIResponse> setPasscode(@Body() Map<String, dynamic> body);

  @POST("/api/booking/getDirection")
  Future<APIResponse<CalculationRes>> getBookingCalculation(
      @Body() Map<String, dynamic> body);

  @POST("/api/booking/requestRide")
  Future<APIResponse> requestRide(@Body() Map<String, dynamic> body);

  @POST("/api/ride/startRide")
  Future<APIResponse<RideRes>> startRide(@Body() Map<String, dynamic> body);

  @GET("/api/app/getDirection")
  Future<APIResponse<CoordinatesRes>> getDirection(
      @Body() Map<String, dynamic> body);

  @GET("/api/driver/getRideHistory")
  Future<APIResponse<List<RideHistoryRes>>> getRideHistory({
    @Header('history-filter') required String historyFilter,
  });

  @POST("/api/ride/cancelRequesRide")
  Future<APIResponse> cancelRequestRide(@Body() Map<String, dynamic> body);

  @POST("/api/ride/updateRideStatus")
  Future<APIResponse> updateRideStatus(@Body() Map<String, dynamic> body);

  @POST("/api/ride/updateDropOffTime")
  Future<APIResponse> updateDropOffTime(@Body() Map<String, dynamic> body);

  @POST("/api/ride/updatePickUpTime")
  Future<APIResponse> updatePickUpTime(@Body() Map<String, dynamic> body);

  @POST("/api/ride/updateCreatedTime")
  Future<APIResponse> updateCreatedTime(@Body() Map<String, dynamic> body);

  @POST("/api/ride/updateRideNote")
  Future<APIResponse> updateRideNote(@Body() Map<String, dynamic> body);

  @POST("/api/ride/getRideById")
  Future<APIResponse<RideHistoryRes>> getRideById(
      @Body() Map<String, dynamic> body);
}
