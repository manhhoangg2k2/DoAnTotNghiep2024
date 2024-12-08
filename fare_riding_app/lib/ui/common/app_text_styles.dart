import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyle {
  ///Black
  static const black = TextStyle(color: AppColors.textDark);

  static final linkButton = blackS14.copyWith(fontWeight: FontWeight.w500);
  static final description = blackS14.copyWith(fontWeight: FontWeight.w400);
  static final descriptionItem = blackS14.copyWith(fontWeight: FontWeight.w400);
  static final header = blackS20.copyWith(fontWeight: FontWeight.w700);
  static final descriptionSmall = greyS12.copyWith(fontWeight: FontWeight.w400);
  static final button = blackS14.copyWith(fontWeight: FontWeight.w700, color: AppColors.primary);
  static final title = blackS16.copyWith(fontWeight: FontWeight.w400);
  static final hint = blackS14.copyWith(fontWeight: FontWeight.w400, fontStyle: FontStyle.italic, color: AppColors.textGrey);
  static final buttonOptional = blackS14.copyWith(fontWeight: FontWeight.w400);
  static final groupHeader = blackS18.copyWith(fontWeight: FontWeight.w700);
  static final titleItem = greyS16.copyWith(fontWeight: FontWeight.w400);

  //s10
  static final blackS10 = black.copyWith(fontSize: 10);
  static final blackS10W400 = black.copyWith(fontSize: 10, fontWeight: FontWeight.w400);

  //s12
  static final blackS12 = black.copyWith(fontSize: 12);
  static final blackS12Bold = blackS12.copyWith(fontWeight: FontWeight.bold);
  static final blackS12W400 = blackS12.copyWith(fontWeight: FontWeight.w400);
  static final blackS12W800 = blackS12.copyWith(fontWeight: FontWeight.w800);

  //s14
  static final blackS14 = black.copyWith(fontSize: 14);
  static final blackS14Bold = blackS14.copyWith(fontWeight: FontWeight.bold);
  static final blackSA14W500 = blackS14.copyWith(fontWeight: FontWeight.w500);
  static final blackS14W700 = blackS14.copyWith(fontWeight: FontWeight.w700);
  static final blackS14W800 = blackS14.copyWith(fontWeight: FontWeight.w800);

  //s16
  static final blackS16 = black.copyWith(fontSize: 16);
  static final blackS16Bold = blackS16.copyWith(fontWeight: FontWeight.bold);
  static final blackS16W800 = blackS16.copyWith(fontWeight: FontWeight.w800);

  //s18
  static final blackS18 = black.copyWith(fontSize: 18);
  static final blackS18Bold = blackS18.copyWith(fontWeight: FontWeight.bold);
  static final blackS18W800 = blackS18.copyWith(fontWeight: FontWeight.w800);

  //s20
  static final blackS20 = black.copyWith(fontSize: 20);
  static final blackS20Bold = blackS20.copyWith(fontWeight: FontWeight.bold);
  static final blackS20W800 = blackS20.copyWith(fontWeight: FontWeight.w800);

  //s35
  static final blackS35 = black.copyWith(fontSize: 35);
  static final blackS35Bold = blackS35.copyWith(fontWeight: FontWeight.bold);
  static final blackS35W800 = blackS35.copyWith(fontWeight: FontWeight.w800);

  //s40
  static final blackS40 = black.copyWith(fontSize: 40);
  static final blackS40Bold = blackS40.copyWith(fontWeight: FontWeight.bold);
  static final blackS40W800 = blackS40.copyWith(fontWeight: FontWeight.w800);
  ///White
  static const white = TextStyle(color: Colors.white);

  //s12
  static final whiteS12 = white.copyWith(fontSize: 12);
  static final whiteS12Bold = whiteS12.copyWith(fontWeight: FontWeight.bold);
  static final whiteS12W800 = whiteS12.copyWith(fontWeight: FontWeight.w800);

  //s14
  static final whiteS14 = white.copyWith(fontSize: 14);
  static final whiteS14Bold = whiteS14.copyWith(fontWeight: FontWeight.bold);
  static final whiteS14W700 = whiteS14.copyWith(fontWeight: FontWeight.w700);
  static final whiteS14W800 = whiteS14.copyWith(fontWeight: FontWeight.w800);

  //s16
  static final whiteS16 = white.copyWith(fontSize: 16);
  static final whiteS16Bold = whiteS16.copyWith(fontWeight: FontWeight.bold);
  static final whiteS16W800 = whiteS16.copyWith(fontWeight: FontWeight.w800);

  //s18
  static final whiteS18 = white.copyWith(fontSize: 18);
  static final whiteS18Bold = whiteS18.copyWith(fontWeight: FontWeight.bold);
  static final whiteS18W800 = whiteS18.copyWith(fontWeight: FontWeight.w800);

  ///Gray
  static const grey = TextStyle(color: AppColors.textGrey);

  //s12
  static final greyS12 = grey.copyWith(fontSize: 12);
  static final greyS12Bold = greyS12.copyWith(fontWeight: FontWeight.bold);
  static final greyS12W800 = greyS12.copyWith(fontWeight: FontWeight.w800);

  //s14
  static final greyS14 = grey.copyWith(fontSize: 14);
  static final greyS14Bold = greyS14.copyWith(fontWeight: FontWeight.bold);
  static final greyS14W600 = greyS14.copyWith(fontWeight: FontWeight.w600);
  static final greyS14W800 = greyS14.copyWith(fontWeight: FontWeight.w800);

  //s16
  static final greyS16 = grey.copyWith(fontSize: 16);
  static final greyS16Bold = greyS16.copyWith(fontWeight: FontWeight.bold);
  static final greyS16W800 = greyS16.copyWith(fontWeight: FontWeight.w800);

  //s18
  static final greyS18 = grey.copyWith(fontSize: 18);
  static final greyS18Bold = greyS18.copyWith(fontWeight: FontWeight.bold);
  static final greyS18W800 = greyS18.copyWith(fontWeight: FontWeight.w800);

  ///Tint
  static const tint = TextStyle(color: AppColors.secondary);

  //s12
  static final tintS12 = tint.copyWith(fontSize: 12);
  static final tintS12Bold = tintS12.copyWith(fontWeight: FontWeight.bold);
  static final tintS12W800 = tintS12.copyWith(fontWeight: FontWeight.w800);

  //s14
  static final tintS14 = tint.copyWith(fontSize: 14);
  static final tintS14Bold = tintS14.copyWith(fontWeight: FontWeight.bold);
  static final tintS14W800 = tintS14.copyWith(fontWeight: FontWeight.w800);

  //s16
  static final tintS16 = tint.copyWith(fontSize: 16);
  static final tintS16Bold = tintS16.copyWith(fontWeight: FontWeight.bold);
  static final tintS16W800 = tintS16.copyWith(fontWeight: FontWeight.w800);

  //s18
  static final tintS18 = tint.copyWith(fontSize: 18);
  static final tintS18Bold = tintS18.copyWith(fontWeight: FontWeight.bold);
  static final tintS18W800 = tintS18.copyWith(fontWeight: FontWeight.w800);
}
