import 'package:fare_riding_app/constant/AppColor.dart';
import 'package:fare_riding_app/ui/common/app_colors.dart';
import 'package:flutter/material.dart';

enum TransactionStatus {
  inProcess,
  success,
  cancel
}

extension TransactionStatusExt on TransactionStatus {
  String get getLabel {
    switch (this) {
      case TransactionStatus.inProcess:
        return "Đang thực hiện";
      case TransactionStatus.success:
        return "Thành công";
      case TransactionStatus.cancel:
        return "Thất bại";
    }
  }

  Color get getColor {
    switch (this) {
      case TransactionStatus.inProcess:
        return AppColor.warning;
      case TransactionStatus.success:
        return AppColors.green;
      case TransactionStatus.cancel:
        return AppColors.red;
    }
  }
}

extension TransactionStatusStringExt on String {
  TransactionStatus? toTransactionStatus() {
    switch (this) {
      case "inProcess":
        return TransactionStatus.inProcess;
      case "success":
        return TransactionStatus.success;
      case "cancel":
        return TransactionStatus.cancel;
      default:
        return null;
    }
  }
}

