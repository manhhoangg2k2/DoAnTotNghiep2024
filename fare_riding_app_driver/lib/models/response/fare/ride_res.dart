import 'package:json_annotation/json_annotation.dart';

import '../../entities/location.dart';

part 'ride_res.g.dart';

@JsonSerializable()
class RideRes {
  @JsonKey(name: 'id')
  final String listRequestRide;
  @JsonKey(name: 'customer')
  final Customer customer;

  RideRes({
    required this.listRequestRide,
    required this.customer,
  });

  factory RideRes.fromJson(Map<String, dynamic> json) => _$RideResFromJson(json);

  Map<String, dynamic> toJson() => _$RideResToJson(this);
}

@JsonSerializable()
class Customer {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  Customer({
    required this.id,
    required this.name,
    required this.phoneNumber,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
