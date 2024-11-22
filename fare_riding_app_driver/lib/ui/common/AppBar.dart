import 'package:fare_riding_app/constant/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fare_riding_app/constant/AppFont.dart';
import 'package:fare_riding_app/constant/AppSize.dart';
import 'TextBase.dart';

class AppBarBase extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final Widget? child;
  final double fontSize;
  final double leadingWidth;
  final BuildContext? context;
  final Function? onTapBack;

  const AppBarBase({
    Key? key,
    required this.text,
    this.child,
    this.context,
    this.onTapBack,
    this.fontSize = AppSizes.size_16,
    this.leadingWidth = AppSizes.size_0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.primary,
      elevation: AppSizes.size_0,
      leadingWidth: leadingWidth,
      leading: context != null
          ? Align(
        alignment: Alignment.centerLeft,
        child: InkWell(
          onTap: () => Navigator.pop(context),
          child: SvgPicture.asset(
            'assets/svg/arrow_left.svg',
            color: AppColor.white,
          ),
        ),
      )
          : SizedBox(width: 24),
      title: Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextBase(
              fontSize: fontSize,
              fontWeight: AppFonts.medium,
              text: text,
              color: AppColor.white,
            ),
          ],
        ),
      ),
      bottom: child != null
          ? PreferredSize(preferredSize: const Size.fromHeight(50.0), child: child!)
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (child != null ? 50.0 : 0.0));
}
