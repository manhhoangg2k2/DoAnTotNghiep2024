import 'package:fare_riding_app/constant/AppColor.dart';
import 'package:fare_riding_app/constant/AppSize.dart';
import 'package:fare_riding_app/constant/AppText.dart';
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
    TextEditingController controller = new TextEditingController();
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBarBase(text: AppText.logIn),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppSizes.size_20, vertical: AppSizes.size_20),
        child: Column(
          children: [
            Textfieldwithlabel(
                controller: controller,
                hint: AppText.email + " hoặc " + AppText.phoneNumber,
                initial: ''),
            SizedBox(
              height: AppSizes.size_20,
            ),
            Textfieldwithlabel(
              controller: controller,
              hint: AppText.password,
              initial: '',
              svgIconPath: 'assets/svg/eye_off.svg',
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){},
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: TextBase(
                    text: AppText.forgetPassword,
                    color: AppColor.error,
                    fontWeight: AppFonts.semiBold,
                    fontSize: AppSizes.size_16,
                  )),
            ),
            SizedBox(
              height: 50,
            ),
            Mainbutton(text: AppText.logIn, type: 1, onTap: () {}),
            SizedBox(
              height: AppSizes.size_15,
            ),
            TextBase(
              text: "Hoặc",
              color: AppColor.contentDisable,
            ),
            SizedBox(
              height: AppSizes.size_15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextBase(text: "Nếu bạn đã chưa có tài khoản? "),
                InkWell(
                  child: TextBase(
                    text: AppText.signUp,
                    color: AppColor.main,
                  ),
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
