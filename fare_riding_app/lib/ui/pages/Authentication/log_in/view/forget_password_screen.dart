
import 'package:fare_riding_app/constant/AppColor.dart';
import 'package:fare_riding_app/constant/AppSize.dart';
import 'package:fare_riding_app/constant/AppText.dart';
import 'package:flutter/material.dart';

import '../../../../common/AppBar.dart';
import '../../../../common/MainButton.dart';
import '../../../../common/TextBase.dart';
import '../../../../common/TextFieldWithLabel.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBarBase(text: AppText.forgetPassword),
      body: Container(
        padding: EdgeInsets.all(AppSizes.size_20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextBase(text: "Xác thực email hoặc số điện thoại", fontSize: AppSizes.size_20,),
                SizedBox(height: 40,),
                Textfieldwithlabel(
                    controller: controller,
                    hint: AppText.email + " hoặc " + AppText.phoneNumber
                )
              ],
            ),
            Mainbutton(text: AppText.sendOTP, type: 1, onTap: (){})
          ],
        ),
      ),
    );
  }
}
