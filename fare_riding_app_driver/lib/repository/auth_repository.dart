import '../database/secure_storage_helper.dart';
import '../models/response/api_response.dart';
import '../models/response/authen/login_res.dart';
import '../models/response/authen/sign_up_res.dart';
import '../network/api_client.dart';
import '../network/api_util.dart';

abstract class AuthRepository{
  Future<LoginRes?> getToken();
  Future<APIResponse<LoginRes>> authentication(String phoneNumber);
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
}

class AuthRepositoryImpl extends AuthRepository{
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
  Future<APIResponse<LoginRes>> authentication(String phoneNumber) async {
    final body = {"phoneNumber": phoneNumber};
    return apiClient.login(body);
  }

  @override
  Future<APIResponse<SignUpRes>> signUp(
      {required String name,
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
}