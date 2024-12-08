import 'package:fare_riding_app/constant/AppColor.dart';
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
      top: MediaQuery.of(context).padding.top, // Đặt nút ở trên cùng (dưới status bar)
      left: 10.0,
      child: GestureDetector(
        onTap: onPressed ?? () => Navigator.of(context).pop(),
        child: Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: AppColor.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(4.0),
            boxShadow: [
              BoxShadow(
                color: AppColor.black,
                blurRadius: 4.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/svg/arrow_left.svg',
              color: AppColor.primary,
              width: 24,
                height: 24,
            ),
          ),
        ),
      ),
    );
  }
}
