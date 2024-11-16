import '../database/secure_storage_helper.dart';
import '../models/response/api_response.dart';
import '../models/response/authen/login_res.dart';
import '../models/response/authen/sign_up_res.dart';
import '../models/response/fare/calculation_res.dart';
import '../models/response/user/user_info_res.dart';
import '../network/api_client.dart';
import '../network/api_util.dart';

abstract class MainRepository {
  Future<LoginRes?> getToken();
  // Future<String> Login(String phoneNumber);
  Future<void> saveToken(LoginRes loginRes);
  Future<void> removeToken();
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

  Future<APIResponse<CalculationRes>> getBookingCalculation({
    required String pickupLocation,
    required String dropoffLocation,
    required String coupon,
    required String vehicleType,
  });
  Future<APIResponse<UserInfoRes>> getUserInfo();
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

  Future<APIResponse<CalculationRes>> getBookingCalculation({
    required String pickupLocation,
    required String dropoffLocation,
    required String coupon,
    required String vehicleType
  }){
    final body = {
      "pickup_location": pickupLocation,
      "dropoff_location": dropoffLocation,
      "coupon" : coupon,
      "vehicle_type" : vehicleType
    };
    return apiClient.getBookingCalculation(body);
  }

  Future<APIResponse<UserInfoRes>> getUserInfo(){
    return apiClient.getUserInfo();
  }
}
