import 'dart:ui';

import 'package:fare_riding_app/ui/common/app_colors.dart';

enum AppStatus {
  free,
  inRequest,
}

// extension AppStatusExt on AppStatus {
//   String get getLabel {
//     switch (this) {
//       case RideStatus.coming:
//         return "Tài xế đang đến... ";
//       case RideStatus.inProcess:
//         return "Đang trên chuyến xe";
//       case RideStatus.failure:
//         return "Chuyến xe bị huỷ";
//       case RideStatus.success:
//         return "Chuyến xe hoàn thành";
//     }
//   }
//
//   Color get getColor {
//     switch (this) {
//       case RideStatus.coming:
//         return AppColors.green;
//       case RideStatus.inProcess:
//         return AppColors.yellow;
//       case RideStatus.failure:
//         return AppColors.red;
//       case RideStatus.success:
//         return AppColors.primary;
//     }
//   }
// }