import 'package:bloc/bloc.dart';
import 'package:fare_riding_app/models/request/request_ride_req.dart';
import 'package:fare_riding_app/ui/common/app_bottom_sheet.dart';
import 'package:fare_riding_app/ui/common/app_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meta/meta.dart';

import '../../../di/app_module.dart';
import '../../../models/response/fare/calculation_res.dart';
import '../../../repository/main_repository.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingState());
  TextEditingController fromLocation = TextEditingController();
  TextEditingController toLocation = TextEditingController();
  final MainRepository mainRepo = getIt.get<MainRepository>();

  void Init(){

  }

  Future<void> requestRide(CalculationRes calculationRes, String paymentMethod) async {
    try{
      final result = await mainRepo.requestRide(requestRideReq: RequestRideReq(requestedRide: RequestedRide(finalPrice: calculationRes.finalPrice.toDouble(), distance: calculationRes.duration.toDouble(), duration: calculationRes.duration, pickupLocation: calculationRes.pickupLocation, dropoffLocation: calculationRes.dropoffLocation, coordinates: calculationRes.coordinates, paymentMethod: paymentMethod)));
      if(result.code == 200){
        AppSnackbar.showInfo(title: "Đặt xe thành công", message: "Bạn đã đặt xe thành công");
      }
      else{
        AppSnackbar.showError(title: "Đặt xe không thành công");
      }
    }catch(e){
      print(e);
    }
  }
}
