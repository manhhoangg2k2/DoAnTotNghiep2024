import 'package:json_annotation/json_annotation.dart';

part 'ride_info_res.g.dart';

@JsonSerializable()
class RideInfoRes {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'driver_id')
  final int driverId;

  @JsonKey(name: 'customer_id')
  final int customerId;

  @JsonKey(name: 'pickup_location')
  final String pickupLocation;

  @JsonKey(name: 'dropoff_location')
  final String dropoffLocation;

  @JsonKey(name: 'pickup_time')
  final DateTime? pickupTime;

  @JsonKey(name: 'dropoff_time')
  final DateTime? dropoffTime;

  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'fare')
  final String fare;

  @JsonKey(name: 'note')
  final String? note;

  RideInfoRes({
    required this.id,
    required this.driverId,
    required this.customerId,
    required this.pickupLocation,
    required this.dropoffLocation,
    this.pickupTime,
    this.dropoffTime,
    required this.status,
    required this.fare,
    this.note,
  });

  factory RideInfoRes.fromJson(Map<String, dynamic> json) =>
      _$RideInfoResFromJson(json);

  Map<String, dynamic> toJson() => _$RideInfoResToJson(this);
}
