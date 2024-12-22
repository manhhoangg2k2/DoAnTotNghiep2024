import 'package:fare_riding_app/models/request/request_ride_req.dart';
import 'package:fare_riding_app/models/response/coupon/coupon_res.dart';
import 'package:fare_riding_app/models/response/transaction/transaction_res.dart';

import '../database/secure_storage_helper.dart';
import '../models/response/api_response.dart';
import '../models/response/authen/login_res.dart';
import '../models/response/authen/sign_up_res.dart';
import '../models/response/fare/calculation_res.dart';
import '../models/response/fare/ride_history_res.dart';
import '../models/response/user/user_info_res.dart';
import '../network/api_client.dart';
import '../network/api_util.dart';

abstract class MainRepository {
  Future<LoginRes?> getToken();
  // Future<String> Login(String phoneNumber);
  Future<void> saveToken(LoginRes loginRes);
  Future<void> removeToken();
  Future<APIResponse<CouponRes>> getListCoupon();
  Future<APIResponse<SignUpRes>> signUp({
    required String name,
    required String phoneNumber,
    required String email,
    required String gender,
    required String password,
    required String passcode,
    required double balance,
  });

  Future<APIResponse> setPasscode({
    required String phoneNumber,
    required String passcode,
  });

  Future<APIResponse> updateRideStatus({
    required String id,
    required String status,
  });

  Future<APIResponse> updatePickUpTime({
    required String id,
    required DateTime pickUpTime,
  });

  Future<APIResponse> updateDropOffTime({
    required String id,
    required DateTime dropOffTime,
  });

  Future<APIResponse> addReview({
    required String id,
    required double rating,
    required String comment,
  });

  Future<APIResponse> cancelRequestRide({required String id});

  Future<APIResponse<List<CalculationRes>>> getBookingCalculation({
    required String pickupLocation,
    required String dropoffLocation,
    required String coupon,
    required String vehicleType,
  });
  Future<APIResponse<UserInfoRes>> getUserInfo();

  Future<APIResponse<List<RideHistoryRes>>> getRideHistory(
      {required String historyFilter});

  Future<APIResponse<List<TransactionRes>>> getTransactionHistory(
      {required String historyFilter});

  Future<APIResponse> requestRide({
    required RequestRideReq requestRideReq,
  });

  Future<APIResponse> updateRideNote({
    required String id,
    required String note,
  });

  Future<APIResponse> finishRide({
    required String id,
  });

  Future<APIResponse<RideHistoryRes>> getRideById({
    required String id,
  });

  Future<APIResponse> requestDeposit({
    required double amount,
    required String created_time,
    required String description,
  });
}

class MainRepositoryImpl extends MainRepository {
  ApiClient apiClient = ApiUtil.apiClient;

  @override
  Future<LoginRes?> getToken() async {
    return await SecureStorageHelper.instance.getToken();
  }

  @override
  Future<void> removeToken() async {
    return await SecureStorageHelper.instance.removeToken();
  }

  @override
  Future<void> saveToken(LoginRes loginRes) async {
    return SecureStorageHelper.instance.saveToken(loginRes);
  }

  Future<APIResponse<CouponRes>> getListCoupon() {
    return apiClient.getListCoupon();
  }

  Future<APIResponse> cancelRequestRide({required String id}) {
    final body = {
      "id": id,
    };
    return apiClient.cancelRequestRide(body);
  }

  @override
  Future<APIResponse<SignUpRes>> signUp({
    required String name,
    required String phoneNumber,
    required String email,
    required String gender,
    required String password,
    required String passcode,
    required double balance,
  }) {
    final body = {
      "name": name,
      "phoneNumber": phoneNumber,
      "email": email,
      "gender": gender,
      "password": email,
      "passcode": passcode,
      "balance": balance,
    };
    return apiClient.signUp(body);
  }

  @override
  Future<APIResponse> setPasscode({
    required String phoneNumber,
    required String passcode,
  }) {
    final body = {
      "phoneNumber": phoneNumber,
      "passcode": passcode,
    };
    return apiClient.setPasscode(body);
  }

  Future<APIResponse> updateRideStatus({
    required String id,
    required String status,
  }) {
    final body = {
      "id": id,
      "status": status,
    };
    return apiClient.updateRideStatus(body);
  }

  Future<APIResponse> updatePickUpTime({
    required String id,
    required DateTime pickUpTime,
  }) {
    final body = {
      "id": id,
      "pickup_time": pickUpTime,
    };
    return apiClient.updatePickUpTime(body);
  }

  Future<APIResponse> updateDropOffTime({
    required String id,
    required DateTime dropOffTime,
  }) {
    final body = {
      "id": id,
      "dropoff_time": dropOffTime,
    };
    return apiClient.updateDropOffTime(body);
  }

  Future<APIResponse<List<CalculationRes>>> getBookingCalculation(
      {required String pickupLocation,
      required String dropoffLocation,
      required String coupon,
      required String vehicleType}) {
    final body = {
      "pickup_location": pickupLocation,
      "dropoff_location": dropoffLocation,
      "coupon": coupon,
      "vehicle_type": vehicleType
    };
    return apiClient.getBookingCalculation(body);
  }

  Future<APIResponse> requestRide({
    required RequestRideReq requestRideReq,
  }) {
    return apiClient.requestRide(requestRideReq.toJson());
  }

  Future<APIResponse<UserInfoRes>> getUserInfo() {
    return apiClient.getUserInfo();
  }

  Future<APIResponse<List<RideHistoryRes>>> getRideHistory(
      {required String historyFilter}) {
    return apiClient.getRideHistory(historyFilter: historyFilter);
  }

  Future<APIResponse<List<TransactionRes>>> getTransactionHistory(
      {required String historyFilter}) {
    return apiClient.getTransactionHistory(historyFilter: historyFilter);
  }

  Future<APIResponse> updateRideNote({
    required String id,
    required String note,
  }) {
    final body = {
      "id": id,
      "note": note,
    };
    return apiClient.updateRideNote(body);
  }

  Future<APIResponse> finishRide({
    required String id,
  }){
    final body = {
      "id": id,
    };
    return apiClient.finishRide(body);
  }

  Future<APIResponse<RideHistoryRes>> getRideById({
    required String id,
  }) {
    final body = {
      "id": id,
    };
    return apiClient.getRideById(body);
  }

  Future<APIResponse> addReview({
    required String id,
    required double rating,
    required String comment,
  }) {
    final body = {
      "id": id,
      "rating": rating,
      "comment": comment,
    };
    return apiClient.addReview(body);
  }

  Future<APIResponse> requestDeposit({
    required double amount,
    required String created_time,
    required String description,
  }){
    final body = {
      "amount": amount,
      "created_time": created_time,
      "description": description,
    };
    return apiClient.requestDeposit(body);
  }
}
