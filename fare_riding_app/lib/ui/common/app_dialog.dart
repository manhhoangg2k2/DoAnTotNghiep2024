import 'package:fare_riding_app/ui/widget/empty_dialog.dart';
import 'package:fare_riding_app/ui/widget/inform_dialog_widget.dart';
import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:get/get.dart';
import '../../router/route_config.dart';
import '../widget/base_dialog_widget.dart';
import '../widget/confirm_dialog.dart';

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
      barrierDismissible: false,
    );
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
      barrierDismissible: false,
    );
  }

  // static void showConfirmCancelDialog({
  //   String? title,
  //   String? message,
  //   String? textConfirm,
  //   String? textCancel,
  //   VoidCallback? onConfirm,
  // }) {
  //   if (Get.isSnackbarOpen) {
  //     Get.closeAllSnackbars();
  //   }
  //   Get.dialog(
  //     ConfirmDialog(
  //       title: title,
  //       message: message,
  //       textConfirm: textConfirm,
  //       textCancel: textCancel,
  //       onConfirm: () {
  //         Get.back();
  //         if (onConfirm != null) {
  //           onConfirm();
  //         }
  //       },
  //     ),
  //     barrierDismissible: false,
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

  static void showEmptyDialog({
    required String title,
    required Widget widget,
  }) {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
    }
    Get.dialog(
        EmptyDialog(title: title, widget: widget,),
        barrierDismissible: false);
  }

// Các phương thức khác...
}
