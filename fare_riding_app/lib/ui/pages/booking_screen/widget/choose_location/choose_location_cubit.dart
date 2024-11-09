import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../../models/response/place_autofill_res.dart';

part 'choose_location_state.dart';

class ChooseLocationCubit extends Cubit<ChooseLocationState> {
  ChooseLocationCubit() : super(ChooseLocationState());

  TextEditingController fromLocation = TextEditingController();
  TextEditingController toLocation = TextEditingController();
  String tokenForSession = "123456";
  Dio dio = Dio();

  void Init(){

  }

  void getAutofillLocation(String input) async {
    String _key = "AIzaSyDNxoTUmJWGvTTHmnEw6pGo4i5cY5H14ic";
    String groundURL ='https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request = '$groundURL?input=$input&key=$_key&sessiontoken=$tokenForSession';
    try{
      final result = await dio.get(request.toString());
      print("Result data: ${result.data}");
      if (result.statusCode == 200) {
        final data = result.data as Map<String, dynamic>;

        final placeAutofillResponse = PlaceAutofillResponse.fromJson(data);
        emit(state.copyWith(placeAutofillList: placeAutofillResponse.predictions?.map((prediction) => prediction.description).toList()));
      } else {
        print('Failed to load predictions');
      }
    }catch(E){
      print(E);
    }
  }
}
