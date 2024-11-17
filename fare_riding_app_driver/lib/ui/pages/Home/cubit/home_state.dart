part of 'home_cubit.dart';

@immutable
class HomeState {
  final int index;

  const HomeState({
    this.index = 0,
  });

  HomeState copyWith({int? index}) {
    return HomeState(
      index: index ?? this.index,
    );
  }
}

// class HomeMenuInitial extends HomeMenuState {}
