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
  @JsonKey(name: 'customer')
  final Customer customer;

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
    required this.customer,
  });

  factory RideHistoryRes.fromJson(Map<String, dynamic> json) =>
      _$RideHistoryResFromJson(json);

  Map<String, dynamic> toJson() => _$RideHistoryResToJson(this);
}

@JsonSerializable()
class Customer {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @JsonKey(name: 'gender')
  final String gender;
  @JsonKey(name: 'passcode')
  final String passcode;
  @JsonKey(name: 'balance')
  final String balance;
  @JsonKey(name: 'createddate')
  final String createdDate;
  @JsonKey(name: 'email')
  final String email;

  Customer({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.gender,
    required this.passcode,
    required this.balance,
    required this.createdDate,
    required this.email,
  });

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
