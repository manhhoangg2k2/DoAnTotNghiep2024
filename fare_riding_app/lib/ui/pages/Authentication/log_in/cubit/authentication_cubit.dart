import 'package:bloc/bloc.dart';
import 'package:fare_riding_app/ui/pages/Home/view/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../blocs/app_cubit.dart';
import '../../../../../repository/auth_repository.dart';
import '../../sign_up/view/set_passcode_screen.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationState());

  AuthRepositoryImpl authRepo = AuthRepositoryImpl();


  Future<void> authentication(String phoneNumber, BuildContext context)async{
    try{
      final result = await authRepo.authentication(phoneNumber);
      if(result.code == 200){
        await authRepo.saveToken(result.data!);
        context.read<AppCubit>().getUserSession();
        Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen()));
      }
      else{
        
      }
    }catch(e){

    }
  }
}
