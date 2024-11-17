import 'package:bloc/bloc.dart';
import 'package:fare_riding_app/constant/AppTabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  void changeIndex(int value){
    emit(state.copyWith(index: value));
  }
}
