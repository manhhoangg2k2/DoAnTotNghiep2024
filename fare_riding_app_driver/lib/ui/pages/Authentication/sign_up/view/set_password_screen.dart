import 'package:flutter/material.dart';

import '../../../../../constant/AppColor.dart';
import '../../../../../constant/AppFont.dart';
import '../../../../../constant/AppSize.dart';
import '../../../../../constant/AppText.dart';
import '../../../../common/AppBar.dart';
import '../../../../common/MainButton.dart';
import '../../../../common/TextBase.dart';
import '../../../../common/TextFieldWithLabel.dart';

class SetPasswordScreen extends StatelessWidget {
  const SetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBarBase(title: AppText.setPassword),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(AppSizes.size_20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  TextBase(
                    text: AppText.setPassword,
                    fontWeight: AppFonts.semiBold,
                    fontSize: AppSizes.size_30,
                  ),
                  SizedBox(height: 60,),
                  Textfieldwithlabel(
                      controller: controller,
                      hint: AppText.password,
                      initial: '',
                    svgIconPath: 'assets/svg/eye.svg',
                  ),
                  SizedBox(height: 20,),
                  Textfieldwithlabel(
                      controller: controller,
                      hint: AppText.confirmPassword,
                      initial: ''
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      // TextBase(text: "Mật khẩu gồm 8 ký tự chứa ít nhất 1 ký tự đặc biệt, 1 số, 1 chữ viết hoa và 1 chữ viết thường",overflow: TextOverflow.ellipsis,),
                    ],
                  ),
                ],
              ),
              Mainbutton(
                  text: AppText.confirm,
                  type: 1,
                  onTap: (){})
            ],
          ),
        ),
      ),
    );
  }
}
