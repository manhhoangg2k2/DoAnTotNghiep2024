import 'package:bloc/bloc.dart';
import 'package:fare_riding_app/constant/AppTabs.dart';
import 'package:fare_riding_app/models/response/fare/request_rides_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../di/app_module.dart';
import '../../../../repository/main_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());
  final MainRepository mainRepo = getIt.get<MainRepository>();


  void Init()async{
    // emit(state.copyWith(requestRidesRes: RequestRidesRes(listRequestRide: [])));
    await getListRequestRides();
  }

  void changeIndex(int value){
    emit(state.copyWith(index: value));
  }

  Future<void> getListRequestRides() async {
    try{
      final result = await mainRepo.getListRequestRides();
      if(result.code == 200){
        print(result.data);
        emit(state.copyWith(requestRidesRes: result.data));
      }
    }catch(e){
      print(e);
    }
  }
}
