import 'package:fare_riding_app/constant/AppColor.dart';
import 'package:fare_riding_app/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/TextBase.dart';

class HomeMenu extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const HomeMenu({
    Key? key,
    required this.pageIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(
      //   left: 16,
      //   right: 16,
      //   bottom: Platform.isAndroid ? 16 : 0,
      // ),
      child: BottomAppBar(
        color: AppColor.transparent,
        // elevation: 0.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: EdgeInsets.all(5),
            // height: 60,
            color: AppColors.primary,
            child: Row(
              children: [
                navItem(
                  'Trang chủ',
                  'assets/svg/house.svg',
                  pageIndex == 0,
                  onTap: () => onTap(0),
                ),
                navItem(
                  'Lịch sử',
                  'assets/svg/History.svg',
                  pageIndex == 1,
                  onTap: () => onTap(1),
                ),
                // const SizedBox(width: 80), // Center space
                navItem(
                  'Ví',
                  'assets/svg/wallet.svg',
                  pageIndex == 2,
                  onTap: () => onTap(2),
                ),
                navItem(
                  'Tài khoản',
                  'assets/svg/user.svg',
                  pageIndex == 3,
                  onTap: () => onTap(3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget navItem(String label, String iconPath, bool selected, {Function()? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            SvgPicture.asset(
              iconPath,
              color: selected ? Colors.white : Colors.white.withOpacity(0.4),
            ),
            TextBase(text: label,color: selected ? Colors.white : Colors.white.withOpacity(0.4),)
          ],
        ),
      ),
    );
  }
}
