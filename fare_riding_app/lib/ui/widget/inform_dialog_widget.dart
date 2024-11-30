import 'package:fare_riding_app/ui/common/app_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../common/app_colors.dart';
import '../common/app_images.dart';
import '../common/app_text_styles.dart';

class InformDialogWidget extends StatefulWidget {
  const InformDialogWidget({
    this.onConfirm,
    required this.widget,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onConfirm;
  final Widget? widget;

  @override
  _ConfirmDialogWidgetState createState() => _ConfirmDialogWidgetState();
}

class _ConfirmDialogWidgetState extends State<InformDialogWidget> {

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
                      child: Text('THÔNG BÁO',
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
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed:() async {
                          Get.back();
                          Future.delayed(const Duration(milliseconds: 0),
                                  () {
                                if (widget.onConfirm != null) {
                                  widget.onConfirm!();
                                }
                              });
                        },
                        child: Text(
                          'Xác nhận',
                          style: AppTextStyle.button.copyWith(
                              color: AppColors.textDark),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
