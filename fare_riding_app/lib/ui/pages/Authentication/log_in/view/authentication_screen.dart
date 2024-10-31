import 'package:fare_riding_app/constant/AppColor.dart';
import 'package:fare_riding_app/constant/AppSize.dart';
import 'package:fare_riding_app/constant/AppText.dart';
import 'package:fare_riding_app/ui/common/otp_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../constant/AppFont.dart';
import '../../../../common/AppBar.dart';
import '../../../../common/MainButton.dart';
import '../../../../common/TextBase.dart';
import '../../../../common/TextFieldWithLabel.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneNumberController = new TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBarBase(text: "Nhập ${AppText.phoneNumber}" ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppSizes.size_20, vertical: AppSizes.size_20),
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
            SizedBox(
              height: 20,
            ),
            Mainbutton(text: AppText.sendOTP, type: 1, onTap: () {
              if (_formKey.currentState!.validate()) showModalBottomSheet(context: context, builder: (context) => OtpScreen(phoneNumber: phoneNumberController.text));
            }),
          ],
        ),
      ),
    );
  }
}
