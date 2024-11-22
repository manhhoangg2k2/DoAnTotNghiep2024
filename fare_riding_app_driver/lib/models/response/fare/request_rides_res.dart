import 'package:json_annotation/json_annotation.dart';

import '../../entities/location.dart';

part 'request_rides_res.g.dart';

@JsonSerializable()
class RequestRidesRes {
  @JsonKey(name: 'list_request_ride')
  final List<RequestRide> listRequestRide;

  RequestRidesRes({
    required this.listRequestRide,
  });

  factory RequestRidesRes.fromJson(Map<String, dynamic> json) => _$RequestRidesResFromJson(json);

  Map<String, dynamic> toJson() => _$RequestRidesResToJson(this);
}

@JsonSerializable()
class RequestRide {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'customer_id')
  final int customerId;
  @JsonKey(name: 'pickup_lng')
  final String pickupLng;
  @JsonKey(name: 'pickup_lat')
  final String pickupLat;
  @JsonKey(name: 'dropoff_lng')
  final String dropoffLng;
  @JsonKey(name: 'dropoff_lat')
  final String dropoffLat;
  @JsonKey(name: 'pickup_address')
  final String pickupAddress;
  @JsonKey(name: 'dropoff_address')
  final String dropoffAddress;
  @JsonKey(name: 'distance')
  final String distance;
  @JsonKey(name: 'final_price')
  final String finalPrice;
  @JsonKey(name: 'duration')
  final String duration;
  @JsonKey(name: 'payment_method')
  final String paymentMethod;
  @JsonKey(name: 'vehicle_type')
  final String vehicleType;
  @JsonKey(name: 'coordinates')
  final String coordinates;

  RequestRide({
    required this.id,
    required this.customerId,
    required this.pickupLng,
    required this.pickupLat,
    required this.dropoffLng,
    required this.dropoffLat,
    required this.pickupAddress,
    required this.dropoffAddress,
    required this.distance,
    required this.finalPrice,
    required this.duration,
    required this.paymentMethod,
    required this.vehicleType,
    required this.coordinates,
  });

  factory RequestRide.fromJson(Map<String, dynamic> json) => _$RequestRideFromJson(json);

  Map<String, dynamic> toJson() => _$RequestRideToJson(this);
}
