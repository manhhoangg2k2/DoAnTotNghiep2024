import 'dart:convert';

import 'package:fare_riding_app/database/share_preferences_helper.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/response/authen/login_res.dart';


class SecureStorageHelper {
  static const _apiTokenKey = '_apiTokenKey';

  final FlutterSecureStorage _storage;

  SecureStorageHelper._(this._storage);

  static final SecureStorageHelper _instance =
  SecureStorageHelper._(const FlutterSecureStorage());

  static SecureStorageHelper get instance => _instance;

  //Save token
  void saveToken(LoginRes loginRes) async {
    await _storage.write(key: _apiTokenKey, value: jsonEncode(loginRes.toJson()));
    SharedPreferencesHelper.setApiTokenKey(_apiTokenKey);
  }

  //Remove token
  removeToken() async {
    await _storage.delete(key: _apiTokenKey);
    SharedPreferencesHelper.removeApiTokenKey();
  }

  //Get token
  Future<LoginRes?> getToken() async {
    try {
      final key = await SharedPreferencesHelper.getApiTokenKey();
      final tokenEncoded = await _storage.read(key: key);
      if (tokenEncoded == null) {
        return null;
      } else {
        return LoginRes.fromJson(
            jsonDecode(tokenEncoded) as Map<String, dynamic>);
      }
    } catch (e) {
      return null;
    }
  }
}
