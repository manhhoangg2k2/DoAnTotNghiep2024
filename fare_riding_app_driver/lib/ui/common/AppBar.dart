import 'package:fare_riding_app/constant/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AppBarBase extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final bool showBackButton;
  final double elevation;
  final Function()? onBackPressed;

  const AppBarBase({
    Key? key,
    this.title,
    this.actions,
    this.showBackButton = true,
    this.elevation = 0.0,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.primary,
      elevation: elevation,
      leadingWidth: 30,
      leading: showBackButton
          ? InkWell(
        onTap: () {
          {
            Get.back();
          }
        },
        child: SvgPicture.asset(
          'assets/svg/arrow_left.svg',
          color: AppColor.white,
        ),
      )
          : SizedBox(),
      title: title != null
          ? Text(
        title!,
        style: TextStyle(
          color:  Colors.white,
        ),
      )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
