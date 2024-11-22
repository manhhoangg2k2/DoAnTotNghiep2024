part of 'home_cubit.dart';

@immutable
class HomeState {
  final int index;
  final bool isActive;
  final RequestRidesRes? requestRidesRes;

  const HomeState({
    this.index = 0,
    this.isActive = false,
    this.requestRidesRes
  });

  HomeState copyWith({int? index, bool? isActive, RequestRidesRes? requestRidesRes}) {
    return HomeState(
      index: index ?? this.index,
      isActive: isActive ?? this.isActive,
      requestRidesRes: requestRidesRes ?? this.requestRidesRes
    );
  }
}

// class HomeMenuInitial extends HomeMenuState {}
