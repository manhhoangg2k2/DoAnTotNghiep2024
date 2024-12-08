import 'package:fare_riding_app/blocs/app_cubit.dart';
import 'package:fare_riding_app/constant/AppColor.dart';
import 'package:fare_riding_app/ui/common/AppBar.dart';
import 'package:fare_riding_app/ui/common/MainButton.dart';
import 'package:fare_riding_app/ui/common/app_images.dart';
import 'package:fare_riding_app/ui/common/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBarBase(
            title: "Tài khoản",
            showBackButton: false,
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    _buildItem(title: "Thông tin cá nhân"),
                    SizedBox(height: 10,),
                    _buildItem(title: "Điều khoản"),
                    SizedBox(height: 10,),
                    _buildItem(title: "Liên hệ"),
                  ],
                ),
                ErrorButton(text: "Đăng xuất", onTap: (){
                  context.read<AppCubit>().logout();
                })
              ],
            ),
          ),
        );
      },
    );
  }
  Widget _buildItem({required String title, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.primary),
          color: AppColor.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyle.blackS20Bold,
            ),
            Image.asset(
              AppImages.icArrowRight,
              height: 24,
              color: AppColor.primary,
            ),
          ],
        ),
      ),
    );
  }
}


