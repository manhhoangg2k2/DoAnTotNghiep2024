import 'package:fare_riding_app/ui/pages/Authentication/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../../../constant/AppFont.dart';
import '../../../../../constant/AppSize.dart';
import '../../../../../constant/AppText.dart';
import '../../../../common/MainButton.dart';
import '../../../../common/TextBase.dart';

class SetPasscodeScreen extends StatelessWidget {
  const SetPasscodeScreen({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {

    return BlocProvider<SignUpCubit>(
      create: (context) => SignUpCubit(),
      child: _SetPasscodeWidget(phoneNumber: phoneNumber)
    );
  }
}

class _SetPasscodeWidget extends StatefulWidget {
  const _SetPasscodeWidget({super.key, required this.phoneNumber});

  final String phoneNumber;


  @override
  State<_SetPasscodeWidget> createState() => _SetPasscodeWidgetState();
}

class _SetPasscodeWidgetState extends State<_SetPasscodeWidget> {
  @override
  Widget build(BuildContext context) {
    TextEditingController passcode = TextEditingController();
    
    return Scaffold(
      appBar: AppBar(title: Text("Thiết lập mật mã"),),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextBase(
                  text: "Thiết lập mật mã",
                  fontWeight: AppFonts.semiBold,
                  fontSize: AppSizes.size_30,
                ),
                SizedBox(height: 20,),
                TextBase(text: "Thiết lập mật mã cho tài khoản của bạn",
                  fontSize: AppSizes.size_16,),
                SizedBox(height: 60,),
                OtpTextField(
                  styles: [],
                  fieldWidth: 45,
                  numberOfFields: 6,
                  borderColor: Color(0xFF512DA8),
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {
                    passcode.text = code;
                  },
                  onSubmit: (String verificationCode) {},
                  inputFormatters: [DotInputFormatter()],
                ),

              ],
            ),
            Mainbutton(
              text: AppText.confirm,
              type: 1,
              onTap: () {
                SignUpCubit _cubit = BlocProvider.of<SignUpCubit>(context);
                _cubit.setPasscode(phoneNumber: widget.phoneNumber, passcode: passcode.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}


class DotInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,
      TextEditingValue newValue) {
    String text = newValue.text.replaceAll(RegExp(r'.'), '•');
    return newValue.copyWith(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
