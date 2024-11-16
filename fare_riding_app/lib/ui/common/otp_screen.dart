import 'package:fare_riding_app/main.dart';
import 'package:fare_riding_app/ui/pages/Authentication/log_in/cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../constant/AppColor.dart';
import '../../constant/AppFont.dart';
import '../../constant/AppSize.dart';
import '../../constant/AppText.dart';
import 'MainButton.dart';
import 'TextBase.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    TextEditingController optController = TextEditingController();
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
                    optController.text = verificationCode;
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
                      },
                    ),
                  ],
                ),
              ],
            ),
            Mainbutton(
              text: AppText.confirm,
              type: 1,
              onTap:(){
                if(optController.text == '123456'){
                  context.read<AuthenticationCubit>().authentication(phoneNumber, context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
