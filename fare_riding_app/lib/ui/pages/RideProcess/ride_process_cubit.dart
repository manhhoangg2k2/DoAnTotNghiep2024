import 'package:bloc/bloc.dart';
import 'package:fare_riding_app/models/entities/location.dart';
import 'package:fare_riding_app/models/enums/ride_status.dart';
import 'package:fare_riding_app/models/response/fare/ride_res.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'ride_process_state.dart';

class RideProcessCubit extends Cubit<RideProcessState> {
  late RideRes rideRes;
  RideProcessCubit() : super(RideProcessState()){
    rideRes = Get.arguments;
    init();
  }

  void init(){

  }
}
