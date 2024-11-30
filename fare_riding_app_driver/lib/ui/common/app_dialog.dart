import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:get/get.dart';
import '../../router/route_config.dart';
import '../widget/base_dialog_widget.dart';
import '../widget/confirm_dialog.dart';
import '../widget/inform_dialog_widget.dart';

class AppDialog {
  static void showDialog({
    String? title,
    String? message,
    String? textConfirm,
    String? textCancel,
    VoidCallback? onConfirm,
    Widget? contentDialog,
  }) {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
    }
    Get.dialog(
        BaseDialogWidget(
          title: title ?? "Thông báo",
          description: message,
          contentDialog: contentDialog,
          onConfirm: onConfirm,
          onCancel: () {
            Get.back();
          },
          textCancel: textCancel,
          textConfirm: textConfirm,
        ),
        barrierDismissible: false);
  }

  static showDialogRequireLogin() async {
    Get.dialog(
        BaseDialogWidget(
          title: "Chưa đăng nhập",
          description: "Đăng nhập để sử dụng tính năng này",
          textCancel: "Đóng",
          textConfirm: "Đăng nhập",
          onCancel: () {
            Get.back();
          },
          onConfirm: () async {
            Get.back();
            Get.toNamed(RouteConfig.signIn);
          },
        ),
        barrierDismissible: false);
  }

  // static showDialogFullScreen({
  //   required List<String> urlImages,
  //   required int index,
  // }) {
  //   return Get.dialog(Dialog(
  //     insetPadding: EdgeInsets.zero,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(0),
  //     ),
  //     backgroundColor: Colors.transparent,
  //     child: InkWell(
  //       onTap: () {
  //         Get.back();
  //       },
  //       child: Container(
  //         width: double.infinity,
  //         height: double.infinity,
  //         color: AppColors.textDark.withOpacity(0.5),
  //         child: Stack(
  //           children: [
  //             Center(
  //               child: InkWell(
  //                 onTap: () {},
  //                 child: BannerProductDetailWidget(
  //                   urlImages: urlImages,
  //                   index: index,
  //                   canShowImages: false,
  //                 ),
  //               ),
  //             ),
  //             Positioned(
  //               right: 20.w,
  //               top: 15.h,
  //               child: Image.asset(
  //                 AppImages.icCancel1,
  //                 height: 20.h,
  //                 color: AppColors.backgroundLight,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   ));
  // }

  // static showNotiDialog({
  //   required DialogStatus dialogStatus,
  //   String? description,
  //   String? title,
  //   String? textConfirm,
  //   String? textReject,
  //   Image? image,
  //   VoidCallback? onConfirm,
  //   VoidCallback? onReject,
  //   bool barrierDismissible = false,
  //   Color bgColorConfirm = AppColors.primary,
  // }) {
  //   return Get.dialog(
  //     barrierDismissible: barrierDismissible,
  //     IconDialogWidget(
  //       image: dialogStatus.getDefaultImage(image: image),
  //       title: title ?? dialogStatus.getTitle,
  //       description: description,
  //       textConfirm: textConfirm,
  //       textReject: textReject,
  //       onConfirm: onConfirm,
  //       onReject: onReject,
  //       bgColorConfirm: bgColorConfirm,
  //     ),
  //   );
  // }
  //
  // static showNoteDialog({
  //   Color backgroundColor = AppColors.backgroundLight,
  //   String message = '',
  //   String title = '',
  //   String textConfirm = 'Xác nhận',
  //   String textReject = 'Đóng',
  //   ValueChanged<String>? onConfirm,
  //   VoidCallback? onReject,
  //   String hint = '',
  //   bool barrierDismissible = false,
  // }) {
  //   return Get.dialog(
  //     barrierDismissible: barrierDismissible,
  //     NoteDialogWidget(
  //       backgroundColor: backgroundColor,
  //       title: title,
  //       message: message,
  //       hint: hint,
  //       onConfirm: onConfirm,
  //       onReject: onReject,
  //       textConfirm: textConfirm,
  //       textReject: textReject,
  //     ),
  //   );
  // }
  static void showConfirmDialog({
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    required String text,
  }) {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
    }
    Get.dialog(
        ConfirmDialog(onConfirm: onConfirm, onCancel: onCancel,text: text,),
        barrierDismissible: false);
  }

  static void showInformDialog({
    VoidCallback? onConfirm,
    required Widget widget,
  }) {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
    }
    Get.dialog(
        InformDialogWidget(onConfirm: onConfirm, widget: widget,),
        barrierDismissible: false);
  }
}
