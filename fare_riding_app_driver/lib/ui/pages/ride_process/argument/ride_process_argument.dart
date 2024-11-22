import 'package:fare_riding_app/models/entities/location.dart';
import 'package:fare_riding_app/models/response/fare/request_rides_res.dart';

class RideProcessArgument {
  final num customer_id;
  final String customer_name;
  final String customer_phone_num;
  final RequestRide requestRide;
  final List<Location> coordinates;

  RideProcessArgument({
    required this.coordinates,
    required this.customer_id,
    required this.customer_name,
    required this.customer_phone_num,
    required this.requestRide,
  });
}
