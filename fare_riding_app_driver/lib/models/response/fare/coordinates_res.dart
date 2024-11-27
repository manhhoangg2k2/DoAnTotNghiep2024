import 'package:json_annotation/json_annotation.dart';

import '../../entities/location.dart';

part 'coordinates_res.g.dart';

@JsonSerializable()
class CoordinatesRes {
  @JsonKey(name: 'coordinates')
  final List<Location> coordinates;
  @JsonKey(name: 'duration')
  final String duration;
  @JsonKey(name: 'distance')
  final int distance;


  CoordinatesRes({
    required this.coordinates,
    required this.duration,
    required this.distance,
  });

  factory CoordinatesRes.fromJson(Map<String, dynamic> json) => _$CoordinatesResFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesResToJson(this);
}
