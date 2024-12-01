import 'package:json_annotation/json_annotation.dart';

part 'ride_history_res.g.dart';

@JsonSerializable()
class RideHistoryRes {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'driver_id')
  final int driverId;
  @JsonKey(name: 'customer_id')
  final int customerId;
  @JsonKey(name: 'pickup_location')
  final String? pickupLocation;
  @JsonKey(name: 'dropoff_location')
  final String? dropoffLocation;
  @JsonKey(name: 'pickup_time')
  final String? pickupTime;
  @JsonKey(name: 'dropoff_time')
  final String? dropoffTime;
  @JsonKey(name: 'status')
  final String status;
  @JsonKey(name: 'fare')
  final String fare;
  @JsonKey(name: 'note')
  final String? note;
  @JsonKey(name: 'driver')
  final Driver driver;

  RideHistoryRes({
    required this.id,
    required this.driverId,
    required this.customerId,
    this.pickupLocation,
    this.dropoffLocation,
    this.pickupTime,
    this.dropoffTime,
    required this.status,
    required this.fare,
    this.note,
    required this.driver,
  });

  factory RideHistoryRes.fromJson(Map<String, dynamic> json) =>
      _$RideHistoryResFromJson(json);

  Map<String, dynamic> toJson() => _$RideHistoryResToJson(this);
}

@JsonSerializable()
class Driver {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'gender')
  final String gender;
  @JsonKey(name: 'passcode')
  final String passcode;
  @JsonKey(name: 'balance')
  final String balance;
  @JsonKey(name: 'createdate')
  final String createDate;
  @JsonKey(name: 'license_number')
  final String licenseNumber;
  @JsonKey(name: 'vehicle_id')
  final int vehicleId;
  @JsonKey(name: 'lastest_location_lat')
  final String lastestLocationLat;
  @JsonKey(name: 'lastest_location_lng')
  final String lastestLocationLng;

  Driver({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.gender,
    required this.passcode,
    required this.balance,
    required this.createDate,
    required this.licenseNumber,
    required this.vehicleId,
    required this.lastestLocationLat,
    required this.lastestLocationLng,
  });

  factory Driver.fromJson(Map<String, dynamic> json) =>
      _$DriverFromJson(json);

  Map<String, dynamic> toJson() => _$DriverToJson(this);
}
