import 'package:bloc/bloc.dart';
import 'package:fare_riding_app/ui/common/app_snackbar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meta/meta.dart';

import '../../../../di/app_module.dart';
import '../../../../repository/main_repository.dart';
import '../../../../router/route_config.dart';

part 'completed_ride_state.dart';

class CompletedRideCubit extends Cubit<CompletedRideState> {
  CompletedRideCubit() : super(CompletedRideInitial());
  final MainRepository mainRepo = getIt.get<MainRepository>();

  Future<void> addReview(String id, double rating, String comment) async {
    try{
      final result = await mainRepo.addReview(id: id, rating: rating, comment: comment);
      if(result.code == 200){
        AppSnackbar.showInfo(title: "Thông báo", message: "Đánh giá chuyến đi thành công");
        Get.toNamed(RouteConfig.main);
      }
      else{
        AppSnackbar.showError(title: "Lỗi");
      }
    }catch(e){
      AppSnackbar.showError(title: "Lỗi");
    }
  }
}
