part of 'sign_up_cubit.dart';

@immutable
class SignUpState {
  final String gendle;

  const SignUpState({
    this.gendle = 'Nam',
  });

  SignUpState copyWith({String? gendle}) {
    return SignUpState(
      gendle: gendle ?? this.gendle,
    );
  }
}

class HomeMenuInitial extends SignUpState {}
