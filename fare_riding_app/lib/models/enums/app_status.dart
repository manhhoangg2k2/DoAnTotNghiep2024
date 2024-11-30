import 'dart:ui';

import 'package:fare_riding_app/ui/common/app_colors.dart';

enum AppStatus {
  free,
  inRequest,
  inProcess,
  pickuped,
}

extension AppStatusExt on AppStatus {
  String get getLabel {
    switch (this) {
      case AppStatus.free:
        return "";
      case AppStatus.inProcess:
        return "Tài xế đang đến...";
      case AppStatus.inRequest:
        return "Đang chờ tài xế nhận chuyến...";
      case AppStatus.pickuped:
        return "Đang trên chuyến đi";
    }
  }

  Color get getColor {
    switch (this) {
      case AppStatus.free:
        return AppColors.green;
      case AppStatus.inProcess:
        return AppColors.green;
      case AppStatus.inRequest:
        return AppColors.yellow;
      case AppStatus.pickuped:
        return AppColors.primary;
    }
  }
}