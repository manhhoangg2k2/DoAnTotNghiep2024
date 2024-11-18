// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_ride_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestRideReq _$RequestRideReqFromJson(Map<String, dynamic> json) =>
    RequestRideReq(
      requestedRide: RequestedRide.fromJson(
          json['requested_ride'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RequestRideReqToJson(RequestRideReq instance) =>
    <String, dynamic>{
      'requested_ride': instance.requestedRide,
    };

RequestedRide _$RequestedRideFromJson(Map<String, dynamic> json) =>
    RequestedRide(
      finalPrice: (json['final_price'] as num).toDouble(),
      distance: (json['distance'] as num).toDouble(),
      duration: (json['duration'] as num).toInt(),
      pickupLocation:
          Location.fromJson(json['pickup_location'] as Map<String, dynamic>),
      dropoffLocation:
          Location.fromJson(json['dropoff_location'] as Map<String, dynamic>),
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => Location.fromJson(e as Map<String, dynamic>))
          .toList(),
      paymentMethod: json['payment_method'] as String,
      vehicleType: json['vehicle_type'] as String,
    );

Map<String, dynamic> _$RequestedRideToJson(RequestedRide instance) =>
    <String, dynamic>{
      'final_price': instance.finalPrice,
      'distance': instance.distance,
      'duration': instance.duration,
      'pickup_location': instance.pickupLocation,
      'dropoff_location': instance.dropoffLocation,
      'coordinates': instance.coordinates,
      'payment_method': instance.paymentMethod,
      'vehicle_type': instance.vehicleType,
    };
