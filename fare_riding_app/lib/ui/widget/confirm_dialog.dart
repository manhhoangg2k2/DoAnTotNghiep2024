import 'package:fare_riding_app/ui/common/app_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../common/app_colors.dart';
import '../common/app_images.dart';
import '../common/app_text_styles.dart';

class ConfirmDialog extends StatefulWidget {
  const ConfirmDialog({
    this.onConfirm,
    this.onCancel,
    required this.text,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final String? text;

  @override
  _ConfirmDialogWidgetState createState() => _ConfirmDialogWidgetState();
}

class _ConfirmDialogWidgetState extends State<ConfirmDialog> {
  bool isChecked = false;

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
                      child: Text('LƯU Ý',
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
                child: Text(
                  widget.text!,
                  softWrap: true,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: AppColors.primary,
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      isChecked = !isChecked;
                    }),
                    child: Text(
                      'Chắc chắn',
                      style: AppTextStyle.description,
                    ),
                  ),
                ],
              ),
              const SolidAppDivider(),
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                        child: TextButton(
                      onPressed: () {
                        Get.back();
                        widget.onCancel!();
                      },
                      child: Text(
                        'Quay lại',
                        style: AppTextStyle.buttonOptional
                            .copyWith(color: AppColors.primary),
                      ),
                    )),
                    const VerticalDivider(
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: !isChecked
                            ? null
                            : () async {
                                Get.back();
                                Future.delayed(const Duration(milliseconds: 0),
                                    () {
                                  if (widget.onConfirm != null) {
                                    widget.onConfirm!();
                                  }
                                });
                              },
                        child: Text(
                          'Đồng ý',
                          style: AppTextStyle.button.copyWith(
                              color: !isChecked
                                  ? Colors.grey
                                  : AppColors.textDark),
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
