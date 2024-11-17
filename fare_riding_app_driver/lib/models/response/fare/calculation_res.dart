import 'package:json_annotation/json_annotation.dart';

import '../../entities/location.dart';

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
  final List<Location> coordinates;

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


// extension CalculationResEx on CalculationRes {
//   CalculationEntity get convertToEntity {
//     return CalculationEntity(
//       finalPrice: finalPrice,
//       distance: distance,
//       duration: duration,
//       pickupLocation: pickupLocation.convertToEntity,
//       dropoffLocation: dropoffLocation.convertToEntity,
//       coordinates: coordinates.map((e) => e.convertToEntity).toList(),
//     );
//   }
// }

class CalculationEntity {
  final int finalPrice;
  final int distance;
  final int duration;
  final Location pickupLocation;
  final Location dropoffLocation;
  final List<Location> coordinates;

  CalculationEntity({
    required this.finalPrice,
    required this.distance,
    required this.duration,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.coordinates,
  });
}



