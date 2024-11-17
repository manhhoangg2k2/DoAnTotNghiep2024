import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app_colors.dart';
import 'app_images.dart';
import 'app_text_styles.dart';


class AppSnackbar {
  static Future<void> showInfo({String? title, String? message}) async {
    Get.closeAllSnackbars();
    Get.snackbar(
      title ?? "Thông báo",
      message ?? "Empty message",
      titleText: const SizedBox(),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      duration: const Duration(seconds: 2),
      borderRadius: 10,
      messageText: buildContentSnackbarWidget(
          title: title ?? "Thông báo",
          message: message,
          imageUrl: AppImages.icSuccess),
      backgroundColor: AppColors.backgroundHighLight,
    );
  }

  static Future<void> showWarning({String? title, String? message}) async {
    Get.closeAllSnackbars();
    Get.snackbar(
      title ?? "Thông báo",
      message ?? "Empty message",
      titleText: const SizedBox(),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      duration: const Duration(seconds: 2),
      borderRadius: 10,
      messageText: buildContentSnackbarWidget(
          title: title ?? "Thông báo",
          message: message,
          imageUrl: AppImages.icWarning),
      backgroundColor: AppColors.backgroundWarning,
    );
  }

  static Future<void> showError({String? title, String? message}) async {
    Get.closeAllSnackbars();
    Get.snackbar(
      title ?? "Lỗi",
      message ?? "Empty message",
      titleText: const SizedBox(),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      duration: const Duration(seconds: 2),
      borderRadius: 10,
      messageText: buildContentSnackbarWidget(
          title: title ?? "Lỗi", message: message, imageUrl: AppImages.icError),
      backgroundColor: AppColors.backgroundError,
    );
  }
}

buildContentSnackbarWidget({
  required String title,
  String? message,
  String? imageUrl,
}) {
  return Row(
    children: [
      Container(
        height: 32.h,
        width: 32.w,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50).r),
        child: imageUrl != null
            ? Image.asset(imageUrl, height: 28.h)
            : const SizedBox(),
      ),
      SizedBox(width: 16.w),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyle.title,
            ),
            Text(
              message ?? '',
              style: AppTextStyle.description,
            )
          ],
        ),
      ),
      SizedBox(width: 16.w),
      Image.asset(
        AppImages.icCancel1,
        height: 12.5.h,
      )
    ],
  );
}
