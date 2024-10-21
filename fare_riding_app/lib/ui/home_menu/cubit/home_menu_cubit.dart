import 'package:bloc/bloc.dart';
import 'package:fare_riding_app/constant/AppTabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'home_menu_state.dart';

class HomeMenuCubit extends Cubit<HomeMenuState> {
  HomeMenuCubit() : super(HomeMenuState());

  void changeIndex(int value){
    emit(state.copyWith(index: value));
  }
}
