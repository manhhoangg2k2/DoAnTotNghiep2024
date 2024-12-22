import 'package:fare_riding_app/ui/common/app_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../common/app_colors.dart';
import '../common/app_images.dart';
import '../common/app_text_styles.dart';

class EmptyDialog extends StatefulWidget {
  const EmptyDialog({
    required this.widget,
    required this.title,
    Key? key,
  }) : super(key: key);

  final Widget widget;
  final String title;

  @override
  _EmptyDialogState createState() => _EmptyDialogState();
}

class _EmptyDialogState extends State<EmptyDialog> {

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.backgroundLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(const Radius.circular(10).r),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Center(
                      child: Text(widget.title,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.header
                              .copyWith(color: AppColors.primary)),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.close, color: AppColors.textDark),
                      onPressed: () => Get.back(),
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: widget.widget
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
