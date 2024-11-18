import 'package:fare_riding_app/constant/AppColor.dart';
import 'package:fare_riding_app/ui/common/app_images.dart';
import 'package:fare_riding_app/ui/common/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBottomSheet {
  static void showBottomSheet({
    required String title,
    required Widget body,
    double? minHeight,
  }) {
    final maxHeight = Get.height * 0.92;
    if ((minHeight ?? 0) > maxHeight) minHeight = maxHeight;
    Get.bottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      Container(
        constraints: BoxConstraints(
            maxHeight: Get.height * 0.92,
            minHeight: minHeight ?? Get.height * 0.25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 8),
            Container(
              color: AppColor.bottomSheetStroke,
              height: 4,
              width: 36,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 14.5, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 24),
                  Expanded(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.blackS16Bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      AppImages.icDown,
                      width: 24,
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              child: body,
            ),
          ],
        ),
      ),
    );
  }
}