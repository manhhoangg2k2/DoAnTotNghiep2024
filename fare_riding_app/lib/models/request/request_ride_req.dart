import 'package:json_annotation/json_annotation.dart';

import '../entities/location.dart';

part 'request_ride_req.g.dart';

@JsonSerializable()
class RequestRideReq {
  @JsonKey(name: 'requested_ride')
  final RequestedRide requestedRide;

  RequestRideReq({
    required this.requestedRide,
  });

  factory RequestRideReq.fromJson(Map<String, dynamic> json) => _$RequestRideReqFromJson(json);

  Map<String, dynamic> toJson() => _$RequestRideReqToJson(this);
}

@JsonSerializable()
class RequestedRide {
  @JsonKey(name: 'final_price')
  final double finalPrice;
  @JsonKey(name: 'distance')
  final double distance;
  @JsonKey(name: 'duration')
  final int duration;
  @JsonKey(name: 'pickup_location')
  final Location pickupLocation;
  @JsonKey(name: 'dropoff_location')
  final Location dropoffLocation;
  @JsonKey(name: 'coordinates')
  final List<Location> coordinates;
  @JsonKey(name: 'payment_method')
  final String paymentMethod;
  @JsonKey(name: 'vehicle_type')
  final String vehicleType;

  RequestedRide({
    required this.finalPrice,
    required this.distance,
    required this.duration,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.coordinates,
    required this.paymentMethod,
    required this.vehicleType,
  });

  factory RequestedRide.fromJson(Map<String, dynamic> json) => _$RequestedRideFromJson(json);

  Map<String, dynamic> toJson() => _$RequestedRideToJson(this);
}

