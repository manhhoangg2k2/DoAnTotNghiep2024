import 'package:equatable/equatable.dart';

import '../models/enums/load_status.dart';

class SplashState extends Equatable {
  final LoadStatus fetchProfileStatus;
  final bool isLoggedIn;

  const SplashState({
    this.fetchProfileStatus = LoadStatus.initial,
    this.isLoggedIn = false,
  });

  @override
  List<Object?> get props => [
        fetchProfileStatus,
        isLoggedIn,
      ];

  SplashState copyWith({
    LoadStatus? fetchProfileStatus,
    bool? isLoggedIn,
  }) {
    return SplashState(
      fetchProfileStatus: fetchProfileStatus ?? this.fetchProfileStatus,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}
