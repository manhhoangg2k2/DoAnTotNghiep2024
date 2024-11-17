import 'package:fare_riding_app/constant/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String initialValue;
  final String iconPath;
  final Color? iconColor;

  CustomTextField({
    required this.hintText,
    required this.controller,
    this.initialValue = '',
    required this.iconPath,
    this.iconColor
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(iconPath,height: 18, color: iconColor ?? iconColor,),
        ),
        focusColor: AppColor.white,
        fillColor: AppColor.gray_EEE, // Màu nền bên trong khi không focus
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(8.0),
        //   borderSide: BorderSide.none, // Không có viền khi không focus
        // ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: AppColor.main, width: 1.0), // Viền khi focus
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none, // Không có viền khi không focus
        ),
      ),
      style: TextStyle(color: Colors.black, overflow: TextOverflow.clip),
      cursorColor: AppColor.main,
    );
  }
}
