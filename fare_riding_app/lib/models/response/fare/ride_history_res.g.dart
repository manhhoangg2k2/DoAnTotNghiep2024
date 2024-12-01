// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride_history_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RideHistoryRes _$RideHistoryResFromJson(Map<String, dynamic> json) =>
    RideHistoryRes(
      id: json['id'] as String,
      driverId: (json['driver_id'] as num).toInt(),
      customerId: (json['customer_id'] as num).toInt(),
      pickupLocation: json['pickup_location'] as String?,
      dropoffLocation: json['dropoff_location'] as String?,
      pickupTime: json['pickup_time'] as String?,
      dropoffTime: json['dropoff_time'] as String?,
      status: json['status'] as String,
      fare: json['fare'] as String,
      note: json['note'] as String?,
      driver: Driver.fromJson(json['driver'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RideHistoryResToJson(RideHistoryRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'driver_id': instance.driverId,
      'customer_id': instance.customerId,
      'pickup_location': instance.pickupLocation,
      'dropoff_location': instance.dropoffLocation,
      'pickup_time': instance.pickupTime,
      'dropoff_time': instance.dropoffTime,
      'status': instance.status,
      'fare': instance.fare,
      'note': instance.note,
      'driver': instance.driver,
    };

Driver _$DriverFromJson(Map<String, dynamic> json) => Driver(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      phoneNumber: json['phone_number'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      passcode: json['passcode'] as String,
      balance: json['balance'] as String,
      createDate: json['createdate'] as String,
      licenseNumber: json['license_number'] as String,
      vehicleId: (json['vehicle_id'] as num).toInt(),
      lastestLocationLat: json['lastest_location_lat'] as String,
      lastestLocationLng: json['lastest_location_lng'] as String,
    );

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'gender': instance.gender,
      'passcode': instance.passcode,
      'balance': instance.balance,
      'createdate': instance.createDate,
      'license_number': instance.licenseNumber,
      'vehicle_id': instance.vehicleId,
      'lastest_location_lat': instance.lastestLocationLat,
      'lastest_location_lng': instance.lastestLocationLng,
    };
