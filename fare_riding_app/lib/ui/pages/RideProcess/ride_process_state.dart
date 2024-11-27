part of 'ride_process_cubit.dart';

@immutable
class RideProcessState {
  final Set<Polyline> polyline;
  final Location? driverLocation;
  final RideStatus rideStatus;
  final int driverDuration;

  const RideProcessState({
    this.polyline = const {},
    this.driverLocation,
    this.rideStatus = RideStatus.coming,
    this.driverDuration = 0
  });

  RideProcessState copyWith({Set<Polyline>? polyline, Location? driverLocation, RideStatus? rideStatus, int? driverDuration}) {
    return RideProcessState(
        polyline: polyline ?? this.polyline,
        driverLocation: driverLocation ?? this.driverLocation,
        rideStatus: rideStatus ?? this.rideStatus,
      driverDuration: driverDuration ?? this.driverDuration
    );
  }
}

