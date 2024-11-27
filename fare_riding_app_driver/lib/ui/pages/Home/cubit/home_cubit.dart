import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:fare_riding_app/blocs/app_cubit.dart';
import 'package:fare_riding_app/constant/AppTabs.dart';
import 'package:fare_riding_app/models/response/fare/request_rides_res.dart';
import 'package:fare_riding_app/ui/common/app_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../di/app_module.dart';
import '../../../../repository/main_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());
  final MainRepository mainRepo = getIt.get<MainRepository>();


  void Init()async{
    // emit(state.copyWith(requestRidesRes: RequestRidesRes(listRequestRide: [])));
    // await getListRequestRides();
  }

  void changeIndex(int value){
    emit(state.copyWith(index: value));
  }
  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const R = 6371; // Bán kính trái đất tính bằng km
    final dLat = _degreeToRadian(lat2 - lat1);
    final dLon = _degreeToRadian(lon2 - lon1);
    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreeToRadian(lat1)) * cos(_degreeToRadian(lat2)) *
            sin(dLon / 2) * sin(dLon / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return R * c; // Khoảng cách tính bằng km
  }

  double _degreeToRadian(double degree) {
    return degree * pi / 180;
  }

  void clearListRide(){
    emit(state.copyWith(requestRidesRes: RequestRidesRes(listRequestRide: [])));
  }

  Future<void> getListRequestRides(BuildContext context) async {
    AppLoadingIndicator.show(context);
    try{
      final result = await mainRepo.getListRequestRides();
      if(result.code == 200){
        print(result.data);
        final currentLocation = context.read<AppCubit>().state.currentLocation;
        List<RequestRide> _listTemp = [];
        result.data!.listRequestRide.forEach((requestRide) {
          double pickupLat = double.parse(requestRide.pickupLat);
          double pickupLng = double.parse(requestRide.pickupLng);

          double distance = calculateDistance(currentLocation!.lat, currentLocation.lng, pickupLat, pickupLng);

          if (distance <= 3) {
            _listTemp.add(requestRide);
          }
        });
        emit(state.copyWith(requestRidesRes: RequestRidesRes(listRequestRide: _listTemp)));
        AppLoadingIndicator.hide();
      }
    }catch(e){
      print(e);
      AppLoadingIndicator.hide();
    }
  }
}
