import 'package:bloc/bloc.dart';
import 'package:fare_riding_app/repository/main_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../../repository/auth_repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState());

  AuthRepositoryImpl authRepo = AuthRepositoryImpl();
  MainRepositoryImpl mainRepo = MainRepositoryImpl();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController gendleController = TextEditingController();

  void setGendle(String value) {
    emit(state.copyWith(gendle: value));
  }

  void verifyOTP(String optCode) {
    print(nameController.text);
  }

  Future<void> signUp(
      {required String name,
        required String phoneNumber,
        required String gender,
        String? email}) async {
    try {
      final result = await authRepo.signUp(
          name: name,
          phoneNumber: phoneNumber,
          email: email != null ? email : "",
          gender: gender,
          password: "1",
          passcode: "1",
          balance: 0
      );
      if (result.code == 200) {
        print('Đăng ký thành công: ${result.data}');
      } else {
        print('Đăng ký không thành công: ${result.message}');
      }
    } catch (error) {
      print('Có lỗi xảy ra: $error');
    }
  }

  Future<void> setPasscode(
      {required String phoneNumber,
        required String passcode}) async {
    try {
      final result = await mainRepo.setPasscode(
          phoneNumber: phoneNumber,
          passcode: passcode,
      );
      if (result.code == 200) {
        print('Đăng ký thành công: ${result.data}');
      } else {
        print('Đăng ký không thành công: ${result.message}');
      }
    } catch (error) {
      print('Có lỗi xảy ra: $error');
    }
  }

}
