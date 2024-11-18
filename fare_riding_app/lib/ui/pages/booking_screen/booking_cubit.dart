import 'package:bloc/bloc.dart';
import 'package:fare_riding_app/models/entities/ride_entity.dart';
import 'package:fare_riding_app/models/request/request_ride_req.dart';
import 'package:fare_riding_app/models/response/coupon/coupon_res.dart';
import 'package:fare_riding_app/ui/common/app_bottom_sheet.dart';
import 'package:fare_riding_app/ui/common/app_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meta/meta.dart';

import '../../../di/app_module.dart';
import '../../../models/response/fare/calculation_res.dart';
import '../../../repository/main_repository.dart';
import '../../common/app_loading.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  late final RideEntity rideEntity;
  final MainRepository mainRepo = getIt.get<MainRepository>();

  BookingCubit() : super(BookingState()) {
    rideEntity = Get.arguments;
    Init();
  }

  TextEditingController fromLocation = TextEditingController();
  TextEditingController toLocation = TextEditingController();

  void Init() async {
    await getListCoupon();
    emit(state.copyWith(rideEntity: rideEntity));
  }

  Future<void> requestRide(CalculationRes calculationRes, String paymentMethod) async {
    try {
      final result = await mainRepo.requestRide(requestRideReq: RequestRideReq(
          requestedRide: RequestedRide(
              finalPrice: calculationRes.finalPrice.toDouble(),
              distance: calculationRes.distance.toDouble(),
              duration: calculationRes.duration,
              pickupLocation: calculationRes.pickupLocation,
              dropoffLocation: calculationRes.dropoffLocation,
              coordinates: calculationRes.coordinates,
              paymentMethod: paymentMethod,
              vehicleType: calculationRes.vehicleType
          )
      ));
      if (result.code == 200) {
        AppSnackbar.showInfo(title: "Đặt xe thành công", message: "Bạn đã đặt xe thành công");
      } else {
        AppSnackbar.showError(title: "Đặt xe không thành công");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getListCoupon() async {
    try {
      final result = await mainRepo.getListCoupon();
      if (result.code == 200) {
        emit(state.copyWith(listCoupon: result.data));
      } else {
        // handle error
      }
    } catch (e) {
      print(e);
    }
  }

  void setCouponChooseIndex(int index) {
    emit(state.copyWith(couponChooseIndex: index));
  }

  Future<void> getBookingCalculation() async {
    try {
      final result = await mainRepo.getBookingCalculation(
        pickupLocation: state.rideEntity!.pickupLocation!,
        dropoffLocation: state.rideEntity!.dropoffLocation!,
        coupon: state.listCoupon!.coupons[state.couponChooseIndex].code,
        vehicleType: state.rideEntity!.vehicleType!,
      );

      if (result.code == 200 && result.data != null) {

      }
    } catch (e) {
      print(e);
    } finally {
      AppLoadingIndicator.hide();
    }
  }
}
