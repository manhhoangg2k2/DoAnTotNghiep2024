// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculation_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalculationRes _$CalculationResFromJson(Map<String, dynamic> json) =>
    CalculationRes(
      finalPrice: (json['final_price'] as num).toInt(),
      distance: (json['distance'] as num).toInt(),
      duration: (json['duration'] as num).toInt(),
      pickupLocation:
          Location.fromJson(json['pickup_location'] as Map<String, dynamic>),
      dropoffLocation:
          Location.fromJson(json['dropoff_location'] as Map<String, dynamic>),
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => Location.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CalculationResToJson(CalculationRes instance) =>
    <String, dynamic>{
      'final_price': instance.finalPrice,
      'distance': instance.distance,
      'duration': instance.duration,
      'pickup_location': instance.pickupLocation,
      'dropoff_location': instance.dropoffLocation,
      'coordinates': instance.coordinates,
    };
