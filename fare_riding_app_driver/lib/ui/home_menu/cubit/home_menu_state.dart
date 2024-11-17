part of 'home_menu_cubit.dart';

@immutable
class HomeMenuState {
  final int index;

  const HomeMenuState({
    this.index = 0,
  });

  HomeMenuState copyWith({int? index}) {
    return HomeMenuState(
      index: index ?? this.index,
    );
  }
}

class HomeMenuInitial extends HomeMenuState {}
