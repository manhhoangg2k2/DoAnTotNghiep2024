part of 'ride_process_cubit.dart';

@immutable
class RideProcessState {
  final Location? endLocation;
  final Set<Polyline> polyline;

  const RideProcessState({this.endLocation, this.polyline = const {}, });

  RideProcessState copyWith({Location? endLocation, Set<Polyline>? polyline, BitmapDescriptor? currentLocationIcon}) {
    return RideProcessState(endLocation: endLocation ?? this.endLocation,
    polyline: polyline ?? this.polyline);
  }
}
