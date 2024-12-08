import 'package:bloc/bloc.dart';
import 'package:fare_riding_app/ui/common/app_images.dart';
import 'package:fare_riding_app/ui/common/app_snackbar.dart';
import 'package:fare_riding_app/ui/pages/ride_process/argument/ride_process_argument.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

import '../../../constant/AppColor.dart';
import '../../../di/app_module.dart';
import '../../../models/entities/location.dart';
import '../../../repository/main_repository.dart';
import '../../../router/route_config.dart';
part 'ride_process_state.dart';

class RideProcessCubit extends Cubit<RideProcessState> {
  RideProcessCubit() : super(RideProcessState());
  RideProcessArgument rideProcessArgument = Get.arguments;
  final MainRepository mainRepo = getIt.get<MainRepository>();


  void init()async{
    List<LatLng> latLngList = rideProcessArgument.coordinates.coordinates
        .map((location) => LatLng(location.lat, location.lng))
        .toList();
    updatePolylines(latLngList);
    emit(state.copyWith(endLocation: Location(lat: double.parse(rideProcessArgument.requestRide.pickupLat), lng: double.parse(rideProcessArgument.requestRide.pickupLng))));
  }

  Future<void> getDirection(double startLocationLat,double startLocationLng,double endLocationLat,double endLocationLng) async {
    try{
      final result = await mainRepo.getDirection(startLocationLat: startLocationLat, startLocationLng: startLocationLng, endLocationLat: endLocationLat, endLocationLng: endLocationLng);
      if(result.code == 200){
      }
    }catch(e){
    }
  }

  void updatePolylines(List<LatLng> latLngList){
    Set<Polyline> _polyline = {};
    _polyline.add(
      Polyline(
        polylineId: PolylineId('Route'),
        points: latLngList,
        color: AppColor.primary,
      ),
    );
    emit(state.copyWith(polyline: _polyline));
  }

  Future<void> cancelRide(String note) async{
    try{
      final response = await mainRepo.updateRideNote(id: rideProcessArgument.ride_id, note: note);
      final result = await mainRepo.updateRideStatus(id: rideProcessArgument.ride_id, status: 'Huỷ');
      if(result.code == 200){
        Get.toNamed(RouteConfig.main);
      }
      else{

      }
    }catch(e){
      print(e);
    }
  }

  Future<void> updateRideNote(String note) async {
    try{
      final result = await mainRepo.updateRideNote(id: rideProcessArgument.ride_id, note: note);
    }catch(e){
      AppSnackbar.showError(title: "Xảy ra lỗi");
    }
  }
}
