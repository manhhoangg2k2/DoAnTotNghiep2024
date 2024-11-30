import 'package:fare_riding_app/models/entities/location.dart';
import 'package:fare_riding_app/models/response/fare/coordinates_res.dart';
import 'package:fare_riding_app/models/response/fare/request_rides_res.dart';

class RideProcessArgument {
  final String ride_id;
  final num customer_id;
  final String customer_name;
  final String customer_phone_num;
  final RequestRide requestRide;
  final CoordinatesRes coordinates;

  RideProcessArgument({
    required this.ride_id,
    required this.coordinates,
    required this.customer_id,
    required this.customer_name,
    required this.customer_phone_num,
    required this.requestRide,
  });
}
