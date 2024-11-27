// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RideRes _$RideResFromJson(Map<String, dynamic> json) => RideRes(
      ride: json['ride'] == null
          ? null
          : Ride.fromJson(json['ride'] as Map<String, dynamic>),
      driver: json['driver'] == null
          ? null
          : Driver.fromJson(json['driver'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RideResToJson(RideRes instance) => <String, dynamic>{
      'ride': instance.ride,
      'driver': instance.driver,
    };

Ride _$RideFromJson(Map<String, dynamic> json) => Ride(
      id: json['id'] as String?,
      pickupLng: json['pickup_lng'] as String?,
      pickupLat: json['pickup_lat'] as String?,
      dropoffLng: json['dropoff_lng'] as String?,
      dropoffLat: json['dropoff_lat'] as String?,
      pickupAddress: json['pickup_address'] as String?,
      dropoffAddress: json['dropoff_address'] as String?,
      distance: json['distance'] as String?,
      finalPrice: json['final_price'] as String?,
      duration: json['duration'] as String?,
      paymentMethod: json['payment_method'] as String?,
      vehicleType: json['vehicle_type'] as String?,
    );

Map<String, dynamic> _$RideToJson(Ride instance) => <String, dynamic>{
      'id': instance.id,
      'pickup_lng': instance.pickupLng,
      'pickup_lat': instance.pickupLat,
      'dropoff_lng': instance.dropoffLng,
      'dropoff_lat': instance.dropoffLat,
      'pickup_address': instance.pickupAddress,
      'dropoff_address': instance.dropoffAddress,
      'distance': instance.distance,
      'final_price': instance.finalPrice,
      'duration': instance.duration,
      'payment_method': instance.paymentMethod,
      'vehicle_type': instance.vehicleType,
    };

Driver _$DriverFromJson(Map<String, dynamic> json) => Driver(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      lastestLocationLat: json['lastest_location_lat'] as String?,
      lastestLocationLng: json['lastest_location_lng'] as String?,
      vehicle: json['vehicle'] == null
          ? null
          : Vehicle.fromJson(json['vehicle'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'lastest_location_lat': instance.lastestLocationLat,
      'lastest_location_lng': instance.lastestLocationLng,
      'vehicle': instance.vehicle,
    };

Vehicle _$VehicleFromJson(Map<String, dynamic> json) => Vehicle(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      vehicleTypeId: (json['vehicle_type_id'] as num?)?.toInt(),
      description: json['description'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$VehicleToJson(Vehicle instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'vehicle_type_id': instance.vehicleTypeId,
      'description': instance.description,
      'code': instance.code,
    };
