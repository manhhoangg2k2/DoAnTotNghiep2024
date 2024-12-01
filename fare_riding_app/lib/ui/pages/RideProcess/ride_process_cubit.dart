import 'package:bloc/bloc.dart';
import 'package:fare_riding_app/models/entities/location.dart';
import 'package:fare_riding_app/models/enums/ride_status.dart';
import 'package:fare_riding_app/models/response/fare/ride_res.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

import '../../../di/app_module.dart';
import '../../../repository/main_repository.dart';
import '../../../router/route_config.dart';
import '../../common/app_snackbar.dart';

part 'ride_process_state.dart';

class RideProcessCubit extends Cubit<RideProcessState> {
  final MainRepository mainRepo = getIt.get<MainRepository>();

  late RideRes rideRes;
  RideProcessCubit() : super(RideProcessState()){
    rideRes = Get.arguments;
    init();
  }

  void init(){

  }

  Future<void> cancelRide(String note) async{
    await updateRideNote(note);
    try{
      final result = await mainRepo.updateRideStatus(id: rideRes.ride!.id.toString(), status: 'Huỷ');
      if(result.code == 200){
      }
      else{

      }
    }catch(e){
      print(e);
    }
  }

  Future<void> updateRideNote(String note) async {
    try{
      final result = await mainRepo.updateRideNote(id: rideRes.ride!.id.toString(), note: note);
    }catch(e){
      AppSnackbar.showError(title: "Xảy ra lỗi");
    }
  }
}
