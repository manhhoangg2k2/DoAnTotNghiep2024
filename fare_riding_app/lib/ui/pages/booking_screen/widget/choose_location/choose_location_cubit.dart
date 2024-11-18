import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fare_riding_app/models/entities/ride_entity.dart';
import 'package:fare_riding_app/models/response/fare/calculation_res.dart';
import 'package:fare_riding_app/ui/common/app_loading.dart';
import 'package:fare_riding_app/ui/pages/booking_screen/booking_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../../../models/response/place_autofill_res.dart';
import '../../../../../repository/main_repository.dart';
import '../../../../../router/route_config.dart';

part 'choose_location_state.dart';

class ChooseLocationCubit extends Cubit<ChooseLocationState> {
  ChooseLocationCubit() : super(ChooseLocationState());

  TextEditingController fromLocation = TextEditingController();
  TextEditingController toLocation = TextEditingController();
  MainRepositoryImpl mainRepo = MainRepositoryImpl();
  Dio dio = Dio();
  String vehicleType = Get.arguments;

  void Init() {}

  void getAutofillLocation(String input) async {
    String _key = "AIzaSyDNxoTUmJWGvTTHmnEw6pGo4i5cY5H14ic";
    String groundURL ='https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request = '$groundURL?input=$input&key=$_key&sessiontoken=${mainRepo.getToken()}';
    try {
      final result = await dio.get(request.toString());
      print("Result data: ${result.data}");
      if (result.statusCode == 200) {
        final data = result.data as Map<String, dynamic>;
        final placeAutofillResponse = PlaceAutofillResponse.fromJson(data);
        emit(state.copyWith(placeAutofillList: placeAutofillResponse.predictions?.map((prediction) => prediction.description).toList()));
      } else {
        print('Failed to load predictions');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getBookingCalculation(String pickupLocation, String dropoffLocation, String coupon, BuildContext context) async {
    AppLoadingIndicator.show(context);
    try {
      final result = await mainRepo.getBookingCalculation(
        pickupLocation: pickupLocation,
        dropoffLocation: dropoffLocation,
        coupon: coupon,
        vehicleType: vehicleType,
      );

      if (result.code == 200 && result.data != null) {
        Get.offAllNamed(RouteConfig.booking, arguments: RideEntity(calculationRes: result.data, pickupLocation: pickupLocation, dropoffLocation: dropoffLocation, vehicleType: vehicleType));
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => BookingScreen(calculationRes: result.data!, pickupLocation: pickupLocation, dropoffLocation: dropoffLocation,)),
        // );
      }
    } catch (e) {
      print(e);
    } finally {
      AppLoadingIndicator.hide();
    }
  }
}
