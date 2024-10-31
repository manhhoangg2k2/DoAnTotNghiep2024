import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../repository/auth_repository.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationState());

  AuthRepositoryImpl authRepo = AuthRepositoryImpl();


  Future<void> authentication(String phoneNumber)async{
    try{
      final result = await authRepo.authentication(phoneNumber);
      if(result.code == 200){
        await authRepo.saveToken(result.data!);
      }
      else{
        
      }
    }catch(e){

    }
  }
}
