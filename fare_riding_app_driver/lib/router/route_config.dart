
import 'package:fare_riding_app/ui/pages/Authentication/log_in/view/authentication_screen.dart';
import 'package:fare_riding_app/ui/pages/Home/view/home_screen.dart';
import 'package:fare_riding_app/ui/pages/Home/view/home_screen1.dart';
import 'package:fare_riding_app/ui/pages/booking_screen/widget/choose_location/choose_locationn.dart';
import 'package:fare_riding_app/ui/pages/ride_process/ride_process.dart';
import 'package:get/get.dart';

import '../splash/splash_page.dart';
import '../ui/pages/booking_screen/booking_screen.dart';



class RouteConfig {
  RouteConfig._();

  ///main page
  static const String splash = "/splash";
  static const String chooseLocation = "/chooseLocation";
  static const String booking = "/booking";
  static const String home = "/home";
  static const String signIn = "/signIn";
  static const String requestRideDetail = "/requestRideDetail";
  static const String rideProcess = "/rideProcess";

  static final List<GetPage> getPages = [
    GetPage(name: splash, page: () => const SplashPage()),
    GetPage(name: chooseLocation, page: () => const ChooseLocation()),
    // GetPage(name: booking, page: () => const BookingScreen()),
    GetPage(name: home, page: () => const HomeScreen1()),
    GetPage(name: signIn, page: () => const AuthenticationScreen()),
    GetPage(name: rideProcess, page: () => const RideProcess()),
    // GetPage(name: requestRideDetail, page: () => const Reque()),
  ];
}
