import 'package:json_annotation/json_annotation.dart';

part 'calculation_res.g.dart';

@JsonSerializable()
class CalculationRes {
  @JsonKey(name: 'final_price')
  final int finalPrice;
  final int distance;
  final int duration;
  @JsonKey(name: 'pickup_location')
  final Location pickupLocation;
  @JsonKey(name: 'dropoff_location')
  final Location dropoffLocation;
  final List<Coordinate> coordinates;

  CalculationRes({
    required this.finalPrice,
    required this.distance,
    required this.duration,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.coordinates,
  });

  factory CalculationRes.fromJson(Map<String, dynamic> json) => _$CalculationResFromJson(json);

  Map<String, dynamic> toJson() => _$CalculationResToJson(this);
}

@JsonSerializable()
class Location {
  final double lat;
  final double lng;

  Location({
    required this.lat,
    required this.lng,
  });

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Coordinate {
  final double lat;
  final double lng;

  Coordinate({
    required this.lat,
    required this.lng,
  });

  factory Coordinate.fromJson(Map<String, dynamic> json) => _$CoordinateFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinateToJson(this);
}

extension CalculationResEx on CalculationRes {
  CalculationEntity get convertToEntity {
    return CalculationEntity(
      finalPrice: finalPrice,
      distance: distance,
      duration: duration,
      pickupLocation: pickupLocation.convertToEntity,
      dropoffLocation: dropoffLocation.convertToEntity,
      coordinates: coordinates.map((e) => e.convertToEntity).toList(),
    );
  }
}

extension LocationEx on Location {
  LocationEntity get convertToEntity {
    return LocationEntity(
      lat: lat,
      lng: lng,
    );
  }
}

extension CoordinateEx on Coordinate {
  CoordinateEntity get convertToEntity {
    return CoordinateEntity(
      lat: lat,
      lng: lng,
    );
  }
}

class CalculationEntity {
  final int finalPrice;
  final int distance;
  final int duration;
  final LocationEntity pickupLocation;
  final LocationEntity dropoffLocation;
  final List<CoordinateEntity> coordinates;

  CalculationEntity({
    required this.finalPrice,
    required this.distance,
    required this.duration,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.coordinates,
  });
}

class LocationEntity {
  final double lat;
  final double lng;

  LocationEntity({
    required this.lat,
    required this.lng,
  });
}

class CoordinateEntity {
  final double lat;
  final double lng;

  CoordinateEntity({
    required this.lat,
    required this.lng,
  });
}

