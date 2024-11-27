// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinates_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordinatesRes _$CoordinatesResFromJson(Map<String, dynamic> json) =>
    CoordinatesRes(
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => Location.fromJson(e as Map<String, dynamic>))
          .toList(),
      duration: json['duration'] as String,
      distance: (json['distance'] as num).toInt(),
    );

Map<String, dynamic> _$CoordinatesResToJson(CoordinatesRes instance) =>
    <String, dynamic>{
      'coordinates': instance.coordinates,
      'duration': instance.duration,
      'distance': instance.distance,
    };
