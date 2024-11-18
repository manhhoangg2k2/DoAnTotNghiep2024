import 'package:json_annotation/json_annotation.dart';

import '../../entities/location.dart';

part 'calculation_res.g.dart';

@JsonSerializable()
class CalculationRes {
  @JsonKey(name: 'final_price')
  final int finalPrice;
  final int distance;
  final int duration;
  @JsonKey(name: 'pickup_location')
  final Location pickupLocation;
  @JsonKey(name: 'dropoff_location')
  final Location dropoffLocation;
  final List<Location> coordinates;
  @JsonKey(name: 'vehicle_type')
  final String vehicleType;

  CalculationRes({
    required this.finalPrice,
    required this.distance,
    required this.duration,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.coordinates,
    required this.vehicleType,
  });

  factory CalculationRes.fromJson(Map<String, dynamic> json) => _$CalculationResFromJson(json);

  Map<String, dynamic> toJson() => _$CalculationResToJson(this);
}

class CalculationEntity {
  final int finalPrice;
  final int distance;
  final int duration;
  final Location pickupLocation;
  final Location dropoffLocation;
  final List<Location> coordinates;

  CalculationEntity({
    required this.finalPrice,
    required this.distance,
    required this.duration,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.coordinates,
  });
}



