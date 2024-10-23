import 'package:fare_riding_app/constant/AppColor.dart';
import 'package:fare_riding_app/constant/AppFont.dart';
import 'package:fare_riding_app/constant/AppSize.dart';
import 'package:fare_riding_app/constant/AppText.dart';
import 'package:fare_riding_app/ui/pages/Authentication/sign_up/cubit/sign_up_cubit.dart';
import 'package:fare_riding_app/ui/pages/Authentication/sign_up/view/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/AppBar.dart';
import '../../../../common/MainButton.dart';
import '../../../../common/TextBase.dart';
import '../../../../common/TextFieldWithLabel.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});


  @override
  Widget build(BuildContext context) {
    TextEditingController phoneNumberController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBarBase(text: "Xác nhận " + AppText.phoneNumber.toLowerCase()),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(AppSizes.size_20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: _formKey,
                child: Textfieldwithlabel(
                  controller: phoneNumberController,
                  hint: AppText.phoneNumber,
                  initial: '',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập số điện thoại';
                    }
                    final RegExp phoneRegex = RegExp(
                        r'^0\d{9}$');
                    if (!phoneRegex.hasMatch(value)) {
                      return 'Số điện thoại không hợp lệ';
                    }
                    return null;
                  },
                ),
              ),
              // Column(
              //   children: [
              //     TextBase(
              //       text: AppText.otpVerification,
              //       fontWeight: AppFonts.semiBold,
              //       fontSize: AppSizes.size_30,
              //     ),
              //     SizedBox(height: 20,),
              //     TextBase(text: AppText.otpDescription, fontSize: AppSizes.size_16,),
              //     SizedBox(height: 60,),
              //     OtpTextField(
              //       fieldWidth: 45,
              //       numberOfFields: 6,
              //       borderColor: Color(0xFF512DA8),
              //       showFieldAsBox: true,
              //       onCodeChanged: (String code) {
              //         // handle validation or checks here
              //       },
              //       onSubmit: (String verificationCode) {
              //         // Gọi hàm xác thực OTP ở đây
              //       },
              //     ),
              //     SizedBox(height: 20,),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         TextBase(text: "Bạn chưa nhận được mã xác nhận? "),
              //         InkWell(
              //           child: TextBase(
              //             text: AppText.reSend,
              //             color: AppColor.main,
              //             fontWeight: AppFonts.semiBold,
              //           ),
              //           onTap: () {
              //             // Gọi lại mã OTP
              //             // signUpCubit.resendOtp();
              //           },
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              Column(
                children: [
                  Mainbutton(
                    text: AppText.sendOTP,
                    type: 1,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _showOTP(context, phoneNumberController.text);
                      }
                    },
                  ),
                  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showOTP(BuildContext context, String phoneNumber){
    showModalBottomSheet(context: context, builder: (context) => _buildOTP(context, phoneNumber));
  }

  Widget _buildOTP(BuildContext context, String phoneNumber){
    return Center(
      child: Container(
        padding: EdgeInsets.all(AppSizes.size_20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextBase(
                  text: AppText.otpVerification,
                  fontWeight: AppFonts.semiBold,
                  fontSize: AppSizes.size_30,
                ),
                SizedBox(height: 20,),
                TextBase(text: AppText.otpDescription, fontSize: AppSizes.size_16,),
                SizedBox(height: 60,),
                OtpTextField(
                  fieldWidth: 45,
                  numberOfFields: 6,
                  borderColor: Color(0xFF512DA8),
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {
                    // handle validation or checks here
                  },
                  onSubmit: (String verificationCode) {
                    if(verificationCode == '123456'){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen(phoneNumber: phoneNumber)),
                      );
                    }
                  },
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextBase(text: "Bạn chưa nhận được mã xác nhận? "),
                    InkWell(
                      child: TextBase(
                        text: AppText.reSend,
                        color: AppColor.main,
                        fontWeight: AppFonts.semiBold,
                      ),
                      onTap: () {
                        // Gọi lại mã OTP
                        // signUpCubit.resendOtp();
                      },
                    ),
                  ],
                ),
              ],
            ),
            // Mainbutton(
            //   text: AppText.confirm,
            //   type: 1,
            //   onTap: () {
            //     // Thực hiện xác thực khi nhấn nút confirm
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
