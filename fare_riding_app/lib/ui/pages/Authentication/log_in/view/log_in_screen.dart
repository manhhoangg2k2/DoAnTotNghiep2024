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

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneNumberController = new TextEditingController();
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBarBase(text: AppText.logIn),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppSizes.size_20, vertical: AppSizes.size_20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Textfieldwithlabel(
                controller: phoneNumberController, hint: AppText.phoneNumber, initial: ''),
            SizedBox(
              height: 20,
            ),
            Mainbutton(text: AppText.logIn, type: 1, onTap: () {
              showModalBottomSheet(context: context, builder: (context) => OtpScreen(onSubmit: (String code){}, phoneNumber: phoneNumberController.text));
            }),
          ],
        ),
      ),
    );
  }
}
