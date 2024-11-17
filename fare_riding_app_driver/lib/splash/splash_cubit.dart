import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../blocs/app_cubit.dart';
import '../../../di/app_module.dart';
import '../repository/auth_repository.dart';
import '../repository/main_repository.dart';
import '../router/route_config.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());
  final AuthRepository authRepository = getIt.get<AuthRepository>();
  final MainRepository mainRepo = getIt.get<MainRepository>();

  void checkLogin(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    final accessToken = await loadAccessToken();
    if (accessToken != null) {
      // final deviceInfo = await Utils().getDeviceID();
      // authRepository.pushFcmToken(fcmToken: context.read<AppCubit>().fcmToken, deviceInfo: deviceInfo);
      emit(state.copyWith(isLoggedIn: true));
    } else {
      await authRepository.removeToken();
      Get.offAllNamed(RouteConfig.home);
    }
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

 // Future<bool> isStoreReview() async {
 //    try {
 //      final result = await mainRepo.getConfigStoreReview();
 //      bool isStoreReview = (Platform.isAndroid ?  result.data?.androidStoreReview : result.data?.iosStoreReview) ?? true;
 //      return isStoreReview;
 //    }
 //    catch (_) {
 //      return true;
 //    }
 //  }
}
