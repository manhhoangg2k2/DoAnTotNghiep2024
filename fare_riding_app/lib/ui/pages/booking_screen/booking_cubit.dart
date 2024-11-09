import 'package:bloc/bloc.dart';
import 'package:fare_riding_app/ui/common/app_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingState());
  TextEditingController fromLocation = TextEditingController();
  TextEditingController toLocation = TextEditingController();

  void Init(){
  }
}
