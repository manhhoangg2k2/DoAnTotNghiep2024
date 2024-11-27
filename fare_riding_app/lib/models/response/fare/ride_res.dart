import 'package:json_annotation/json_annotation.dart';

part 'ride_res.g.dart';

@JsonSerializable()
class RideRes {
  @JsonKey(name: "ride")
  Ride? ride;
  @JsonKey(name: "driver")
  Driver? driver;

  RideRes({
    this.ride,
    this.driver,
  });

  factory RideRes.fromJson(Map<String, dynamic> json) => _$RideResFromJson(json);

  Map<String, dynamic> toJson() => _$RideResToJson(this);
}

@JsonSerializable()
class Ride {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "pickup_lng")
  String? pickupLng;
  @JsonKey(name: "pickup_lat")
  String? pickupLat;
  @JsonKey(name: "dropoff_lng")
  String? dropoffLng;
  @JsonKey(name: "dropoff_lat")
  String? dropoffLat;
  @JsonKey(name: "pickup_address")
  String? pickupAddress;
  @JsonKey(name: "dropoff_address")
  String? dropoffAddress;
  @JsonKey(name: "distance")
  String? distance;
  @JsonKey(name: "final_price")
  String? finalPrice;
  @JsonKey(name: "duration")
  String? duration;
  @JsonKey(name: "payment_method")
  String? paymentMethod;
  @JsonKey(name: "vehicle_type")
  String? vehicleType;

  Ride({
    this.id,
    this.pickupLng,
    this.pickupLat,
    this.dropoffLng,
    this.dropoffLat,
    this.pickupAddress,
    this.dropoffAddress,
    this.distance,
    this.finalPrice,
    this.duration,
    this.paymentMethod,
    this.vehicleType,
  });

  factory Ride.fromJson(Map<String, dynamic> json) => _$RideFromJson(json);

  Map<String, dynamic> toJson() => _$RideToJson(this);
}

@JsonSerializable()
class Driver {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "phone_number")
  String? phoneNumber;
  @JsonKey(name: "lastest_location_lat")
  String? lastestLocationLat;
  @JsonKey(name: "lastest_location_lng")
  String? lastestLocationLng;
  @JsonKey(name: "vehicle")
  Vehicle? vehicle;

  Driver({
    this.id,
    this.name,
    this.phoneNumber,
    this.lastestLocationLat,
    this.lastestLocationLng,
    this.vehicle,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);

  Map<String, dynamic> toJson() => _$DriverToJson(this);
}

@JsonSerializable()
class Vehicle {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "vehicle_type_id")
  int? vehicleTypeId;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "code")
  String? code;

  Vehicle({
    this.id,
    this.name,
    this.vehicleTypeId,
    this.description,
    this.code,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleToJson(this);
}
