import 'package:fare_riding_app/models/response/fare/calculation_res.dart';

class RideEntity {
  final List<CalculationRes>? calculationRes;
  final String? vehicleType;
  final String? pickupLocation;
  final String? dropoffLocation;
  final String couponCode;

  RideEntity(
      {this.calculationRes,
      this.pickupLocation,
      this.dropoffLocation,
      this.couponCode = '',
      this.vehicleType});
}
