// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride_info_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RideInfoRes _$RideInfoResFromJson(Map<String, dynamic> json) => RideInfoRes(
      id: json['id'] as String,
      driverId: (json['driver_id'] as num).toInt(),
      customerId: (json['customer_id'] as num).toInt(),
      pickupLocation: json['pickup_location'] as String,
      dropoffLocation: json['dropoff_location'] as String,
      pickupTime: json['pickup_time'] == null
          ? null
          : DateTime.parse(json['pickup_time'] as String),
      dropoffTime: json['dropoff_time'] == null
          ? null
          : DateTime.parse(json['dropoff_time'] as String),
      status: json['status'] as String,
      fare: json['fare'] as String,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$RideInfoResToJson(RideInfoRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'driver_id': instance.driverId,
      'customer_id': instance.customerId,
      'pickup_location': instance.pickupLocation,
      'dropoff_location': instance.dropoffLocation,
      'pickup_time': instance.pickupTime?.toIso8601String(),
      'dropoff_time': instance.dropoffTime?.toIso8601String(),
      'status': instance.status,
      'fare': instance.fare,
      'note': instance.note,
    };
