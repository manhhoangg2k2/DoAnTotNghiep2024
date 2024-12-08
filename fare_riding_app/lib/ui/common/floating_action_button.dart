import 'package:fare_riding_app/constant/AppColor.dart';
import 'package:fare_riding_app/ui/common/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LeftBackButton extends StatelessWidget {
  final Function()? onPressed;

  const LeftBackButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top,
      left: 20.0,
      child: GestureDetector(
        onTap: onPressed ?? () => Navigator.of(context).pop(),
        child: Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: SvgPicture.asset(
              'assets/svg/arrow_left.svg',
              color: AppColor.white,
              width: 24,
              height: 24,

            ),
          ),
        ),
      ),
    );
  }
}
