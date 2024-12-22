import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fare_riding_app/blocs/app_cubit.dart';
import 'package:fare_riding_app/main.dart';
import 'package:fare_riding_app/models/response/user/user_info_res.dart';
import 'package:fare_riding_app/ui/common/AppBar.dart';
import 'package:fare_riding_app/ui/common/MainButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constant/AppColor.dart';
import '../../../../constant/AppFont.dart';
import '../../../../constant/AppSize.dart';
import '../../../../constant/AppText.dart';
import '../../../common/TextBase.dart';
import '../../../common/TextFieldWithLabel.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  late bool isEdit = false;
  @override
  Widget build(BuildContext context) {
    final UserInfoRes? userInfoRes = context.read<AppCubit>().state.userInfo;
    return Scaffold(
      appBar: AppBarBase(title: "Thông tin cá nhân",),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Textfieldwithlabel(
                  controller: TextEditingController(text: 'Nguyễn Văn A'),
                  hint: AppText.name,
                  initial: userInfoRes!.name,
                  enable: isEdit,
                ),
                SizedBox(
                  height: AppSizes.size_20,
                ),
                Textfieldwithlabel(
                  controller: TextEditingController(text: 'nguyenvana@example.com'),
                  hint: AppText.email,
                  initial: userInfoRes.email,
                  enable: isEdit,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Textfieldwithlabel(
                  controller: TextEditingController(text: 'nguyenvana@example.com'),
                  hint: "Số điện thoại",
                  initial: userInfoRes.phoneNumber,
                  enable: isEdit,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Textfieldwithlabel(
                  controller: TextEditingController(text: 'nguyenvana@example.com'),
                  hint: "Giới tính",
                  initial: userInfoRes.gender == 'Male' ? "Nam" : "Nữ",
                  enable: isEdit,
                ),
              ],
            ),
            Mainbutton(text:!isEdit ? "Chỉnh sửa thông tin cá nhân" : "Xác nhận", type: 1, onTap: (){
              if(isEdit) _showOTP(context, userInfoRes.phoneNumber);
              setState(() {
                isEdit = !isEdit;
              });
            })
          ],
        )
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
