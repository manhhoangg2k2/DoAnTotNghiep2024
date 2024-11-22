// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_rides_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestRidesRes _$RequestRidesResFromJson(Map<String, dynamic> json) =>
    RequestRidesRes(
      listRequestRide: (json['list_request_ride'] as List<dynamic>)
          .map((e) => RequestRide.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RequestRidesResToJson(RequestRidesRes instance) =>
    <String, dynamic>{
      'list_request_ride': instance.listRequestRide,
    };

RequestRide _$RequestRideFromJson(Map<String, dynamic> json) => RequestRide(
      id: json['id'] as String,
      customerId: (json['customer_id'] as num).toInt(),
      pickupLng: json['pickup_lng'] as String,
      pickupLat: json['pickup_lat'] as String,
      dropoffLng: json['dropoff_lng'] as String,
      dropoffLat: json['dropoff_lat'] as String,
      pickupAddress: json['pickup_address'] as String,
      dropoffAddress: json['dropoff_address'] as String,
      distance: json['distance'] as String,
      finalPrice: json['final_price'] as String,
      duration: json['duration'] as String,
      paymentMethod: json['payment_method'] as String,
      vehicleType: json['vehicle_type'] as String,
      coordinates: json['coordinates'] as String,
    );

Map<String, dynamic> _$RequestRideToJson(RequestRide instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_id': instance.customerId,
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
      'coordinates': instance.coordinates,
    };
